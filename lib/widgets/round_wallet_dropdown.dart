import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kadena_keys/constants/values/values.dart';
import 'package:kadena_keys/models/wallets.dart';
import 'package:nil/nil.dart';

class RoundedWalletDropdown extends StatelessWidget {
  final WalletData? selectedWallet;
  final Function(WalletData?) onChanged;

  const RoundedWalletDropdown({
    required this.selectedWallet,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 0.80,
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            focusColor: Colors.transparent,
            // hoverColor: Colors.transparent,
          ),
          child: DropdownButton(
            underline: const Nil(),
            hint: const Text("Select wallet"),
            items: Maps.kadenaWalletData.values.map((WalletData data) {
              return DropdownMenuItem<WalletData>(
                value: data,
                child: Text(data.name),
              );
            }).toList(),
            onChanged: onChanged,
            isExpanded: true,
            value: selectedWallet,
            iconEnabledColor: CustomColors.accent100,
          ),
        ),
      ),
    );
  }
}
