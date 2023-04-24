// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoadingState on _LoadingState, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading, name: '_LoadingState.isLoading')).value;

  late final _$stateAtom = Atom(name: '_LoadingState.state', context: context);

  @override
  StoreStates get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StoreStates value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$errorMessageAtom = Atom(name: '_LoadingState.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$successMessageAtom = Atom(name: '_LoadingState.successMessage', context: context);

  @override
  String? get successMessage {
    _$successMessageAtom.reportRead();
    return super.successMessage;
  }

  @override
  set successMessage(String? value) {
    _$successMessageAtom.reportWrite(value, super.successMessage, () {
      super.successMessage = value;
    });
  }

  late final _$_LoadingStateActionController = ActionController(name: '_LoadingState', context: context);

  @override
  void changeState(StoreStates state) {
    final _$actionInfo = _$_LoadingStateActionController.startAction(name: '_LoadingState.changeState');
    try {
      return super.changeState(state);
    } finally {
      _$_LoadingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorMessage(String errorMessage) {
    final _$actionInfo = _$_LoadingStateActionController.startAction(name: '_LoadingState.setErrorMessage');
    try {
      return super.setErrorMessage(errorMessage);
    } finally {
      _$_LoadingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showOverlay() {
    final _$actionInfo = _$_LoadingStateActionController.startAction(name: '_LoadingState.showOverlay');
    try {
      return super.showOverlay();
    } finally {
      _$_LoadingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showSuccessOverlay() {
    final _$actionInfo = _$_LoadingStateActionController.startAction(name: '_LoadingState.showSuccessOverlay');
    try {
      return super.showSuccessOverlay();
    } finally {
      _$_LoadingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSuccessMessage(String message) {
    final _$actionInfo = _$_LoadingStateActionController.startAction(name: '_LoadingState.setSuccessMessage');
    try {
      return super.setSuccessMessage(message);
    } finally {
      _$_LoadingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
errorMessage: ${errorMessage},
successMessage: ${successMessage},
isLoading: ${isLoading}
    ''';
  }
}
