import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kadena_keys/utils/themes/app_color_theme.dart';
import 'package:kadena_keys/utils/themes/app_text_theme.dart';

import 'generate_button.dart';

class DerivedAccounts extends StatelessWidget {
  const DerivedAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 772.h,
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
                    child: Divider(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                    ),
                  ),
                  Container(
                    height: 480.h,
                    child: ListView(
                      children: [
                        DerivedAccountItem(),
                        DerivedAccountItem(),
                        DerivedAccountItem(),
                        DerivedAccountItem(),
                        DerivedAccountItem(),
                        DerivedAccountItem(),
                        DerivedAccountItem(),
                        DerivedAccountItem(),
                        DerivedAccountItem(),
                        DerivedAccountItem(),
                      ],
                    ),
                  ),
                ],
              ),
              const GenerateButton(),
            ],
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}

class DerivedAccountItem extends StatelessWidget {
  const DerivedAccountItem({
    super.key,
  });

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
            flex: 45,
            fit: FlexFit.tight,
            child: Row(
              children: [
                Text("0"),
                SizedBox(width: 90.w),
                Text("ajkhds82498jkasksa8s092424...24ds1"),
              ],
            ),
          ),
          Flexible(
            flex: 55,
            fit: FlexFit.tight,
            child: Container(
              child: Text(
                "djksa897489829ajksdsjk0294ídjkajs092424sdjk9824Z98klasdk01298qweq9024ds",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
