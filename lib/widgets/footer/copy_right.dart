import 'package:flutter/material.dart';

import '../../constants/values/values.dart';

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
