// Creation of the Isolate

import '../extract_seed_worker_pool.dart' show SeedExtractionWorker;

import 'extract_seed_worker.dart' as isolate;

SeedExtractionWorker createWorker() => SeedExtractionWorker(isolate.start);
