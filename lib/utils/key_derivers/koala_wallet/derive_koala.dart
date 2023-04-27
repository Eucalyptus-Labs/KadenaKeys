import '../../../models/key_derivation_result.dart';
import 'package:bip39/bip39.dart' as bip39;
// ignore: depend_on_referenced_packages
import 'package:convert/convert.dart';
import '../i_key_deriver.dart';
import 'package:slip_0010_ed25519/slip_0010_ed25519.dart';

class DeriveKoala extends IKeyDeriver {
  @override
  bool validateMnemonic(String mnemonic) {
    final strippedMnemonic = mnemonic.trim();
    return bip39.validateMnemonic(strippedMnemonic) && strippedMnemonic.split(' ').length == 24;
  }

  @override
  Future<List<KeyDerivationResult>> deriveKeys({
    required String mnemonic,
    int startIndex = 0,
    int count = 10,
  }) async {
    final seedBytes = bip39.mnemonicToSeed(mnemonic.trim());

    final results = <KeyDerivationResult>[];
    for (var i = 0; i < count; i++) {
      final keyData = ED25519_HD_KEY.derivePath(
        "m/44'/626'/$i'",
        seedBytes,
      );
      final privateKey = keyData.key;
      final publicKey = ED25519_HD_KEY.getPublicKey(keyData.key, false);

      results.add(
        KeyDerivationResult(
          privateKey: hex.encode(privateKey),
          publicKey: hex.encode(publicKey),
          account: 'k:${hex.encode(publicKey)}',
        ),
      );
    }

    return results;
  }
}
