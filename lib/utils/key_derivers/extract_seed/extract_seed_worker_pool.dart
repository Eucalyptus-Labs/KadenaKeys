// this is a helper file to expose Squadron workers and worker pools as a SeedExtractionService

import 'dart:typed_data';

import 'package:squadron/squadron.dart';

import 'extract_seed_service.dart';

// this is where the stub file comes into action
//
// of course, if your application does not target both Web and VM platforms,
// you need not define a stub file and can go directly for your target platform
import 'extract_seed_activator.dart'
    if (dart.library.js) './browser/extract_seed_worker_activator.dart'
    if (dart.library.html) './browser/extract_seed_worker_activator.dart'
    if (dart.library.io) './vm/extract_seed_worker_activator.dart';

/// Implementation of [SeedExtractionService] as a Squadron worker pool
class SeedExtractionWorkerPool extends WorkerPool<SeedExtractionWorker> implements SeedExtractionService {
  SeedExtractionWorkerPool()
      : super(
          createWorker,
          concurrencySettings: const ConcurrencySettings(maxWorkers: 1),
        );

  @override
  Future<Uint8List> getSeed(String mnemonicPhrase) => execute((w) => w.getSeed(mnemonicPhrase));
}

/// Implementation of [SeedExtractionService] as a Squadron worker
class SeedExtractionWorker extends Worker implements SeedExtractionService {
  SeedExtractionWorker(dynamic entryPoint, {List args = const []}) : super(entryPoint, args: args);

  @override
  Future<Uint8List> getSeed(String mnemonicPhrase) =>
      send(SeedExtractionService.getSeedCommand, args: [mnemonicPhrase]);
}
