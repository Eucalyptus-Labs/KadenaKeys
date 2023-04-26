import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/values/values.dart';
import '../home_controller.dart';
import '../../../widgets/rounded_container.dart';

class Derivation extends StatelessWidget {
  const Derivation({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
      id: 'derivation',
      builder: (controller) => Column(
          children: [
            RoundedContainer(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        Strings.derivation,
                        style: Styles.textStyleHeader4,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 50,
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: Row(
                                children: [
                                  Text(
                                    Strings.derivationMethod,
                                    style: Styles.textStyleCaption.copyWith(
                                      color: CustomColors.light100,
                                    ),
                                  ),
                                  SizedBox(width: 70.w),
                                  Text(
                                    controller.derivationMethod ?? '',
                                    style: Styles.textStyleCaption.copyWith(
                                      color: CustomColors.light50,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 50,
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: Row(
                                children: [
                                  Text(
                                    Strings.derivationPath,
                                    style: Styles.textStyleCaption.copyWith(
                                      color: CustomColors.light100,
                                    ),
                                  ),
                                  SizedBox(width: 70.w),
                                  Text(
                                    controller.derivationPath ?? '',
                                    style: Styles.textStyleCaption.copyWith(
                                      color: CustomColors.light50,
                                    ),
                                  ),
                                ],
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
        ),
    );
}
