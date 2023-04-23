import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kadena_keys/models/key_derivation_result.dart';
import 'package:kadena_keys/pages/home/home_controller.dart';
import 'package:kadena_keys/utils/themes/app_color_theme.dart';
import 'package:kadena_keys/utils/themes/app_text_theme.dart';

import 'generate_button.dart';

class DerivedAccounts extends StatelessWidget {
  const DerivedAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: "derived-accounts",
      builder: (controller) {
        return Column(
          children: [
            Container(
              height: controller.keys.isEmpty ? 350.h : 772.h,
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
                        "Derived accounts",
                        style: AppTextTheme.inter24White700,
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
                                Text("Accounts"),
                                SizedBox(width: 66.w),
                                Text("Address"),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 55,
                            fit: FlexFit.tight,
                            child: Container(
                              child: Text("Private key"),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 23.h,
                          bottom: 18.h,
                        ),
                        child: const Divider(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                        ),
                      ),
                      SizedBox(
                        height: controller.keys.isEmpty ? 40.h : 480.h,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final item = controller.keys[index];
                            return DerivedAccountItem(
                              index: index,
                              result: item,
                            );
                          },
                          itemCount: controller.keys.length,
                        ),
                      ),
                    ],
                  ),
                  GenerateButton(
                    onPressCallback: () {},
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

class DerivedAccountItem extends StatelessWidget {
  const DerivedAccountItem({
    required this.index,
    required this.result,
    super.key,
  });

  final int index;
  final KeyDerivationResult result;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.only(
        bottom: 8.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: derivedAccountItem,
      ),
      child: Row(
        children: [
          Flexible(
            flex: 60,
            fit: FlexFit.tight,
            child: Row(
              children: [
                Text("$index"),
                SizedBox(width: 80.w),
                Text(result.publicKey),
              ],
            ),
          ),
          Flexible(
            flex: 40,
            fit: FlexFit.tight,
            child: Container(
              child: Text(
                result.privateKey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
