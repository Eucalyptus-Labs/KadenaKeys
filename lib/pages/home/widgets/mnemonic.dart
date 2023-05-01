import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
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
              height: 365,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        Strings.mnemonic,
                        style: Styles.textStyleHeader4,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                Strings.selectWallet,
                                style: Styles.textStyleSubheading,
                              ),
                              SizedBox(width: 8.w),
                              Icon(
                                Icons.info,
                                color: CustomColors.light24,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 688.w,
                            child: RoundedWalletDropdown(
                              selectedWallet: homePageStore.selectedWallet,
                              onChanged: homePageStore.onWalletSelected,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 28.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                          SizedBox(
                            width: 688.w,
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
