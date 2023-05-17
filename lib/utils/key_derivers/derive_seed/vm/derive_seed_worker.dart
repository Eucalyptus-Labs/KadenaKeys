// Isolate implementation (VM patform)

import 'package:squadron/squadron_service.dart';

import '../derive_seed_service.dart';

void start(Map command) => run((startRequest) => SeedExtractionServiceImpl(), command);
