// Web worker implementation (browser patform)

// TO ACTUALLY SEE THE WEB WORKER IN ACTION, THE DART SOURCE CODE MUST BE COMPILED TO JAVASCRIPT MANUALLY
// WHENEVER THE WEB WORKER DEPENDANT FILES ARE MODIFIED, RECOMPILATION IS REQUIRED
//
// to compile the derive_seed_worker.dart to JavaScript, run the following command line:
//
//       dart compile js ./lib/utils/key_derivers/derive_seed/browser/derive_seed_worker.dart -o ./web/js/derive_seed_worker.dart.js -O2
//
// or (to minify generated JS source code):
//
//       dart compile js ./lib/utils/key_derivers/derive_seed/browser/derive_seed_worker.dart -o ./web/js/derive_seed_worker.dart.js -m -O2
//
// Of course, this can be automated in a release script (shell, batch or PowerShell depending on your dev platform)

import 'package:squadron/squadron_service.dart';

import '../derive_seed_service.dart';

void main() => run((startRequest) => SeedExtractionServiceImpl());
