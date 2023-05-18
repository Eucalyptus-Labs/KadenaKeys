import 'dart:async';
import 'dart:typed_data';

import 'package:squadron/squadron.dart';

import 'package:bip39/bip39.dart' as bip39;

import '../kadena_crypto/kadena_crypto.dart';

/// this abstract class represents the functionality you want to support in your service
///
/// now there is only one functionality: given a mnemonic phrase, compute a seed
abstract class SeedDerivationService {
  FutureOr<Uint8List> getBip39Seed(String mnemonicPhrase);

  FutureOr<Uint8List> getKadenaSeed(String mnemonicPhrase);

  /// this constant is used to identify the method to call when communicating with isolates / web workers
  static const getBip39SeedCommand = 1;
  static const getKadenaSeedCommand = 2;
}

/// this class is the actual implementation of the service defined above
class SeedExtractionServiceImpl implements SeedDerivationService, WorkerService {
  @override
  Uint8List getBip39Seed(String mnemonicPhrase) {
    final seedBytes = bip39.mnemonicToSeed(mnemonicPhrase.trim());

    return seedBytes;
  }

  @override
  Uint8List getKadenaSeed(String mnemonicPhrase) {
    final seedBytes = kadenaMnemonicToRootKeypair('', mnemonicPhrase.trim());

    return seedBytes;
  }

  /// this map creates the correspondence between the service constants from SeedExtractionService
  /// and the method implementations in [SeedExtractionServiceImpl]
  @override
  late final Map<int, CommandHandler> operations = {
    SeedDerivationService.getBip39SeedCommand: (WorkerRequest r) {
      Squadron.info('Received getBip39SeedCommand in ${r.travelTime} µs');
      return getBip39Seed(r.args[0]);
    },
    SeedDerivationService.getKadenaSeedCommand: (WorkerRequest r) {
      Squadron.info('Received getKadenaSeedCommand in ${r.travelTime} µs');
      return getKadenaSeed(r.args[0]);
    }
  };
}
