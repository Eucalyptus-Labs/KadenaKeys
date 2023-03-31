import 'dart:math';
import 'dart:typed_data';

import 'package:kadena_keys/models/key_derivation_result.dart';
import 'package:kadena_keys/utils/key_derivers/i_key_deriver.dart';
import 'package:kadena_keys/utils/key_derivers/kadena_crypto/kadena_crypto.dart';

// ignore: depend_on_referenced_packages
import 'package:convert/convert.dart';

class DeriveEcko extends IKeyDeriver {
  @override
  bool validateMnemonic(String mnemonic) {
    String strippedMnemonic = mnemonic.trim();
    return strippedMnemonic.split(' ').length == 12;
  }

  @override
  Future<List<KeyDerivationResult>> deriveKeys({
    required String mnemonic,
    int startIndex = 0,
    int count = 10,
  }) async {
    Uint8List root = kadenaMnemonicToRootKeypair('', mnemonic.trim());
    num hardIndex = 0x80000000 + startIndex;

    final List<KeyDerivationResult> results = [];
    for (num i = 0; i < count; i++) {
      List<List<int>> privPubKey = kadenaGenKeypair('', root, hardIndex + i);
      results.add(
        KeyDerivationResult(
          privateKey: hex.encode(privPubKey[0]).substring(
                0,
                192,
              ),
          publicKey: hex.encode(privPubKey[1]),
          account: 'k:${hex.encode(privPubKey[1])}',
        ),
      );
    }

    return results;
  }
}
