import 'dart:async';
import 'dart:typed_data';

import 'package:squadron/squadron.dart';

import 'package:bip39/bip39.dart' as bip39;

/// this abstract class represents the functionality you want to support in your service
///
/// now there is only one functionality: given a mnemonic phrase, compute a seed
abstract class SeedExtractionService {
  FutureOr<Uint8List> getSeed(String mnemonicPhrase);

  /// this constant is used to identify the method to call when communicating with isolates / web workers
  static const getSeedCommand = 1;
}

/// this class is the actual implementation of the service defined above
class SeedExtractionServiceImpl implements SeedExtractionService, WorkerService {
  @override
  FutureOr<Uint8List> getSeed(String mnemonicPhrase) {
    final seedBytes = bip39.mnemonicToSeed(mnemonicPhrase.trim());

    return seedBytes;
  }

  /// this map creates the correspondence between the service constants from SeedExtractionService
  /// and the method implementations in [SeedExtractionServiceImpl]
  @override
  late final Map<int, CommandHandler> operations = {
    SeedExtractionService.getSeedCommand: (WorkerRequest r) {
      Squadron.info('Received getSeedCommand in ${r.travelTime} µs');
      return getSeed(r.args[0]);
    }
  };
}
