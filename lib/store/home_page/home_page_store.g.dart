// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on _HomePageStore, Store {
  late final _$selectedWalletAtom =
      Atom(name: '_HomePageStore.selectedWallet', context: context);

  @override
  WalletData? get selectedWallet {
    _$selectedWalletAtom.reportRead();
    return super.selectedWallet;
  }

  @override
  set selectedWallet(WalletData? value) {
    _$selectedWalletAtom.reportWrite(value, super.selectedWallet, () {
      super.selectedWallet = value;
    });
  }

  late final _$enableButtonAtom =
      Atom(name: '_HomePageStore.enableButton', context: context);

  @override
  bool get enableButton {
    _$enableButtonAtom.reportRead();
    return super.enableButton;
  }

  @override
  set enableButton(bool value) {
    _$enableButtonAtom.reportWrite(value, super.enableButton, () {
      super.enableButton = value;
    });
  }

  late final _$deriveAccountsStateAtom =
      Atom(name: '_HomePageStore.deriveAccountsState', context: context);

  @override
  StoreStates get deriveAccountsState {
    _$deriveAccountsStateAtom.reportRead();
    return super.deriveAccountsState;
  }

  @override
  set deriveAccountsState(StoreStates value) {
    _$deriveAccountsStateAtom.reportWrite(value, super.deriveAccountsState, () {
      super.deriveAccountsState = value;
    });
  }

  late final _$deriveMoreStateAtom =
      Atom(name: '_HomePageStore.deriveMoreState', context: context);

  @override
  StoreStates get deriveMoreState {
    _$deriveMoreStateAtom.reportRead();
    return super.deriveMoreState;
  }

  @override
  set deriveMoreState(StoreStates value) {
    _$deriveMoreStateAtom.reportWrite(value, super.deriveMoreState, () {
      super.deriveMoreState = value;
    });
  }

  late final _$derivationMethodAtom =
      Atom(name: '_HomePageStore.derivationMethod', context: context);

  @override
  String? get derivationMethod {
    _$derivationMethodAtom.reportRead();
    return super.derivationMethod;
  }

  @override
  set derivationMethod(String? value) {
    _$derivationMethodAtom.reportWrite(value, super.derivationMethod, () {
      super.derivationMethod = value;
    });
  }

  late final _$derivationPathAtom =
      Atom(name: '_HomePageStore.derivationPath', context: context);

  @override
  String? get derivationPath {
    _$derivationPathAtom.reportRead();
    return super.derivationPath;
  }

  @override
  set derivationPath(String? value) {
    _$derivationPathAtom.reportWrite(value, super.derivationPath, () {
      super.derivationPath = value;
    });
  }

  late final _$keysAtom = Atom(name: '_HomePageStore.keys', context: context);

  @override
  ObservableList<KeyDerivationResult> get keys {
    _$keysAtom.reportRead();
    return super.keys;
  }

  @override
  set keys(ObservableList<KeyDerivationResult> value) {
    _$keysAtom.reportWrite(value, super.keys, () {
      super.keys = value;
    });
  }

  late final _$_HomePageStoreActionController =
      ActionController(name: '_HomePageStore', context: context);

  @override
  void onWalletSelected(WalletData? data) {
    final _$actionInfo = _$_HomePageStoreActionController.startAction(
        name: '_HomePageStore.onWalletSelected');
    try {
      return super.onWalletSelected(data);
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void mnemonicOnChange(String? value) {
    final _$actionInfo = _$_HomePageStoreActionController.startAction(
        name: '_HomePageStore.mnemonicOnChange');
    try {
      return super.mnemonicOnChange(value);
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedWallet: ${selectedWallet},
enableButton: ${enableButton},
deriveAccountsState: ${deriveAccountsState},
deriveMoreState: ${deriveMoreState},
derivationMethod: ${derivationMethod},
derivationPath: ${derivationPath},
keys: ${keys}
    ''';
  }
}
