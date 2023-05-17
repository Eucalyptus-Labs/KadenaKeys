import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
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
                          ],
                        ),
                        Text(
                          Strings.eucalyptusLabs,
                          style: Styles.textStyleSubheading.copyWith(
                            color: CustomColors.light65,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizeInfo.isMobile
                    ? Column(
                        children: [
                          Text(
                            Strings.poweredBy,
                            style: Styles.textStyleSubheading.copyWith(
                              color: CustomColors.light65,
                            ),
                          ),
                          Row(
                            children: [
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
                          ),
                        ],
                      )
                    : Row(
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
                      ),
                UrlText(
                  url: Url.privacyPolicy,
                  text: Strings.privacyPolicy,
                  style: Styles.textStyleSubheading.copyWith(
                    color: CustomColors.light100,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
