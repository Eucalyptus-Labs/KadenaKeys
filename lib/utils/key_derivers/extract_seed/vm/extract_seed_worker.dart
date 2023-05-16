// Isolate implementation (VM patform)

import 'package:squadron/squadron_service.dart';

import '../extract_seed_service.dart';

void start(Map command) => run((startRequest) => SeedExtractionServiceImpl(), command);
