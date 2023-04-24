import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kadena_keys/utils/themes/app_color_theme.dart';
import 'package:kadena_keys/utils/themes/app_text_theme.dart';
import 'package:kadena_keys/utils/wallets.dart';
import 'package:kadena_keys/widgets/wallet_dropdown.dart';

class Mnemonic extends StatelessWidget {
  const Mnemonic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 348.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: darkContainer,
          ),
          padding: EdgeInsets.all(40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Mnemonic",
                    style: AppTextTheme.inter24White700,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Mnemonic phrase",
                            style: AppTextTheme.inter14White500,
                          ),
                          SizedBox(width: 8.w),
                          const Icon(
                            Icons.info,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 688.w,
                        height: 48.h,
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Select wallet",
                            style: AppTextTheme.inter14White500,
                          ),
                          SizedBox(width: 8.w),
                          const Icon(
                            Icons.info,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 688.w,
                        height: 48.h,
                        child: WalletDropdown(
                          selectedWallet: kadenaWalletData[KadenaWallet.koala]!,
                          decoration: InputDecoration(
                            hintText: "Select wallet",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                          ),
                          onChanged: (walletData) {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(""),
                  SizedBox(
                    width: 688.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 48.h,
                          width: 385.w,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                darkElevatedButtonColor,
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    44.r,
                                  ),
                                ),
                              ),
                            ),
                            child: Text(
                              "Generate",
                              style: AppTextTheme.inter14White500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
