import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/values/values.dart';
import '../../../models/key_derivation_result.dart';
import 'custom_toast.dart';

class DerivedAccountItem extends StatelessWidget {
  const DerivedAccountItem({
    required this.index,
    required this.result,
    super.key,
  });

  final int index;
  final KeyDerivationResult result;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        margin: EdgeInsets.only(
          bottom: 8.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: CustomColors.dark100,
        ),
        child: Row(
          children: [
            Flexible(
              flex: 10,
              fit: FlexFit.tight,
              child: Text('$index'),
            ),
            Flexible(
              flex: 45,
              fit: FlexFit.tight,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: CustomToast(
                  content: result.account,
                  child: Text(result.account),
                ),
              ),
            ),
            Flexible(
              flex: 45,
              fit: FlexFit.tight,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: CustomToast(
                  content: result.privateKey,
                  child: Text(result.privateKey),
                ),
              ),
            ),
          ],
        ),
      );
}
