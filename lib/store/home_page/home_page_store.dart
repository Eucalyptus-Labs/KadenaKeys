import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../constants/enums/store_states.dart';
import '../../constants/values/values.dart';
import '../../models/key_derivation_result.dart';
import '../../models/wallets.dart';
import '../loading_state/loading_state.dart';

part 'home_page_store.g.dart';

class HomePageStore extends _HomePageStore with _$HomePageStore {}

// List<int> parseTopStories(String jsonString) {
//   return [];
// }

abstract class _HomePageStore with Store {
  final menmonicController = TextEditingController();
  final deriveAccountsState = LoadingState();
  final deriveMoreState = LoadingState();
  final pageController = PageController();

  OverlayEntry? overlayEntry;
  CancelableOperation<void>? cancelableOperation;
  int deriveKeyIndex = 0;
  int count = 10;

  @observable
  WalletData? selectedWallet;

  @observable
  bool isGenerateButtonEnable = false;

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

  Future<void> deriveAccounts() async {
    if (isGenerateButtonEnable) {
      deriveAccountsState.changeState(StoreStates.loading);
      deriveKeyIndex = 0;
      count = 10;
      var response = await selectedWallet!.deriver.deriveKeys(
        startIndex: deriveKeyIndex,
        count: count,
        mnemonic: menmonicController.text,
      );
      keys.clear();
      keys.addAll(response);
      deriveKeyIndex += 10;
      count += 10;
      deriveAccountsState.changeState(StoreStates.success);
    }
  }

  Future<void> deriveMore() async {
    if (isGenerateButtonEnable) {
      deriveMoreState.changeState(StoreStates.loading);
      var response = await selectedWallet!.deriver.deriveKeys(
        startIndex: deriveKeyIndex,
        count: count,
        mnemonic: menmonicController.text,
      );
      keys.addAll(response);
      deriveKeyIndex += 10;
      count += 10;
      deriveMoreState.changeState(StoreStates.success);
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

    if (isGenerateButtonEnable) {
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
        isGenerateButtonEnable = selectedWallet!.deriver.validateMnemonic(
          menmonicController.text,
        );

        return;
      }
    }
    isGenerateButtonEnable = false;
  }

  void _setMethodAndPath() {
    derivationMethod = selectedWallet!.derivationMethod;
    derivationPath = selectedWallet!.derivationPath;
  }

  void showTooltip(BuildContext context, Offset position, String text) {
    overlayEntry?.remove();
    overlayEntry = null;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx + 20,
        top: position.dy - 40,
        child: SizedBox(
          width: 200,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text(
                text,
                style: const TextStyle(
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

  String truncateString(String item) {
    String stringWithoutLastFourDigits = item.substring(0, item.length - 4);

    return stringWithoutLastFourDigits;
  }

  String lastFourDigits(String item) {
    return item.substring(item.length - 4);
  }
}
