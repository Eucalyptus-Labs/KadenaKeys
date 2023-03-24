import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kadena_keys/models/key_derivation_result.dart';
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
  List<KeyDerivationResult>? keys;

  void _onSelectedWalletChanged(WalletData? data) {
    setState(() {
      selectedWallet = data!;
    });
  }

  Future<void> _generatePrivateKey() async {
    setState(() {
      generatingPrivateKey = true;
    });

    final List<KeyDerivationResult> value =
        await selectedWallet.deriver.deriveKeys(
      mnemonic: _menmonicController.text,
    );

    setState(() {
      keys = value;
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
            selectedWallet.infoWidget,
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
            _buildKeyResultWidget(),
          ],
        ),
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

  Widget _buildKeyResultWidget() {
    if (keys == null) {
      return Container();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSectionTitle(StringConstants.derivedKeysTitle),
        _buildKeyRow(StringConstants.privateKey, keys![0].privateKey),
        _buildKeyRow(StringConstants.publicKey, keys![0].publicKey),
        _buildKeyRow(StringConstants.account, keys![0].account),
      ],
    );
  }

  Widget _buildKeyRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: StyleConstants.linear8,
      ),
      child: Row(
        children: [
          Text(title),
          const SizedBox(
            width: StyleConstants.magic10,
          ),
          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: StyleConstants.magic10,
          ),
          ElevatedButton(
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: value));
              await showPlatformToast(
                child: const Text(StringConstants.copiedToClipboard),
                context: context,
              );
            },
            child: const Text(
              StringConstants.copyToClipboard,
            ),
          ),
        ],
      ),
    );
  }
}
