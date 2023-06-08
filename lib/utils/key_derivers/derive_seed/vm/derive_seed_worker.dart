// Isolate implementation (VM patform)

import 'package:squadron/squadron_service.dart';

import '../derive_seed_service.dart';

void start(List command) => run((startRequest) => SeedExtractionServiceImpl(), command);
