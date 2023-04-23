import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kadena_keys/pages/home/home_controller.dart';
import 'package:kadena_keys/utils/themes/app_color_theme.dart';
import 'package:kadena_keys/utils/themes/app_text_theme.dart';

class Derivation extends StatelessWidget {
  const Derivation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: "derivation",
      builder: (controller) {
        return Column(
          children: [
            Container(
              height: 204.h,
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
                        "Derivation",
                        style: AppTextTheme.inter24White700,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 50,
                            fit: FlexFit.tight,
                            child: TextFormField(
                              controller: controller.derivationMethodController,
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: "Derivation method",
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Flexible(
                            flex: 50,
                            fit: FlexFit.tight,
                            child: TextFormField(
                              controller: controller.derivationPathController,
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: "Derivation path",
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
