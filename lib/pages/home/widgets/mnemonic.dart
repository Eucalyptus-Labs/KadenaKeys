import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../../constants/values/values.dart';
import '../../../store/home_page/home_page_store.dart';
import '../../../utils/size_info.dart';
import '../../../widgets/round_wallet_dropdown.dart';
import '../../../widgets/rounded_container.dart';
import 'generate_button.dart';

class Mnemonic extends StatelessWidget {
  Mnemonic({super.key});

  final homePageStore = GetIt.I<HomePageStore>();

  @override
  Widget build(BuildContext context) {
    final isTablet = SizeInfo.screenWidth < Sizes.tabletWidth;
    final walletLabel = MnemonicLabel(
      text: Strings.selectWallet,
    );
    final dropDown = Observer(
      builder: (context) {
        return RoundedWalletDropdown(
          selectedWallet: homePageStore.selectedWallet,
          onChanged: homePageStore.onWalletSelected,
        );
      },
    );

    final mnemonicLabel = MnemonicLabel(
      text: Strings.mnemonicPhrase,
      showTooltip: true,
    );
    final input = Observer(
      builder: (context) {
        return TextFormField(
          controller: homePageStore.menmonicController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: homePageStore.mnemonicValidateInput,
          onChanged: homePageStore.selectedWallet != null
              ? homePageStore.mnemonicOnChange
              : null,
          decoration: Decorations.defaultInputDecoration,
        );
      },
    );

    return Column(
      children: [
        RoundedContainer(
          bottomMargin: 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 40,
                ),
                child: const Row(
                  children: [
                    Text(
                      Strings.mnemonic,
                      style: Styles.textStyleHeader4,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: isTablet
                        ? Wrap(
                            children: [walletLabel, dropDown],
                          )
                        : Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: walletLabel,
                              ),
                              Expanded(
                                flex: 3,
                                child: dropDown,
                              ),
                            ],
                          ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: isTablet
                        ? Wrap(
                            children: [mnemonicLabel, input],
                          )
                        : Row(
                            children: [
                              Expanded(flex: 1, child: mnemonicLabel),
                              Expanded(
                                flex: 3,
                                child: input,
                              ),
                            ],
                          ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Observer(
                    builder: (context) {
                      return GenerateButton(
                        loading: homePageStore.isGeneratingPrivateKey,
                        onPressCallback: homePageStore.enableButton
                            ? homePageStore.generateKeysAsync
                            : null,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MnemonicLabel extends StatelessWidget {
  MnemonicLabel({
    required this.text,
    this.showTooltip = false,
    super.key,
  });

  final String text;
  final bool showTooltip;
  final homePageStore = GetIt.I<HomePageStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: Text(
              text,
              style: Styles.textStyleSubheading,
            ),
          ),
          if (!showTooltip)
            Icon(
              Icons.info,
              color: CustomColors.light24,
            ),
          if (showTooltip)
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (event) {
                homePageStore.showTooltip(context, event.position);
              },
              onExit: (event) {
                homePageStore.hideOverlay(context);
              },
              child: Icon(
                Icons.info,
                color: CustomColors.light24,
              ),
            ),
        ],
      ),
    );
  }
}
