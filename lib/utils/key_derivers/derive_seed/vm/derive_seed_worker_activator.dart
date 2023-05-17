// Creation of the Isolate

import '../derive_seed_worker_pool.dart' show SeedExtractionWorker;

import 'derive_seed_worker.dart' as isolate;

SeedExtractionWorker createWorker() => SeedExtractionWorker(isolate.start);
