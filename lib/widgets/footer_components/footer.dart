import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/values/values.dart';
import '../../utils/size_info.dart';
import 'copy_right.dart';
import 'powered_by.dart';
import 'privacy_policy.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Divider(
            thickness: 1,
            color: CustomColors.light10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 29,
              horizontal: 118.w,
            ),
            child: SizeInfo.isTablet || SizeInfo.isMobile
                ? const Column(
                    children: [
                      CopyRight(),
                      SizedBox(height: 10),
                      PoweredBy(),
                      SizedBox(height: 10),
                      PrivacyPolicy(),
                    ],
                  )
                : const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: CopyRight(),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: PoweredBy(),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: PrivacyPolicy(),
                      ),
                    ],
                  ),
          ),
        ],
      );
}
