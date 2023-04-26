import 'package:flutter/material.dart';
import 'package:kadena_keys/constants/enums/kadena_wallets.dart';
import 'package:kadena_keys/utils/key_derivers/i_key_deriver.dart';

class WalletData {
  final KadenaWallet wallet;
  final String name, derivationMethod, derivationPath;
  final IKeyDeriver deriver;
  Widget? infoWidget;

  WalletData({
    required this.wallet,
    required this.name,
    required this.derivationMethod,
    required this.derivationPath,
    required this.deriver,
    this.infoWidget,
  });
}
