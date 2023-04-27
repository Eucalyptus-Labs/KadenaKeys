import 'package:auto_route/annotations.dart';
import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/enums/kadena_wallets.dart';
import '../constants/values/values.dart';
import '../models/key_derivation_result.dart';
import '../utils/style_constants.dart';
import '../models/wallets.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/wallet_dropdown.dart';

@RoutePage()
class KeyDerivationPage extends StatefulWidget {
  const KeyDerivationPage({super.key});

  @override
  KeyDerivationPageState createState() => KeyDerivationPageState();
}

class KeyDerivationPageState extends State<KeyDerivationPage> {
  final TextEditingController _menmonicController = TextEditingController();

  WalletData selectedWallet = Maps.kadenaWalletData[KadenaWallet.koala]!;
  bool generatingPrivateKey = false;
  List<KeyDerivationResult>? keys;

  String? _errorText = Errors.invalidInput;

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
        _errorText = Errors.invalidInput;
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

    final value =
        await selectedWallet.deriver.deriveKeys(
      mnemonic: _menmonicController.text,
    );

    setState(() {
      keys = value;
      generatingPrivateKey = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(StyleConstants.magic16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSectionTitle(Strings.selectWallet),
              WalletDropdown(
                selectedWallet: selectedWallet,
                onChanged: _onSelectedWalletChanged,
              ),
              const SizedBox(
                height: StyleConstants.magic30,
              ),
              _buildSectionTitle(Strings.selectedWalletInfo),
              if (selectedWallet.infoWidget != null) selectedWallet.infoWidget!,
              const SizedBox(
                height: StyleConstants.magic30,
              ),
              _buildSectionTitle(Strings.inputSeedPhrase),
              TextField(
                controller: _menmonicController,
                decoration: InputDecoration(
                  labelText: Strings.seedPhrase,
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
              _buildSectionTitle(Strings.keyPairsAndAccounts),
              const Text(
                Strings.tapOnAnyPrivateKey,
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

  Widget _buildSectionTitle(
    String title, {
    EdgeInsets padding = const EdgeInsets.only(
      bottom: StyleConstants.magic20,
    ),
  }) => Padding(
      padding: padding,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: StyleConstants.magic20, fontWeight: FontWeight.bold),
      ),
    );

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
          Strings.generate,
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
                          await showPlatformToast(
                            child: const Text(
                              Strings.copiedToClipboard,
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
                          await showPlatformToast(
                            child: const Text(
                              Strings.copiedToClipboard,
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
                          await showPlatformToast(
                            child: const Text(
                              Strings.copiedToClipboard,
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

  // Widget _buildKeyRow(String title, String value) {
  //   return Padding(
  //     padding: const EdgeInsets.only(
  //       bottom: StyleConstants.linear8,
  //     ),
  //     child: Row(
  //       children: [
  //         Text(title),
  //         const SizedBox(
  //           width: StyleConstants.magic10,
  //         ),
  //         Expanded(
  //           child: Text(
  //             value,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ),
  //         const SizedBox(
  //           width: StyleConstants.magic10,
  //         ),
  //         ElevatedButton(
  //           onPressed: () async {
  //             await Clipboard.setData(ClipboardData(text: value));
  //             await showPlatformToast(
  //               child: const Text(Strings.copiedToClipboard),
  //               context: context,
  //             );
  //           },
  //           child: const Text(
  //             Strings.copyToClipboard,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
