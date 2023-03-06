import 'package:kadena_keys/models/key_derivation_result.dart';
import 'package:bip39/bip39.dart' as bip39;
// ignore: depend_on_referenced_packages
import 'package:convert/convert.dart';
import 'package:kadena_keys/utils/key_derivers/i_key_deriver.dart';
import 'package:slip_0010_ed25519/slip_0010_ed25519.dart';

class DeriveKoala extends IKeyDeriver {
  @override
  Future<KeyDerivationResult> deriveKeys({
    required String mnemonic,
  }) async {
    final seedBytes = bip39.mnemonicToSeed(mnemonic.trim());
    // print(hex.encode(seedBytes.toList()));

    KeyData keyData = ED25519_HD_KEY.derivePath(
      "m/44'/626'/0'",
      seedBytes,
    );
    var privateKey = keyData.key;
    var publicKey = ED25519_HD_KEY.getPublicKey(keyData.key, false);

    return KeyDerivationResult(
      privateKey: hex.encode(privateKey),
      publicKey: hex.encode(publicKey),
      account: 'k:${hex.encode(publicKey)}',
    );
  }
}
