import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../../constants/values/values.dart';
import '../../../store/home_page/home_page_store.dart';
import '../../../widgets/rounded_container.dart';

class DerivationContainer extends StatelessWidget {
  DerivationContainer({super.key});

  final homePageStore = GetIt.I<HomePageStore>();

  @override
  Widget build(BuildContext context) => Observer(
      builder: (context) => Column(
            children: [
              RoundedContainer(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          Strings.derivation,
                          style: Styles.textStyleHeader4,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 50,
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Row(
                                  children: [
                                    Text(
                                      Strings.derivationMethod,
                                      style: Styles.textStyleCaption.copyWith(
                                        color: CustomColors.light100,
                                      ),
                                    ),
                                    SizedBox(width: 70.w),
                                    Text(
                                      homePageStore.derivationMethod ?? '',
                                      style: Styles.textStyleCaption.copyWith(
                                        color: CustomColors.light50,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 50,
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Row(
                                  children: [
                                    Text(
                                      Strings.derivationPath,
                                      style: Styles.textStyleCaption.copyWith(
                                        color: CustomColors.light100,
                                      ),
                                    ),
                                    SizedBox(width: 70.w),
                                    Text(
                                      homePageStore.derivationPath ?? '',
                                      style: Styles.textStyleCaption.copyWith(
                                        color: CustomColors.light50,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ));
}
