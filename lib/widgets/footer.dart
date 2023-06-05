import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/values/values.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/size_info.dart';
import 'url_text.dart';

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

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        UrlText(
          url: Url.privacyPolicy,
          text: Strings.privacyPolicy,
          style: Styles.textStyleSubheading.copyWith(
            color: CustomColors.light100,
          ),
        ),
      ],
    );
  }
}

class PoweredBy extends StatelessWidget {
  const PoweredBy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(Url.eucalyptuslabs);
          if (!await launchUrl(uri)) {
            throw Exception('Could not launch ${Url.eucalyptuslabs} ');
          }
        },
        child: Link(
          uri: Uri.parse(Url.eucalyptuslabs),
          builder: (context, onLlink) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Strings.poweredBy,
                  style: Styles.textStyleSubheading.copyWith(
                    color: CustomColors.light65,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 8.5,
                    right: 6.5,
                  ),
                  child: SvgPicture.asset(ImagePath.leaves),
                ),
                Text(
                  Strings.eucalyptusLabs,
                  style: Styles.textStyleSubheading.copyWith(
                    color: CustomColors.light100,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CopyRight extends StatelessWidget {
  const CopyRight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          Strings.copyRight,
          style: Styles.textStyleSubheading.copyWith(
            color: CustomColors.light65,
          ),
        ),
        Text(
          '${DateTime.now().year} ',
          style: Styles.textStyleSubheading.copyWith(
            color: CustomColors.light65,
          ),
        ),
        Text(
          Strings.eucalyptusLabs,
          style: Styles.textStyleSubheading.copyWith(
            color: CustomColors.light65,
          ),
        ),
      ],
    );
  }
}
