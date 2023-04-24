// Package imports:
import 'package:mobx/mobx.dart';

// Project imports:
import '../../constants/enums/store_states.dart';
import '../../constants/values/values.dart';
import '../../helpers/overlay_helper.dart';

part 'loading_state.g.dart';

/// an in-memory volatile generic state holder
class LoadingState = _LoadingState with _$LoadingState;

abstract class _LoadingState with Store {
  @observable
  StoreStates state = StoreStates.initial;

  @observable
  String? errorMessage;

  @observable
  String? successMessage;

  @computed
  bool get isLoading => state == StoreStates.loading;

  @action
  void changeState(StoreStates state) => this.state = state;

  @action
  void setErrorMessage(String errorMessage) {
    this.errorMessage = errorMessage;
    showOverlay();
  }

  @action
  void showOverlay() {
    if (errorMessage != null && errorMessage!.isNotEmpty) {
      showCustomOverlayNotification(color: CustomColors.dark100, text: errorMessage!);
    }
  }

  @action
  void showSuccessOverlay() {
    if (successMessage != null && successMessage!.isNotEmpty) {
      showCustomOverlayNotification(color: CustomColors.neutralTwo100, text: successMessage!);
    }
  }

  @action
  void setSuccessMessage(String message) {
    successMessage = message;
    showSuccessOverlay();
  }
}
