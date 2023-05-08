import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/values/values.dart';
import '../../../widgets/rounded_container.dart';
import '../../../widgets/url_text.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 46),
                child: Row(
                  children: [
                    Text(
                      Strings.moreInfo,
                      style: Styles.textStyleHeader4.copyWith(
                        color: CustomColors.light100,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      Strings.licence,
                      style: Styles.textStyleSubheading.copyWith(
                        color: CustomColors.light100,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    flex: 4,
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
              const SizedBox(height: 34),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    flex: 2,
                    child: Text(
                      Strings.otherProducts,
                      style: Styles.textStyleSubheading,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    flex: 4,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: UrlText(
                              text: Strings.productKoala,
                              url: Url.koalaWallet,
                              style: Styles.textStyleMediumParagraph.copyWith(
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
                              style: Styles.textStyleMediumParagraph.copyWith(
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
}
