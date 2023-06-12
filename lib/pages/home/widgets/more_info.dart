import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/values/values.dart';
import '../../../utils/size_info.dart';
import '../../../widgets/rounded_container.dart';
import '../../../widgets/url_text.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final licence = Text(
      Strings.licence,
      style: Styles.textStyleSubheading.copyWith(
        color: CustomColors.light100,
      ),
    );
    final licenceText = Column(
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
            UrlText(
              url: Url.license,
              text: Strings.here,
              style: Styles.textStyleMediumParagraph.copyWith(
                color: CustomColors.light75,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
    const productText = Text(
      Strings.otherProducts,
      style: Styles.textStyleSubheading,
    );
    final productColumn = SizedBox(
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
    );

    return Column(
      children: [
        RoundedContainer(
          bottomMargin: 125,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
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
                  if (!SizeInfo.isMobile)
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: licence,
                            ),
                            const SizedBox(width: 20),
                            Flexible(
                              flex: 2,
                              child: licenceText,
                            ),
                          ],
                        ),
                        const SizedBox(height: 34),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                              flex: 1,
                              child: productText,
                            ),
                            const SizedBox(width: 20),
                            Flexible(
                              flex: 2,
                              child: SizedBox(
                                width: double.infinity,
                                child: productColumn,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  if (SizeInfo.isMobile)
                    Column(
                      children: [
                        Wrap(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: licence,
                            ),
                            licenceText,
                          ],
                        ),
                        const SizedBox(height: 34),
                        Wrap(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: productText,
                            ),
                            productColumn,
                          ],
                        ),
                      ],
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
