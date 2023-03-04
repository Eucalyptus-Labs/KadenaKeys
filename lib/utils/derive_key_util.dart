import 'dart:convert';

import 'package:bip32/bip32.dart';
import 'package:convert/convert.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:kadena_keys/utils/wallets.dart';

class DeriveKeyUtil {
  static Future<String> derivePrivateKey({
    required String menmonic,
    required DerivationMethod method,
    required String derivationPath,
  }) async {
    switch (method) {
      case DerivationMethod.bip44:
        return await bip44DerivePrivateKey(
          menmonic: menmonic,
          derivationPath: derivationPath,
        );
      case DerivationMethod.bip32:
        return bip32DerivePrivateKey(
          menmonic: menmonic,
          derivationPath: derivationPath,
        );

      default:
        throw Exception('Unknown derivation method');
    }
  }

  static Future<String> bip32DerivePrivateKey({
    required String menmonic,
    required String derivationPath,
  }) async {
    final seedBytes = bip39.mnemonicToSeed(menmonic);
    print(hex.encode(seedBytes.toList()));

    final root = BIP32.fromSeed(seedBytes);
    const hardIndex = 0x80000000;
    final child = root.derivePath("$derivationPath/0'");
    final child2 = root.derivePath("$derivationPath/1'");
    print('private key: ${hex.encode(child.privateKey!)}');
    print('public key: ${hex.encode(child.publicKey)}');
    print('private key2: ${hex.encode(child.privateKey!)}');
    print('public key2: ${hex.encode(child2.publicKey)}');
    // KeyData keyData = await ED25519_HD_KEY.derivePath(
    //   "$derivationPath/0'",
    //   seedBytes,
    // );
    // KeyData keyData2 = await ED25519_HD_KEY.derivePath(
    //   "$derivationPath/1'",
    //   seedBytes,
    // );
    // var privateKey = keyData.key;
    // var publicKey = await ED25519_HD_KEY.getPublicKey(keyData.key, false);
    // var publicKey2 = await ED25519_HD_KEY.getPublicKey(keyData2.key, false);
    // print('private key: ${hex.encode(privateKey)}');
    // print('public key: ${hex.encode(publicKey)}');
    // print('K-address: k:${hex.encode(publicKey)}');
    // print('private key2: ${hex.encode(keyData2.key)}');
    // print('public key2: ${hex.encode(publicKey2)}');
    // print('K-address2: k:${hex.encode(publicKey2)}');

    return hex.encode(child.privateKey!);
  }

  static Future<String> bip44DerivePrivateKey({
    required String menmonic,
    required String derivationPath,
  }) async {
    final seedBytes = bip39.mnemonicToSeed(menmonic);
    print(hex.encode(seedBytes.toList()));

    KeyData keyData = await ED25519_HD_KEY.derivePath(
      derivationPath,
      seedBytes,
    );
    var privateKey = keyData.key;
    var publicKey = await ED25519_HD_KEY.getPublicKey(keyData.key, false);
    print('private key: ${hex.encode(privateKey)}');
    print('public key: ${hex.encode(publicKey)}');
    print('K-address: k:${hex.encode(publicKey)}');

    return hex.encode(privateKey);
  }
}
