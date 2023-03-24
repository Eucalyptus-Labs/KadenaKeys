import 'dart:typed_data';

import 'package:kadena_keys/models/key_derivation_result.dart';
import 'package:kadena_keys/utils/key_derivers/i_key_deriver.dart';
import 'package:kadena_keys/utils/key_derivers/kadena_crypto/kadena_crypto.dart';

// ignore: depend_on_referenced_packages
import 'package:convert/convert.dart';

class DeriveEcko extends IKeyDeriver {
  @override
  Future<List<KeyDerivationResult>> deriveKeys({
    required String mnemonic,
    Map<String, dynamic>? info,
  }) async {
    Uint8List root = kadenaMnemonicToRootKeypair('', mnemonic);
    num hardIndex = 0x80000000;
    num newIndex = hardIndex + (info?['index'] ?? 0);
    List<List<int>> privPubKey = kadenaGenKeypair('', root, newIndex);

    return [
      KeyDerivationResult(
        privateKey: hex.encode(privPubKey[0]),
        publicKey: hex.encode(privPubKey[1]),
        account: 'k:${hex.encode(privPubKey[1])}',
      ),
    ];
  }
}
