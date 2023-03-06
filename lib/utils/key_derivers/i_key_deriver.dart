import 'package:kadena_keys/models/key_derivation_result.dart';

abstract class IKeyDeriver {
  Future<KeyDerivationResult> deriveKeys({
    required String mnemonic,
  });
}
