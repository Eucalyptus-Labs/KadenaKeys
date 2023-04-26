import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kadena_keys/constants/values/values.dart';
import 'package:kadena_keys/pages/home/home_controller.dart';
import 'package:kadena_keys/widgets/rounded_container.dart';
import 'derived_account_item.dart';
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
            RoundedContainer(
              height: controller.keys.isEmpty ? 250 : 772,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Derived accounts",
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
                                const Text("Accounts"),
                                SizedBox(width: 66.w),
                                const Text("Address"),
                              ],
                            ),
                          ),
                          const Flexible(
                            flex: 55,
                            fit: FlexFit.tight,
                            child: Text("Private key"),
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
                      if (controller.keys.isNotEmpty)
                        SizedBox(
                          height: 480.h,
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
                  if (controller.keys.isNotEmpty)
                    GenerateButton(
                      title: Strings.generateMore,
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
