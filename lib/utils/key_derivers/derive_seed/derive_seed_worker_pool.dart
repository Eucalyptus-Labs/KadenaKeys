// this is a helper file to expose Squadron workers and worker pools as a SeedExtractionService

import 'dart:async';
import 'dart:typed_data';

import 'package:squadron/squadron.dart';

import 'derive_seed_service.dart';

// this is where the stub file comes into action
//
// of course, if your application does not target both Web and VM platforms,
// you need not define a stub file and can go directly for your target platform
import 'derive_seed_activator.dart'
    if (dart.library.js) './browser/derive_seed_worker_activator.dart'
    if (dart.library.html) './browser/derive_seed_worker_activator.dart'
    if (dart.library.io) './vm/derive_seed_worker_activator.dart';

/// Implementation of [SeedExtractionService] as a Squadron worker pool
class SeedDerivationWorkerPool extends WorkerPool<SeedExtractionWorker> implements SeedExtractionService {
  SeedDerivationWorkerPool()
      : super(
          createWorker,
          concurrencySettings: const ConcurrencySettings(maxWorkers: 1),
        );

  @override
  Future<Uint8List> getBip39Seed(String mnemonicPhrase) => execute((w) => w.getBip39Seed(mnemonicPhrase));

  @override
  Future<Uint8List> getKadenaSeed(String mnemonicPhrase) => execute((w) => w.getKadenaSeed(mnemonicPhrase));
}

/// Implementation of [SeedExtractionService] as a Squadron worker
class SeedExtractionWorker extends Worker implements SeedExtractionService {
  SeedExtractionWorker(dynamic entryPoint, {List args = const []}) : super(entryPoint, args: args);

  @override
  Future<Uint8List> getBip39Seed(String mnemonicPhrase) =>
      send(SeedExtractionService.getBip39SeedCommand, args: [mnemonicPhrase]);

  @override
  Future<Uint8List> getKadenaSeed(String mnemonicPhrase) =>
      send(SeedExtractionService.getKadenaSeedCommand, args: [mnemonicPhrase]);
}
