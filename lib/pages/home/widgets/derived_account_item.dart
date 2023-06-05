import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../constants/values/values.dart';
import '../../../models/key_derivation_result.dart';
import '../../../store/home_page/home_page_store.dart';
import 'custom_toast.dart';

class DerivedAccountItem extends StatelessWidget {
  DerivedAccountItem({
    required this.index,
    required this.result,
    super.key,
  });

  final int index;
  final KeyDerivationResult result;

  final homePageStore = GetIt.I<HomePageStore>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final accountResult = MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) {
            homePageStore.showQrCode(
              context,
              result.account,
            );
          },
          onExit: (event) {
            homePageStore.hideOverlay(context);
          },
          child: CustomToast(
            content: result.account,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    homePageStore.truncateString(result.account),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  homePageStore.lastFourDigits(result.account),
                ),
              ],
            ),
          ),
        );
        final privateKeyResult = MouseRegion(
          onEnter: (event) {
            homePageStore.showQrCode(
              context,
              result.privateKey,
            );
          },
          onExit: (event) {
            homePageStore.hideOverlay(context);
          },
          cursor: SystemMouseCursors.click,
          child: CustomToast(
            content: result.privateKey,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    homePageStore.truncateString(result.privateKey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  homePageStore.lastFourDigits(result.privateKey),
                ),
              ],
            ),
          ),
        );

        return Container(
          width: double.infinity,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(
            bottom: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: CustomColors.dark100,
          ),
          child: Row(
            children: [
              Flexible(
                flex: 10,
                fit: FlexFit.tight,
                child: Text('$index'),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 45,
                fit: FlexFit.tight,
                child: accountResult,
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 45,
                fit: FlexFit.tight,
                child: privateKeyResult,
              ),
            ],
          ),
        );
      },
    );
  }
}
