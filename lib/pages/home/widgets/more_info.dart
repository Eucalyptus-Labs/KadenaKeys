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
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              final isMobile = constraints.maxWidth < Sizes.small;
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
                      Text(
                        Strings.here,
                        style: Styles.textStyleMediumParagraph.copyWith(
                          color: CustomColors.light75,
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
                  if (!isMobile)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: licence,
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          flex: 4,
                          child: licenceText,
                        ),
                      ],
                    ),
                  if (isMobile)
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
                  if (!isMobile)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          flex: 2,
                          child: productText,
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          flex: 4,
                          child: SizedBox(
                            width: double.infinity,
                            child: productColumn,
                          ),
                        ),
                      ],
                    ),
                  if (isMobile)
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
              );
            },
          ),
        ),
        SizedBox(height: 125.h),
      ],
    );
  }
}
