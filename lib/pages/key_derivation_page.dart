import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kadena_keys/models/key_derivation_result.dart';
import 'package:kadena_keys/utils/string_constants.dart';
import 'package:kadena_keys/utils/style_constants.dart';
import 'package:kadena_keys/utils/wallets.dart';
import 'package:kadena_keys/widgets/custom_button_widget.dart';
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

  String? _errorText = StringConstants.invalidInput;

  void _onSelectedWalletChanged(WalletData? data) {
    setState(() {
      selectedWallet = data!;
    });
    _validateInput();
  }

  void _validateInput() {
    setState(() {
      if (selectedWallet.deriver.validateMnemonic(_menmonicController.text)) {
        _errorText = null;
      } else {
        _errorText = StringConstants.invalidInput;
      }
    });
  }

  Future<void> _generatePrivateKey() async {
    _validateInput();

    if (_errorText != null) {
      return;
    }

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
    return Scaffold(
      body: Padding(
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
              if (selectedWallet.infoWidget != null) selectedWallet.infoWidget!,
              const SizedBox(
                height: StyleConstants.magic30,
              ),
              _buildSectionTitle(StringConstants.inputSeedPhrase),
              TextField(
                controller: _menmonicController,
                decoration: InputDecoration(
                  labelText: StringConstants.seedPhrase,
                  errorText: _errorText,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (value) => _validateInput(),
              ),
              const SizedBox(
                height: StyleConstants.magic10,
              ),
              _buildGenerateSeedButton(),
              const SizedBox(
                height: StyleConstants.magic30,
              ),
              _buildSectionTitle(StringConstants.keyPairsAndAccounts),
              const Text(
                StringConstants.tapOnAnyPrivateKey,
              ),
              const SizedBox(
                height: StyleConstants.magic10,
              ),
              _buildKeyResultWidget(),
            ],
          ),
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
      return CustomButtonWidget(
        type: _errorText == null
            ? CustomButtonType.primary
            : CustomButtonType.disabled,
        onTap: _errorText == null ? _generatePrivateKey : null,
        child: const Text(
          StringConstants.generate,
        ),
      );
    }
  }

  Widget _buildKeyResultWidget() {
    if (keys == null) {
      return DataTable(
        columns: const [
          DataColumn(label: Text('Private key')),
          DataColumn(label: Text('Public key')),
          DataColumn(label: Text('Account')),
        ],
        rows: const [],
      );
    }

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Private key')),
              DataColumn(label: Text('Public key')),
              DataColumn(label: Text('Account')),
            ],
            rows: keys!
                .map(
                  (accountData) => DataRow(
                    cells: [
                      DataCell(InkWell(
                        child: Text(accountData.privateKey),
                        onTap: () async {
                          await Clipboard.setData(
                            ClipboardData(text: accountData.privateKey),
                          );
                          showPlatformToast(
                            child: const Text(
                              StringConstants.copiedToClipboard,
                            ),
                            context: context,
                          );
                        },
                      )),
                      DataCell(InkWell(
                        child: Text(accountData.publicKey),
                        onTap: () async {
                          await Clipboard.setData(
                            ClipboardData(text: accountData.publicKey),
                          );
                          showPlatformToast(
                            child: const Text(
                              StringConstants.copiedToClipboard,
                            ),
                            context: context,
                          );
                        },
                      )),
                      DataCell(InkWell(
                        child: Text(accountData.account),
                        onTap: () async {
                          await Clipboard.setData(
                            ClipboardData(text: accountData.account),
                          );
                          showPlatformToast(
                            child: const Text(
                              StringConstants.copiedToClipboard,
                            ),
                            context: context,
                          );
                        },
                      )),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
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
