import 'package:flutter/material.dart';
import '../constants/values/values.dart';
import '../models/wallets.dart';

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
  Widget build(BuildContext context) => SizedBox(
      width: 200,
      height: 55,
      child: DropdownButtonFormField<WalletData>(
        value: selectedWallet,
        decoration: decoration,
        items: Maps.kadenaWalletData.values.map((data) => DropdownMenuItem<WalletData>(
            value: data,
            child: Text(data.name),
          )).toList(),
        onChanged: onChanged,
      ),
    );
}
