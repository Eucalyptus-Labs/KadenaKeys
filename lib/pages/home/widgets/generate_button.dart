import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kadena_keys/utils/themes/app_color_theme.dart';
import 'package:kadena_keys/utils/themes/app_text_theme.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 385.w,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            darkElevatedButtonColor,
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
