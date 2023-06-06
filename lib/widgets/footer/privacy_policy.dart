import 'package:flutter/material.dart';

import '../../constants/values/values.dart';
import '../url_text.dart';

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
