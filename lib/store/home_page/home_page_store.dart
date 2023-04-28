import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../constants/values/values.dart';
import '../../models/key_derivation_result.dart';
import '../../models/wallets.dart';

import 'dart:developer' as developer;

part 'home_page_store.g.dart';

class HomePageStore extends _HomePageStore with _$HomePageStore {}

abstract class _HomePageStore with Store {
  final menmonicController = TextEditingController();

  @observable
  WalletData? selectedWallet;

  @observable
  bool generatingPrivateKey = false;

  @observable
  bool enableButton = false;

  @observable
  String? derivationMethod, derivationPath;

  @observable
  ObservableList<KeyDerivationResult> keys =
      <KeyDerivationResult>[].asObservable();

  @action
  void onWalletSelected(WalletData? data) {
    selectedWallet = data;
    _enableButton();
  }

  Future<void> generateKeysAsync() async {
    developer.log('Generate keys');
    if (enableButton) {
      generatingPrivateKey = true;
      await Future.delayed(const Duration(seconds: 1));
      keys.clear();
      final response = await selectedWallet!.deriver.deriveKeys(
        mnemonic: menmonicController.text,
      );
      keys = response.asObservable();
      generatingPrivateKey = false;
    }
  }

  @action
  void mnemonicOnChange(String? value) {
    _enableButton();
  }

  String? mnemonicValidateInput(String? value) {
    if (value == null) {
      return null;
    }

    if (value.isEmpty) {
      return null;
    }

    if (enableButton) {
      return null;
    }

    if (selectedWallet == null) {
      return Strings.selectWallet;
    }

    return Errors.invalidInput;
  }

  void _enableButton() {
    if (selectedWallet != null) {
      _setMethodAndPath();
      if (menmonicController.text.isNotEmpty) {
        enableButton = selectedWallet!.deriver.validateMnemonic(
          menmonicController.text,
        );

        return;
      }
    }
    enableButton = false;
  }

  void _setMethodAndPath() {
    derivationMethod = selectedWallet!.derivationMethod;
    derivationPath = selectedWallet!.derivationPath;
  }
}
