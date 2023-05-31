import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../../constants/values/values.dart';
import '../../../store/home_page/home_page_store.dart';
import '../../../utils/size_info.dart';
import '../../../widgets/rounded_container.dart';

class DerivationContainer extends StatelessWidget {
  DerivationContainer({super.key});

  final homePageStore = GetIt.I<HomePageStore>();

  @override
  Widget build(BuildContext context) {
    final isExtraSmall = SizeInfo.isMobile;

    final firstChildren = [
      Text(
        Strings.derivationMethod,
        style: Styles.textStyleCaption.copyWith(
          color: CustomColors.light100,
        ),
      ),
      if (!isExtraSmall)
        const Flexible(
          child: SizedBox(
            width: 70,
          ),
        ),
      Observer(
        builder: (context) {
          return Text(
            homePageStore.derivationMethod ?? '',
            style: Styles.textStyleCaption.copyWith(
              color: CustomColors.light50,
            ),
          );
        },
      ),
    ];

    final secondChildren = [
      Text(
        Strings.derivationPath,
        style: Styles.textStyleCaption.copyWith(
          color: CustomColors.light100,
        ),
      ),
      if (!isExtraSmall)
        const Flexible(
          child: SizedBox(
            width: 70,
          ),
        ),
      Observer(
        builder: (context) {
          return Text(
            homePageStore.derivationPath ?? '',
            style: Styles.textStyleCaption.copyWith(
              color: CustomColors.light50,
            ),
          );
        },
      )
    ];

    return Column(
      children: [
        RoundedContainer(
          bottomMargin: 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Text(
                    Strings.derivation,
                    style: Styles.textStyleHeader4,
                  ),
                ],
              ),
              LayoutBuilder(builder: (ctx, constraints) {
                return Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: Wrap(
                    alignment: (homePageStore.selectedWallet == null
                            ? isExtraSmall
                            : SizeInfo.isTablet)
                        ? WrapAlignment.start
                        : WrapAlignment.spaceEvenly,
                    runSpacing: 30,
                    spacing: 40,
                    children: [
                      isExtraSmall
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: firstChildren,
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: firstChildren,
                            ),
                      isExtraSmall
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: secondChildren,
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: secondChildren,
                            ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
