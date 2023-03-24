import 'package:flutter/material.dart';
import 'package:kadena_keys/models/key_derivation_result.dart';
import 'package:kadena_keys/utils/key_derivers/ecko_wallet/derive_ecko.dart';
import 'package:kadena_keys/utils/key_derivers/ecko_wallet/ecko_widget.dart';
import 'package:kadena_keys/utils/key_derivers/koala_wallet/derive_koala.dart';
import 'package:kadena_keys/utils/key_derivers/i_key_deriver.dart';
import 'package:kadena_keys/utils/key_derivers/koala_wallet/koala_widget.dart';

enum KadenaWallet {
  koala,
  eckoWallet,
  chainweaver,
  zelcore,
  linx,
  ledger,
}

enum DerivationMethod {
  bip32,
  bip44,
  bip49,
  bip84,
  bip141,
}

class WalletData {
  final KadenaWallet wallet;
  final String name;
  final IKeyDeriver deriver;
  final Widget infoWidget;
  final int wordCount;

  const WalletData({
    required this.wallet,
    required this.name,
    required this.deriver,
    required this.infoWidget,
    this.wordCount = 12,
  });
}

final kadenaWalletData = {
  KadenaWallet.koala: WalletData(
    wallet: KadenaWallet.koala,
    name: 'Koala',
    deriver: DeriveKoala(),
    infoWidget: const KoalaWidget(),
  ),
  KadenaWallet.eckoWallet: WalletData(
    wallet: KadenaWallet.eckoWallet,
    name: 'eckoWallet',
    deriver: DeriveEcko(),
    infoWidget: const EckoWidget(),
  ),
  // KadenaWallet.chainweaver: WalletData(
  //   wallet: KadenaWallet.chainweaver,
  //   name: 'Chainweaver',
  //   derivationMethod: DerivationMethod.bip44,
  //   derivationPath: "m/44'",
  // ),
  // KadenaWallet.zelcore: WalletData(
  //   wallet: KadenaWallet.zelcore,
  //   name: 'Zelcore',
  //   derivationMethod: DerivationMethod.bip44,
  //   derivationPath: "m/44'/626'/0'",
  //   include: false,
  // ),
  // KadenaWallet.linx: WalletData(
  //   wallet: KadenaWallet.linx,
  //   name: 'Linx',
  //   derivationMethod: DerivationMethod.bip44,
  //   derivationPath: "m/44'/626'/0'",
  //   include: false,
  // ),
  // KadenaWallet.ledger: WalletData(
  //   wallet: KadenaWallet.ledger,
  //   name: 'Ledger',
  //   derivationMethod: DerivationMethod.bip44,
  //   derivationPath: "m/44'/626'/0'",
  //   include: false,
  // ),
};
