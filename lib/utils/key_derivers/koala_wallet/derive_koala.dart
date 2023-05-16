import 'dart:developer';
import 'dart:typed_data';

import 'package:kadena_keys/utils/key_derivers/extract_seed/extract_seed_worker_pool.dart';

import '../../../models/key_derivation_result.dart';
import 'package:bip39/bip39.dart' as bip39;

// ignore: depend_on_referenced_packages
import 'package:convert/convert.dart';
import '../i_key_deriver.dart';
import 'package:slip_0010_ed25519/slip_0010_ed25519.dart';

class DeriveKoala extends IKeyDeriver {
  @override
  bool validateMnemonic(String mnemonic) {
    final strippedMnemonic = mnemonic.trim();
    return bip39.validateMnemonic(strippedMnemonic) && strippedMnemonic.split(' ').length == 24;
  }

  @override
  Future<List<KeyDerivationResult>> deriveKeys({
    required String mnemonic,
    int startIndex = 0,
    int count = 10,
  }) async {
    SeedExtractionWorkerPool? seedExtractWorkerPool;
    List<int>? seedBytes;

    try {
      seedExtractWorkerPool = SeedExtractionWorkerPool();
      await seedExtractWorkerPool.start();
      seedBytes = await seedExtractWorkerPool.getSeed(mnemonic.trim());
    } catch (err, stackTrace) {
      // TODO (moria): Maybe process error here
      log('Seed extraction error', error: err, stackTrace: stackTrace);
      rethrow;
    } finally {
      seedExtractWorkerPool?.stop();
    }

    final results = <KeyDerivationResult>[];
    for (var i = 0; i < count; i++) {
      final keyData = ED25519_HD_KEY.derivePath(
        "m/44'/626'/$i'",
        seedBytes,
      );
      final privateKey = keyData.key;
      final publicKey = ED25519_HD_KEY.getPublicKey(keyData.key, false);

      results.add(
        KeyDerivationResult(
          privateKey: hex.encode(privateKey),
          publicKey: hex.encode(publicKey),
          account: 'k:${hex.encode(publicKey)}',
        ),
      );
    }

    return results;
  }
}
