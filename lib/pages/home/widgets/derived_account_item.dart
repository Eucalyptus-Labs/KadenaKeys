import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kadena_keys/models/key_derivation_result.dart';
import 'package:kadena_keys/utils/themes/app_color_theme.dart';

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
                Text(result.account),
              ],
            ),
          ),
          Flexible(
            flex: 40,
            fit: FlexFit.tight,
            child: Text(
              result.privateKey,
            ),
          ),
        ],
      ),
    );
  }
}
