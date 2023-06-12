import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../../constants/values/values.dart';
import '../../../store/home_page/home_page_store.dart';
import '../../../utils/size_info.dart';
import '../../../widgets/rounded_container.dart';
import 'derived_account_item.dart';
import 'generate_button.dart';

class DerivedAccounts extends StatelessWidget {
  DerivedAccounts({super.key});

  final homePageStore = GetIt.I<HomePageStore>();

  @override
  Widget build(BuildContext context) {
    final accountsText = Text(
      Strings.accounts,
      style: Styles.textStyleSubheading.copyWith(
        color: CustomColors.light100,
      ),
    );
    final addressText = Text(
      Strings.address,
      style: Styles.textStyleSubheading.copyWith(
        color: CustomColors.light100,
      ),
    );
    final privateKeyText = Text(
      Strings.privateKeyTitle,
      style: Styles.textStyleSubheading.copyWith(
        color: CustomColors.light100,
      ),
    );

    return Column(
      children: [
        RoundedContainer(
          bottomMargin: 24,
          child: Observer(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Wrap(
                      children: [
                        const Text(
                          "${Strings.derived} ",
                          style: Styles.textStyleHeader4,
                        ),
                        Text(
                          Strings.accounts.toLowerCase(),
                          style: Styles.textStyleHeader4,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      if (SizeInfo.isMobile)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              accountsText,
                              addressText,
                              privateKeyText,
                            ],
                          ),
                        ),
                      if (!SizeInfo.isMobile)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              if (SizeInfo.isLaptop) accountsText,
                              if (!SizeInfo.isLaptop)
                                Flexible(
                                  flex: 10,
                                  fit: FlexFit.tight,
                                  child: accountsText,
                                ),
                              const SizedBox(width: 10),
                              Flexible(
                                flex: 45,
                                fit: FlexFit.tight,
                                child: addressText,
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                flex: 45,
                                fit: FlexFit.tight,
                                child: privateKeyText,
                              ),
                            ],
                          ),
                        ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 23,
                          bottom: 18,
                        ),
                        child: Divider(
                          color: CustomColors.light10,
                        ),
                      ),
                      if (homePageStore.keys.isNotEmpty)
                        SizedBox(
                          height: 480 * (homePageStore.keys.length / 10),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              final item = homePageStore.keys[index];
                              return DerivedAccountItem(
                                index: index,
                                result: item,
                              );
                            },
                            itemCount: homePageStore.keys.length,
                          ),
                        ),
                    ],
                  ),
                  if (homePageStore.keys.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Observer(
                        builder: (context) {
                          return GenerateButton(
                            loading: homePageStore.deriveMoreState.isLoading,
                            title: Strings.deriveMore,
                            onPressCallback: homePageStore.deriveMore,
                          );
                        },
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
