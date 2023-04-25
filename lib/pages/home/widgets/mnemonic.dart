import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kadena_keys/constants/values/values.dart';
import 'package:kadena_keys/pages/home/home_controller.dart';
import 'package:kadena_keys/widgets/round_wallet_dropdown.dart';
import 'package:kadena_keys/widgets/rounded_container.dart';
import 'generate_button.dart';

class Mnemonic extends StatelessWidget {
  const Mnemonic({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: "mnemonic",
      builder: (controller) {
        return Column(
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
                              selectedWallet: controller.selectedWallet,
                              onChanged: controller.onWalletSelected,
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
                              controller: controller.menmonicController,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: controller.mnemonicValidateInput,
                              onChanged: controller.mnemonicOnChange,
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
                      const Text(""),
                      SizedBox(
                        width: 688.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GetBuilder<HomeController>(
                              id: "mnemonic-button",
                              builder: (context) {
                                return GenerateButton(
                                  loading: controller.generatingPrivateKey,
                                  onPressCallback: controller.enableButton
                                      ? controller.generateKeysAsync
                                      : null,
                                );
                              },
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
        );
      },
    );
  }
}
