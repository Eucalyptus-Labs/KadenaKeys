// stub file, the file used at runtime will depend on the target platform
//   * cf "browser\derive_seed_activator.dart" for Web workers (browser platform)
//   * cf "vm\derive_seed_activator.dart" for Isolate workers (vm platform)

// of course, if your application does not target both Web and VM platforms,
// you need not define a stub file and can go directly for your target platform

import 'derive_seed_worker_pool.dart' show SeedExtractionWorker;

SeedExtractionWorker createWorker() => throw UnsupportedError('Not supported on this platform');
