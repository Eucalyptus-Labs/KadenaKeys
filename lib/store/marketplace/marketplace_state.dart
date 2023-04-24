// Package imports:
import 'package:mobx/mobx.dart';

part 'marketplace_state.g.dart';

class MarketplaceState = _MarketplaceStateBase with _$MarketplaceState;

abstract class _MarketplaceStateBase with Store {
//   late ReactionDisposer disposer;

//   @observable
//   String lastUpdated = '';
//
//   ObservableMap<String, Decimal> assetIdToPrice = <String, Decimal>{}
//       .asObservable();
//
//   Map<String, Observable<AssetBalance>> assetIdToBalanceMap = <
//       String,
//       Observable<AssetBalance>>{};
//
//  void setupReaction() {
//     disposer = reaction((_) => isDeviceConnected, (_) {
//       if (isDeviceConnected) {
//         updateAppDate(_);
//       }
//     });
//   }
//
//   @action
//   void setBalanceState(String assetId, Decimal balance,
//       Map<String, Decimal> chainIdToBalanceMap) {
//     final price = assetIdToPrice[assetId];
//     final fiatPrice = price == null ? Decimal.zero : price * balance;
//     assetIdToBalanceMap[assetId]!.value =
//         AssetBalance(balance, fiatPrice, chainIdToBalanceMap);
//     calculateTotal();
//   }
//
// }
}
