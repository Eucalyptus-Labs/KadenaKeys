import 'package:flutter/material.dart';
import 'package:kadena_keys/utils/derive_key_util.dart';
import 'package:kadena_keys/utils/string_constants.dart';
import 'package:kadena_keys/utils/style_constants.dart';
import 'package:kadena_keys/utils/wallets.dart';
import 'package:kadena_keys/widgets/wallet_dropdown.dart';

class KeyDerivationPage extends StatefulWidget {
  const KeyDerivationPage({super.key});

  @override
  KeyDerivationPageState createState() => KeyDerivationPageState();
}

class KeyDerivationPageState extends State<KeyDerivationPage> {
  final TextEditingController _menmonicController = TextEditingController();

  WalletData selectedWallet = kadenaWalletData[KadenaWallet.koala]!;
  bool generatingPrivateKey = false;
  String privateKey = '';

  void _onSelectedWalletChanged(WalletData? data) {
    setState(() {
      selectedWallet = data!;
    });
  }

  Future<void> _generatePrivateKey() async {
    setState(() {
      generatingPrivateKey = true;
    });

    final String value = await DeriveKeyUtil.derivePrivateKey(
      menmonic: _menmonicController.text,
      method: selectedWallet.derivationMethod,
      derivationPath: selectedWallet.derivationPath,
    );

    setState(() {
      privateKey = value;
      generatingPrivateKey = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(StyleConstants.magic16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSectionTitle(StringConstants.selectWallet),
            WalletDropdown(
              selectedWallet: selectedWallet,
              onChanged: _onSelectedWalletChanged,
            ),
            const SizedBox(
              height: StyleConstants.magic30,
            ),
            _buildSectionTitle(StringConstants.selectedWalletInfo),
            _buildWalletSelectionRow(),
            const SizedBox(
              height: StyleConstants.magic30,
            ),
            _buildSectionTitle(StringConstants.inputSeedPhrase),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: StringConstants.seedPhrase,
              ),
              controller: _menmonicController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            const SizedBox(
              height: StyleConstants.magic30,
            ),
            _buildSectionTitle(StringConstants.generateSeed),
            _buildGenerateSeedButton(),
            const SizedBox(
              height: StyleConstants.magic10,
            ),
            Text(
              privateKey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletSelectionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(
            right: StyleConstants.magic20,
          ),
          child: Text(
            StringConstants.derivationMethod,
            style: StyleConstants.bodyBold,
          ),
        ),
        _centeredText(selectedWallet.derivationMethod.name.toUpperCase()),
        const SizedBox(
          width: StyleConstants.magic30,
        ),
        const Padding(
          padding: EdgeInsets.only(
            right: StyleConstants.magic20,
          ),
          child: Text(
            StringConstants.derivationPath,
            style: StyleConstants.bodyBold,
          ),
        ),
        _centeredText(selectedWallet.derivationPath),
      ],
    );
  }

  Widget _centeredText(
    String text, {
    TextStyle? style,
  }) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }

  Widget _buildSectionTitle(
    String title, {
    EdgeInsets padding = const EdgeInsets.only(
      bottom: StyleConstants.magic20,
    ),
  }) {
    return Padding(
      padding: padding,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: StyleConstants.magic20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildGenerateSeedButton() {
    if (generatingPrivateKey) {
      return const Center(
        child: SizedBox(
          width: StyleConstants.magic40,
          height: StyleConstants.magic40,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              StyleConstants.colorPrimary,
            ),
          ),
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: _generatePrivateKey,
        child: const Text(
          StringConstants.generateSeed,
        ),
      );
    }
  }
}
