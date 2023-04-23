import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kadena_keys/utils/wallets.dart';

class RoundedWalletDropdown extends StatelessWidget {
  final WalletData selectedWallet;
  final Function(WalletData?) onChanged;
  final InputDecoration? decoration;

  const RoundedWalletDropdown({
    Key? key,
    required this.selectedWallet,
    required this.onChanged,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 0.80,
          ),
        ),
        child: DropdownButton(
          underline: const Text(""),
          items: kadenaWalletData.values.map((WalletData data) {
            return DropdownMenuItem<WalletData>(
              value: data,
              child: Text(data.name),
            );
          }).toList(),
          onChanged: onChanged,
          isExpanded: true,
          value: selectedWallet,
        ),
      ),
    );
  }
}
