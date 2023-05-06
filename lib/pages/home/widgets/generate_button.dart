import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/values/values.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    required this.onPressCallback,
    this.title = Strings.generate,
    this.loading = false,
    super.key,
  });

  final Function()? onPressCallback;
  final bool loading;
  final String title;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 48,
        width: 385.w,
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
                  style: Styles.textStyleHeader6,
                ),
        ),
      );
}
