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
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (ctx, constraints) {
          final isMobile = constraints.maxWidth < Sizes.small;
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
              child: Text(
                result.account,
                overflow: TextOverflow.ellipsis,
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
              child: Text(
                result.privateKey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );

          return Container(
            width: double.infinity,
            height: isMobile ? 80 : 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(
              bottom: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: CustomColors.dark100,
            ),
            child: isMobile
                ? Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: Text('$index'),
                        ),
                      ),
                      Flexible(
                        flex: 9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            accountResult,
                            privateKeyResult,
                          ],
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Flexible(
                        flex: 10,
                        fit: FlexFit.tight,
                        child: Text('$index'),
                      ),
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
