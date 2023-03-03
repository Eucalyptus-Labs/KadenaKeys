enum KadenaWallet {
  koala,
  xWallet,
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
  final DerivationMethod derivationMethod;
  final String derivationPath;
  final int wordCount;
  final bool include;

  const WalletData({
    required this.wallet,
    required this.name,
    required this.derivationMethod,
    required this.derivationPath,
    this.wordCount = 12,
    this.include = true,
  });
}

const kadenaWalletData = {
  KadenaWallet.koala: WalletData(
    wallet: KadenaWallet.koala,
    name: 'Koala',
    derivationMethod: DerivationMethod.bip44,
    derivationPath: "m/44'/626'/0'",
  ),
  // KadenaWallet.xWallet: WalletData(
  //   wallet: KadenaWallet.xWallet,
  //   name: 'X-Wallet',
  //   derivationMethod: DerivationMethod.bip32,
  //   derivationPath: "m/44'",
  // ),
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
