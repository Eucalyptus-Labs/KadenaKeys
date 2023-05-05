import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/values/values.dart';
import '../models/wallets.dart';

class RoundedWalletDropdown extends StatelessWidget {
  final WalletData? selectedWallet;
  final Function(WalletData?) onChanged;

  const RoundedWalletDropdown({
    required this.selectedWallet,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: CustomColors.light08,
            ),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              focusColor: Colors.transparent,
              // hoverColor: Colors.transparent,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                // underline: const Nil(),
                hint: Text(
                  Strings.selectWallet,
                  style: Styles.textStyleMediumParagraph.copyWith(
                    color: CustomColors.light50,
                    decoration: TextDecoration.none,
                  ),
                ),
                items: Maps.kadenaWalletData.values
                    .map((data) => DropdownMenuItem<WalletData>(
                          value: data,
                          child: Text(data.name),
                        ))
                    .toList(),
                onChanged: onChanged,
                isExpanded: true,
                value: selectedWallet,
                iconEnabledColor: CustomColors.accent100,
              ),
            ),
          ),
        ),
      );
}
