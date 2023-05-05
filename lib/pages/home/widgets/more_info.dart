import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/values/values.dart';
import '../../../widgets/rounded_container.dart';
import '../../../widgets/url_text.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          RoundedContainer(
            height: 420,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      Strings.moreInfo,
                      style: Styles.textStyleHeader4.copyWith(
                        color: CustomColors.light100,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.licence,
                      style: Styles.textStyleSubheading.copyWith(
                        color: CustomColors.light100,
                      ),
                    ),
                    SizedBox(
                      width: 688.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.licenceOne,
                            style: Styles.textStyleMediumParagraph.copyWith(
                              color: CustomColors.light75,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                Strings.licenceTwo,
                                style: Styles.textStyleMediumParagraph.copyWith(
                                  color: CustomColors.light75,
                                ),
                              ),
                              Text(
                                Strings.here,
                                style: Styles.textStyleMediumParagraph.copyWith(
                                  color: CustomColors.light75,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      Strings.otherProducts,
                      style: Styles.textStyleSubheading,
                    ),
                    SizedBox(
                      width: 688.w,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.h),
                                child: UrlText(
                                  text: Strings.productKoala,
                                  url: Url.koalaWallet,
                                  style:
                                      Styles.textStyleMediumParagraph.copyWith(
                                    color: CustomColors.light75,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.h),
                                child: UrlText(
                                  text: Strings.productExplorer,
                                  url: Url.kdaExplorer,
                                  style:
                                      Styles.textStyleMediumParagraph.copyWith(
                                    color: CustomColors.light75,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              UrlText(
                                text: Strings.productKadena,
                                url: Url.kadenaEcosystem,
                                style: Styles.textStyleMediumParagraph.copyWith(
                                  color: CustomColors.light75,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 125.h),
        ],
      );
}
