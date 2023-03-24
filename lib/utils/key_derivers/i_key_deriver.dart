import 'package:kadena_keys/models/key_derivation_result.dart';

abstract class IKeyDeriver {
  Future<List<KeyDerivationResult>> deriveKeys({
    required String mnemonic,
    Map<String, dynamic> info,
  });
}
