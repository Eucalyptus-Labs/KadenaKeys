import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../widgets/footer.dart';
import 'widgets/derivation_container.dart';
import 'widgets/derived_accounts.dart';
import 'widgets/home_title.dart';
import 'widgets/mnemonic.dart';
import 'widgets/more_info.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 57.h,
                    left: 184.w,
                    right: 184.w,
                  ),
                  child: Column(
                    children: [
                      HomeTitle(),
                      Mnemonic(),
                      DerivationContainer(),
                      DerivedAccounts(),
                      MoreInfo(),
                    ],
                  ),
                ),
                const Footer(),
              ],
            ),
          ),
        ),
      );
}
