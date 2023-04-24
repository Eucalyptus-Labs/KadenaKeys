import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kadena_keys/constants/values/values.dart';
import 'package:kadena_keys/models/key_derivation_result.dart';
import 'package:kadena_keys/utils/wallets.dart';

class HomeController extends GetxController {
  // #region Mnemonic
  final menmonicController = TextEditingController();
  bool enableButton = false;
  bool generatingPrivateKey = false;
  WalletData? selectedWallet;

  onWalletSelected(WalletData? data) {
    selectedWallet = data;
    _enableButton();
    update(["mnemonic", "derivation"]);
  }

  Future<void> generateKeysAsync() async {
    print("Generate keys");
    if (enableButton) {
      generatingPrivateKey = true;
      update(["mnemonic-button"]);
      await Future.delayed(const Duration(seconds: 1));
      keys = [];
      keys = await selectedWallet!.deriver.deriveKeys(
        mnemonic: menmonicController.text,
      );
      generatingPrivateKey = false;
      update(["mnemonic-button", "derived-accounts"]);
    }
  }

  String? mnemonicValidateInput(String? value) {
    if (value == null) return null;

    if (value.isEmpty) return null;

    if (enableButton) return null;

    if (selectedWallet == null) return Strings.selectWallet;

    return Strings.invalidInput;
  }

  void mnemonicOnChange(String? value) {
    _enableButton();
    update(["mnemonic", "derivation"]);
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
  // #endregion

  // #region Derivation
  final derivationMethodController = TextEditingController();
  final derivationPathController = TextEditingController();

  void _setMethodAndPath() {
    derivationMethodController.text =
        "Derivation method: ${selectedWallet!.derivationMethod}";
    derivationPathController.text =
        "Derivation path: ${selectedWallet!.derivationPath}";
  }
  // #endregion

  // #region Derived accounts
  List<KeyDerivationResult> keys = [];
  // #endregion
}
