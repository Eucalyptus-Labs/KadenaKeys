import 'package:flutter/material.dart';
import 'package:kadena_keys/utils/wallets.dart';

class WalletDropdown extends StatelessWidget {
  final WalletData selectedWallet;
  final Function(WalletData?) onChanged;
  final InputDecoration? decoration;

  const WalletDropdown({
    Key? key,
    required this.selectedWallet,
    required this.onChanged,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 55.0,
      child: DropdownButtonFormField<WalletData>(
        value: selectedWallet,
        decoration: decoration,
        items: kadenaWalletData.values.map((WalletData data) {
          return DropdownMenuItem<WalletData>(
            value: data,
            child: Text(data.name),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
