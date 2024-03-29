import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kadena_keys/utils/size_info.dart';
import '../../../constants/values/values.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    required this.onPressCallback,
    this.title = Strings.deriveAccounts,
    this.loading = false,
    super.key,
  });

  final Function()? onPressCallback;
  final bool loading;
  final String title;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 48,
        width: SizeInfo.isMobile ? 700.w : 415.w,
        child: ElevatedButton(
          onPressed: loading ? null : onPressCallback,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.disabled)) {
                  return CustomColors.accent100.withOpacity(0.5);
                }
                return CustomColors.accent100;
              },
            ),
            textStyle: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.disabled)) {
                  return Styles.textStyleHeader6.copyWith(
                    color: CustomColors.light100.withOpacity(0.5),
                  );
                }
                return Styles.textStyleHeader6.copyWith(
                  color: CustomColors.light100,
                );
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  44,
                ),
              ),
            ),
          ),
          child: loading
              ? const Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Text(
                  title,
                ),
        ),
      );
}
