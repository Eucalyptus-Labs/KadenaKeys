part of values;

class Maps {
  static Map<KadenaWallet, WalletData> kadenaWalletData = {
    KadenaWallet.koala: WalletData(
      wallet: KadenaWallet.koala,
      name: 'Koala Wallet',
      derivationMethod: 'BIP44',
      derivationPath: "m/44'/626'/0'",
      deriver: DeriveKoala(),
      infoWidget: const KoalaWidget(),
    ),
    KadenaWallet.eckoWallet: WalletData(
      wallet: KadenaWallet.eckoWallet,
      name: 'eckoWALLET',
      derivationMethod: 'cardano-crypto.js',
      derivationPath: 'kadena-crypto.js',
      deriver: DeriveEcko(),
      infoWidget: const EckoWidget(),
    ),
    KadenaWallet.chainweaver: WalletData(
      wallet: KadenaWallet.chainweaver,
      name: 'Chainweaver',
      derivationMethod: 'cardano-crypto.js',
      derivationPath: 'kadena-crypto.js',
      deriver: DeriveEcko(),
      infoWidget: const EckoWidget(),
    ),
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
}
