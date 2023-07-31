import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/values/values.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SvgPicture.asset(
            ImagePath.fullLogo,
            height: 64,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.w),
            child: Column(
              children: [
                Text(
                  Strings.descriptionHome,
                  style: Styles.textStyleLargeParagraph.copyWith(
                    color: CustomColors.light75,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: Strings.learnMore),
                TextSpan(
                  text: Strings.here,
                  recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse(Url.youtubeTutorial)),
                  style: Styles.textStyleLargeParagraph.copyWith(
                    color: CustomColors.light75,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(text: Strings.period),
              ],
              style: Styles.textStyleLargeParagraph.copyWith(
                color: CustomColors.light75,
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: Strings.sourceCode),
                TextSpan(
                  text: Strings.here,
                  recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse(Url.youtubeTutorial)),
                  style: Styles.textStyleLargeParagraph.copyWith(
                    color: CustomColors.light75,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(text: Strings.period),
              ],
              style: Styles.textStyleLargeParagraph.copyWith(
                color: CustomColors.light75,
              ),
            ),
          ),
          const SizedBox(height: 55),
        ],
      );
}
