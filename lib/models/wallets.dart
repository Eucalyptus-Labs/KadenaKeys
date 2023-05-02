import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../constants/enums/kadena_wallets.dart';
import '../utils/key_derivers/i_key_deriver.dart';

part 'wallets.freezed.dart';

@freezed
class WalletData with _$WalletData {
  factory WalletData({
    required KadenaWallet wallet,
    required String name,
    required String derivationMethod,
    required String derivationPath,
    required IKeyDeriver deriver,
    Widget? infoWidget,
  }) = _WalletData;
}
