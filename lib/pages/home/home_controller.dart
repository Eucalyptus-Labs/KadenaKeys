import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kadena_keys/utils/string_constants.dart';
import 'package:kadena_keys/utils/wallets.dart';

class HomeController extends GetxController {
  // #region Mnemonic
  final TextEditingController menmonicController = TextEditingController();
  bool enableButton = false;
  WalletData? selectedWallet;

  onWalletSelected(WalletData? data) {
    selectedWallet = data;
    _enableButton();
    update(["mnemonic"]);
  }

  generateKeys() {
    print("Generate keys");
  }

  String? mnemonicValidateInput(String? value) {
    if (value == null) return null;

    if (value.isEmpty) return null;

    if (enableButton) return null;

    if (selectedWallet == null) return StringConstants.selectWallet;

    return StringConstants.selectWallet;
  }

  void mnemonicOnChange(String? value) {
    _enableButton();
    update(["mnemonic"]);
  }

  void _enableButton() {
    if (selectedWallet != null && menmonicController.text.isNotEmpty) {
      enableButton = selectedWallet!.deriver.validateMnemonic(
        menmonicController.text,
      );
      return;
    }
    enableButton = false;
  }
  // #endregion
}
