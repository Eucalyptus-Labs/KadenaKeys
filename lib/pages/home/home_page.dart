import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../store/home_page/home_page_store.dart';
import '../../utils/size_info.dart';
import '../../widgets/footer_components/footer.dart';
import 'widgets/derivation_container.dart';
import 'widgets/derived_accounts.dart';
import 'widgets/home_title.dart';
import 'widgets/mnemonic.dart';
import 'widgets/more_info.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homePageStore = GetIt.I<HomePageStore>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homePageStore.pageController.position.isScrollingNotifier.addListener(() {
        if (homePageStore.pageController.position.isScrollingNotifier.value) {
          homePageStore.hideOverlay(context);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GestureDetector(
          onTap: () {
            homePageStore.hideOverlay(context);
          },
          child: SingleChildScrollView(
            controller: homePageStore.pageController,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 57,
                      left: SizeInfo.isMobile ? 92.w : 184.w,
                      right: SizeInfo.isMobile ? 92.w : 184.w,
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
        ),
      );
}
