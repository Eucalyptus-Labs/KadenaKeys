import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../../../constants/values/values.dart';
import '../../../store/home_page/home_page_store.dart';
import '../../../widgets/round_wallet_dropdown.dart';
import '../../../widgets/rounded_container.dart';
import 'generate_button.dart';

class Mnemonic extends StatelessWidget {
  Mnemonic({super.key});

  final homePageStore = GetIt.I<HomePageStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Column(
          children: [
            RoundedContainer(
              height: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 40,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          Strings.mnemonic,
                          style: Styles.textStyleHeader4,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        // color: Colors.red,
                        // width: 800,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 28),
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              // color: Colors.purple,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    child: const Text(
                                      Strings.selectWallet,
                                      style: Styles.textStyleSubheading,
                                    ),
                                  ),
                                  Icon(
                                    Icons.info,
                                    color: CustomColors.light24,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 9,
                              child: RoundedWalletDropdown(
                                selectedWallet: homePageStore.selectedWallet,
                                onChanged: homePageStore.onWalletSelected,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // alignment: WrapAlignment.spaceBetween,
                        // crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 20,
                            child: Row(
                              children: [
                                const Text(
                                  Strings.mnemonicPhrase,
                                  style: Styles.textStyleSubheading,
                                ),
                                SizedBox(width: 8.w),
                                Icon(
                                  Icons.info,
                                  color: CustomColors.light24,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 750.w,
                            ),
                            child: TextFormField(
                              controller: homePageStore.menmonicController,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: homePageStore.mnemonicValidateInput,
                              onChanged: homePageStore.mnemonicOnChange,
                              decoration: Decorations.defaultInputDecoration,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(''),
                      SizedBox(
                        width: 688.w,
                        child: Row(
                          children: [
                            GenerateButton(
                              loading: homePageStore.isGeneratingPrivateKey,
                              onPressCallback: homePageStore.enableButton
                                  ? homePageStore.generateKeysAsync
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      );
}
