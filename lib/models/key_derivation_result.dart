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
  String toString() => 'KeyDerivationResult{privateKey: $privateKey, publicKey: $publicKey, account: $account}';
}
