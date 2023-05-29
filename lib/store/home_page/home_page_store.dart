import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../constants/enums/store_states.dart';
import '../../constants/values/values.dart';
import '../../models/key_derivation_result.dart';
import '../../models/wallets.dart';

part 'home_page_store.g.dart';

class HomePageStore extends _HomePageStore with _$HomePageStore {}

List<int> parseTopStories(String jsonString) {
  return [];
}

abstract class _HomePageStore with Store {
  final menmonicController = TextEditingController();
  OverlayEntry? overlayEntry;
  CancelableOperation<void>? cancelableOperation;
  int deriveKeyIndex = 0;
  int count = 10;

  @observable
  WalletData? selectedWallet;

  @observable
  bool enableButton = false;

  @observable
  StoreStates deriveAccountsState = StoreStates.initial;

  @observable
  StoreStates deriveMoreState = StoreStates.initial;

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

  Future<void> deriveAccountsAsync() async {
    if (enableButton) {
      deriveAccountsState = StoreStates.loading;
      deriveKeyIndex = 0;
      count = 10;
      keys.clear();
      var response = await selectedWallet!.deriver.deriveKeys(
        startIndex: deriveKeyIndex,
        count: count,
        mnemonic: menmonicController.text,
      );
      keys.addAll(response);
      deriveKeyIndex += 10;
      count += 10;
      deriveAccountsState = StoreStates.success;
    }
  }

  Future<void> deriveMoreAsync() async {
    if (enableButton) {
      deriveMoreState = StoreStates.loading;
      keys.clear();
      var response = await selectedWallet!.deriver.deriveKeys(
        startIndex: deriveKeyIndex,
        count: count,
        mnemonic: menmonicController.text,
      );
      keys.addAll(response);
      deriveKeyIndex += 10;
      count += 10;
      deriveMoreState = StoreStates.success;
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

  void showTooltip(BuildContext context, Offset position) {
    overlayEntry?.remove();
    overlayEntry = null;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx + 20,
        top: position.dy - 40,
        child: const SizedBox(
          width: 200,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text(
                Strings.mnemonicTooltip,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  void showQrCode(BuildContext context, String data) {
    overlayEntry?.remove();
    overlayEntry = null;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        right: 0,
        child: QrImageView(
          data: data,
          version: QrVersions.auto,
          backgroundColor: Colors.white,
          size: 200,
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  void hideOverlay(BuildContext context) {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  void showCustomToast(BuildContext context, Offset position) {
    overlayEntry?.remove();
    overlayEntry = null;
    cancelableOperation?.cancel();

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx + 30,
        top: position.dy + 30,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.9),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Text(
              Strings.copiedToClipboard,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
    cancelableOperation = CancelableOperation.fromFuture(
      Future.delayed(
        const Duration(seconds: 2),
      ),
    );
    cancelableOperation!.value.whenComplete(() {
      overlayEntry?.remove();
      overlayEntry = null;
    });
  }
}
