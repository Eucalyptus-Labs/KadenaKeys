class KeyDerivationResult {
  final String privateKey;
  final String publicKey;
  final String account;

  KeyDerivationResult({
    required this.privateKey,
    required this.publicKey,
    required this.account,
  });

  @override
  String toString() {
    return 'KeyDerivationResult{privateKey: $privateKey, publicKey: $publicKey, account: $account}';
  }
}
