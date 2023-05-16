// Creation of the Web Worker

// TO ACTUALLY SEE THE WEB WORKER IN ACTION, THE DART SOURCE CODE MUST BE COMPILED TO JAVASCRIPT MANUALLY
// WHENEVER THE WEB WORKER DEPENDANT FILES ARE MODIFIED, RECOMPILATION IS REQUIRED
//
// to compile the extract_seed_worker.dart to JavaScript, run the following command line:
//
//       dart compile js ./lib/utils/key_derivers/extract_seed/browser/extract_seed_worker.dart -o ./web/js/extract_seed_worker.dart.js -O2
//
// or (to minify generated JS source code):
//
//       dart compile js ./lib/utils/key_derivers/extract_seed/browser/extract_seed_worker.dart -o ./web/js/extract_seed_worker.dart.js -m -O2
//
// Of course, this can be automated in a release script (shell, batch or PowerShell depending on your dev platform)

import '../extract_seed_worker_pool.dart' show SeedExtractionWorker;

SeedExtractionWorker createWorker() => SeedExtractionWorker('/js/extract_seed_worker.dart.js');
