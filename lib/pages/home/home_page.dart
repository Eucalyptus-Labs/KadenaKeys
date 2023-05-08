import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
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
                  padding: const EdgeInsets.only(
                    top: 57,
                    left: 184,
                    right: 184,
                  ),
                  child: Column(
                    children: [
                      const HomeTitle(),
                      Mnemonic(),
                      DerivationContainer(),
                      DerivedAccounts(),
                      const MoreInfo(),
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
