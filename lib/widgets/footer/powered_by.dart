import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/values/values.dart';

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
