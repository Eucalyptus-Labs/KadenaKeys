import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kadena_keys/pages/home/home_controller.dart';
import 'package:kadena_keys/utils/themes/app_color_theme.dart';
import 'package:kadena_keys/utils/themes/app_text_theme.dart';
import 'package:kadena_keys/utils/wallets.dart';
import 'package:kadena_keys/widgets/round_wallet_dropdown.dart';
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
            Container(
              height: 365.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: darkContainer,
              ),
              padding: EdgeInsets.all(40.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Mnemonic",
                        style: AppTextTheme.inter24White700,
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
                              Text(
                                "Mnemonic phrase",
                                style: AppTextTheme.inter14White500,
                              ),
                              SizedBox(width: 8.w),
                              const Icon(
                                Icons.info,
                                color: Colors.grey,
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
                              decoration: InputDecoration(
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
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
                              Text(
                                "Select wallet",
                                style: AppTextTheme.inter14White500,
                              ),
                              SizedBox(width: 8.w),
                              const Icon(
                                Icons.info,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 688.w,
                            // height: 48.h,
                            child: RoundedWalletDropdown(
                              selectedWallet: controller.selectedWallet,
                              onChanged: controller.onWalletSelected,
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
                            GenerateButton(
                              onPressCallback: controller.enableButton
                                  ? controller.generateKeys
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
        );
      },
    );
  }
}
