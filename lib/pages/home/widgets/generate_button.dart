import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kadena_keys/utils/themes/app_color_theme.dart';
import 'package:kadena_keys/utils/themes/app_text_theme.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    required this.onPressCallback,
    super.key,
  });

  final Function()? onPressCallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 385.w,
      child: ElevatedButton(
        onPressed: onPressCallback,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return darkElevatedButtonColor.withOpacity(0.5);
              }
              return darkElevatedButtonColor;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                44.r,
              ),
            ),
          ),
        ),
        child: Text(
          "Generate",
          style: AppTextTheme.inter14White500,
        ),
      ),
    );
  }
}
