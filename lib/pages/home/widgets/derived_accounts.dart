import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              height: homePageStore.keys.isEmpty ? 250 : 772,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Derived accounts',
                        style: Styles.textStyleHeader4,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 45,
                            fit: FlexFit.tight,
                            child: Row(
                              children: [
                                const Text('Accounts'),
                                SizedBox(width: 66.w),
                                const Text('Address'),
                              ],
                            ),
                          ),
                          const Flexible(
                            flex: 55,
                            fit: FlexFit.tight,
                            child: Text('Private key'),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 23.h,
                          bottom: 18.h,
                        ),
                        child: Divider(
                          color: CustomColors.light10,
                        ),
                      ),
                      if (homePageStore.keys.isNotEmpty)
                        SizedBox(
                          height: 480.h,
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
                    GenerateButton(
                      title: Strings.generateMore,
                      onPressCallback: () {},
                    ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      );
}
