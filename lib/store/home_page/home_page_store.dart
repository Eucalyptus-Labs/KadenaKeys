import 'package:mobx/mobx.dart';

import '../../models/key_derivation_result.dart';
import '../../models/wallets.dart';

part 'home_page_store.g.dart';

class HomePageStore extends _HomePageStore with _$HomePageStore {}

abstract class _HomePageStore with Store {
  @observable
  WalletData? selectedWallet;
    
  @observable
  ObservableList<KeyDerivationResult> keys = <KeyDerivationResult>[].asObservable();

  @action
  void onWalletSelected(WalletData? data) {
    selectedWallet = data;
  }
}
