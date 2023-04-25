import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kadena_keys/widgets/footer.dart';
import 'home_controller.dart';
import 'widgets/derivation.dart';
import 'widgets/derived_accounts.dart';
import 'widgets/home_title.dart';
import 'widgets/mnemonic.dart';
import 'widgets/more_info.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 57.h,
                      left: 184.w,
                      right: 184.w,
                    ),
                    child: Column(
                      children: const [
                        HomeTitle(),
                        Mnemonic(),
                        Derivation(),
                        DerivedAccounts(),
                        MoreInfo(),
                      ],
                    ),
                  ),
                  const Footer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
