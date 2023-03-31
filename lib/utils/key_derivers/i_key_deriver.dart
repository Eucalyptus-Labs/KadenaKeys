import 'package:kadena_keys/models/key_derivation_result.dart';

abstract class IKeyDeriver {
  bool validateMnemonic(String mnemonic);
  Future<List<KeyDerivationResult>> deriveKeys({
    required String mnemonic,
    int startIndex,
    int count,
  });
}
