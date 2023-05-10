import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../../constants/values/values.dart';
import '../../../store/home_page/home_page_store.dart';
import '../../../widgets/rounded_container.dart';
import 'derived_account_item.dart';
import 'generate_button.dart';

class DerivedAccounts extends StatelessWidget {
  DerivedAccounts({super.key});

  final homePageStore = GetIt.I<HomePageStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Column(
          children: [
            RoundedContainer(
              child: LayoutBuilder(builder: (ctx, constraints) {
                final isMobile = constraints.maxWidth < Sizes.small;
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
                        if (isMobile)
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
                        if (!isMobile)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 10,
                                  fit: FlexFit.tight,
                                  child: accountsText,
                                ),
                                Flexible(
                                  flex: 45,
                                  fit: FlexFit.tight,
                                  child: addressText,
                                ),
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
                            height: 480,
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
                        child: GenerateButton(
                          title: Strings.generateMore,
                          onPressCallback: () {},
                        ),
                      ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 24),
          ],
        ),
      );
}
