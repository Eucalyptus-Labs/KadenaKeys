import '../../../models/key_derivation_result.dart';
import '../i_key_deriver.dart';
import '../kadena_crypto/kadena_crypto.dart';

// ignore: depend_on_referenced_packages
import 'package:convert/convert.dart';

class DeriveEcko extends IKeyDeriver {
  @override
  bool validateMnemonic(String mnemonic) {
    final strippedMnemonic = mnemonic.trim();
    return strippedMnemonic.split(' ').length == 12;
  }

  @override
  Future<List<KeyDerivationResult>> deriveKeys({
    required String mnemonic,
    int startIndex = 0,
    int count = 10,
  }) async {
    final root = kadenaMnemonicToRootKeypair('', mnemonic.trim());
    num hardIndex = 0x80000000 + startIndex;

    final results = <KeyDerivationResult>[];
    for (num i = 0; i < count; i++) {
      final privPubKey = kadenaGenKeypair('', root, hardIndex + i);
      results.add(
        KeyDerivationResult(
          privateKey: hex.encode(privPubKey[0]).substring(
                0,
                128,
              ),
          publicKey: hex.encode(privPubKey[1]),
          account: 'k:${hex.encode(privPubKey[1])}',
        ),
      );
    }

    return results;
  }
}
