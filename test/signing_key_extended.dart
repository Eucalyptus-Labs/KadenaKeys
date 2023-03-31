import 'package:pinenacl/ed25519.dart';
import 'package:pinenacl/src/tweetnacl/tweetnacl.dart';

///
/// SigningKey implements the Ed25519 deterministic signature scheme (EdDSA)
/// using Curve25519, that provides a very fast `fixed-base` and `double-base`
/// scalar multiplications, which faster on most platform than the
/// `variable-base` algorithm of X25519, due to the fast and complete twisted
/// Edwards addition law.
///
/// Cannot extends `AsymmetricPrivateKey` as it would have to implement
/// the final `publicKey`.
///
class ExtendedSigningKey extends AsymmetricPrivateKey
    with Suffix
    implements Sign {
  /// An Ed25519 signingKey is the private key for producing digital signatures
  /// using the Ed25519 algorithm.
  ///  simply the concatenation of the seed and
  /// the generated public key from the `SHA512`-ed and `prone-to-buffer`-ed
  /// seed as a private key.
  ///
  /// seed (i.e. private key) is a random 32-byte value.

  final bool isExtended;

  factory ExtendedSigningKey({required Uint8List secret}) {
    if (secret.length ==
        TweetNaCl.signingKeyLength + TweetNaCl.publicKeyLength) {
      return ExtendedSigningKey.fromValidBytes(
        secret,
        isExtended: true,
        keyLength: TweetNaCl.signingKeyLength + TweetNaCl.publicKeyLength,
      );
    }
    return ExtendedSigningKey.fromSeed(secret);
  }

  ExtendedSigningKey.fromValidBytes(
    Uint8List secret, {
    this.isExtended = false,
    int keyLength = TweetNaCl.signingKeyLength,
  }) : super(secret, keyLength: keyLength);

  ExtendedSigningKey.fromSeed(Uint8List seed)
      : this.fromValidBytes(_seedToSecret(seed));

  ExtendedSigningKey.generate()
      : this.fromSeed(TweetNaCl.randombytes(TweetNaCl.seedSize));

  ExtendedSigningKey.decode(String keyString, [Encoder coder = decoder])
      : this.fromValidBytes(coder.decode(keyString));

  static const decoder = Bech32Encoder(hrp: 'ed25519_sk');

  @override
  Encoder get encoder => decoder;

  static const signingKeyLength = TweetNaCl.signingKeyLength;
  static const seedSize = TweetNaCl.seedSize;

  @override
  int get prefixLength => isExtended ? signingKeyLength : seedSize;

  ByteList get seed => prefix;

  VerifyKey? _verifyKey;

  @override
  VerifyKey get verifyKey => _verifyKey ??= VerifyKey(suffix.asTypedList);

  @override
  AsymmetricPublicKey get publicKey => verifyKey;

  static Uint8List _seedToSecret(Uint8List seed) {
    if (seed.length != seedSize) {
      throw Exception('SigningKey must be created from a $seedSize byte seed');
    }

    //if (seed is Uint8List) {
    //  seed = seed.toList();
    //}

    final priv =
        Uint8List.fromList(seed + Uint8List(TweetNaCl.publicKeyLength));
    final pub = Uint8List(TweetNaCl.publicKeyLength);
    TweetNaCl.crypto_sign_keypair(pub, priv, Uint8List.fromList(seed));

    return SigningKey.fromValidBytes(priv).asTypedList;
  }

  @override
  SignedMessage sign(Uint8List message) {
    // signed message
    var sm = Uint8List(message.length + TweetNaCl.signatureLength);
    final result = TweetNaCl.crypto_sign(
      sm,
      -1,
      Uint8List.fromList(message),
      0,
      message.length,
      asTypedList,
      extended: isExtended,
    );
    if (result != 0) {
      throw Exception('Signing the massage is failed');
    }

    return SignedMessage.fromList(signedMessage: sm);
  }
}
