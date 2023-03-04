import 'package:flutter/material.dart';
import 'package:kadena_keys/utils/wallets.dart';

class WalletDropdown extends StatelessWidget {
  final WalletData selectedWallet;
  final Function(WalletData?) onChanged;

  const WalletDropdown({
    Key? key,
    required this.selectedWallet,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<WalletData>(
      value: selectedWallet,
      items: kadenaWalletData.values.map((WalletData data) {
        return DropdownMenuItem<WalletData>(
          value: data,
          child: Text(data.name),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
