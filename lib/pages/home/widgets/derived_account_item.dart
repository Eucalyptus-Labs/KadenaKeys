import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import '../../../constants/values/values.dart';
import '../../../models/key_derivation_result.dart';

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
              flex: 60,
              fit: FlexFit.tight,
              child: Row(
                children: [
                  Text('$index'),
                  SizedBox(width: 80.w),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () async {
                        await Clipboard.setData(
                          ClipboardData(text: result.account),
                        );
                        toast(Strings.copiedToClipboard);
                      },
                      child: Text(result.account),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 40,
              fit: FlexFit.tight,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(
                      ClipboardData(text: result.privateKey),
                    );
                    toast(Strings.copiedToClipboard);
                  },
                  child: Text(result.privateKey),
                ),
              ),
            ),
          ],
        ),
      );
}
