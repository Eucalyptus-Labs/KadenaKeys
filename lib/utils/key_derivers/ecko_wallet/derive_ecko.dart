import 'dart:typed_data';

import 'package:kadena_keys/utils/key_derivers/derive_seed/derive_seed_worker_pool.dart';

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
    SeedDerivationWorkerPool? seedDerivationWorkerPool;
    Uint8List? seedBytes;

    try {
      seedDerivationWorkerPool = SeedDerivationWorkerPool();
      await seedDerivationWorkerPool.start();
      seedBytes = await seedDerivationWorkerPool.getKadenaSeed(mnemonic.trim());
    } finally {
      seedDerivationWorkerPool?.stop();
    }

    final hardIndex = 0x80000000 + startIndex;

    final results = <KeyDerivationResult>[];
    for (int i = 0; i < count; i++) {
      final privPubKey = kadenaGenKeypair('', seedBytes, hardIndex + i);
      results.add(
        KeyDerivationResult(
          privateKey: hex.encode(privPubKey[0]).substring(0, 128),
          publicKey: hex.encode(privPubKey[1]),
          account: 'k:${hex.encode(privPubKey[1])}',
        ),
      );
    }

    return results;
  }
}
