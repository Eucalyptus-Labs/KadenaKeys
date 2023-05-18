// Creation of the Isolate

import '../derive_seed_worker_pool.dart' show SeedDerivationWorker;

import 'derive_seed_worker.dart' as isolate;

SeedDerivationWorker createWorker() => SeedDerivationWorker(isolate.start);
