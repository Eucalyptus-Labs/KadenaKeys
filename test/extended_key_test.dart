// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';

// ignore: depend_on_referenced_packages
import 'package:convert/convert.dart';
import 'package:pinenacl/ed25519.dart';
import 'package:pinenacl/tweetnacl.dart';

import 'signing_key_extended.dart';

void main() {
  const String privKeyStr =
      // Private key for 'faint circle forget keep cotton solar brown snow clay left exist bird'
      '88cc74fdaa0ebdf60ad75c28eddb288bf928da9cf78652f8d541b716c5e97c5af6c073dc5ce52d6a202009908049003f750733a4f16cc5e84896db6f5f3aaa4ad2adf52af5b0c969763a2d536692ba2727cc042615c0de8d07c08d1e90a5d901b18400b8da916c664e6a86941da251947fd9a4b3cc4bf3c010d4d2f95073958d';
  // Private key for 'logic easily waste eager injury oval sentence wine bomb embrace gossip supreme'
  // '78a7b0d297708efd3ef0fc2eed706459c910635e235684838f882530a00bd65b84a9a58d1bbbb1cbfdc67bcf28b84254e90da8873115ab952174c89f6d5b58593cae1ab99513cdbbe9c361f9629d35abcd5f535748fc76d45f72b4fcdaf7f4e48be60e97047b24ed182049294986fe35d256f52f13588a0db58a8f15f755fd24';

  final Uint8List extendedSk = Uint8List.fromList(
    hex.decode(
      privKeyStr.substring(0, 128),
    ),
  );
  final Uint8List extendedSkPk = Uint8List.fromList(
    hex.decode(
      privKeyStr.substring(0, 192),
    ),
  );

  final Uint8List sk = TweetNaCl.randombytes(TweetNaCl.seedSize);

  const String message = 'hello';

  test('Test extended signing key', () {
    final sm = Uint8List(message.length + TweetNaCl.signatureLength);
    expect(
      TweetNaCl.crypto_sign(
        sm,
        -1,
        Uint8List.fromList(message.codeUnits),
        0,
        message.length,
        extendedSkPk,
        extended: true,
      ),
      0,
    );

    final signed = SignedMessage.fromList(signedMessage: sm);

    final verifier = VerifyKey(
      Uint8List.fromList(
        hex.decode(
          privKeyStr.substring(128, 192),
        ),
      ),
    );
    expect(
      verifier.verify(
        signature: signed.signature,
        message: Uint8List.fromList(message.codeUnits),
      ),
      true,
    );
  });

  group('Test extended signing key', () {
    test('extended', () {
      ExtendedSigningKey signingKey = ExtendedSigningKey(
        secret: extendedSk,
      );
      final SignedMessage signed = signingKey.sign(
        Uint8List.fromList(
          message.codeUnits,
        ),
      );

      expect(
        signingKey.verifyKey.verify(
          signature: signed.signature,
          message: Uint8List.fromList(message.codeUnits),
        ),
        true,
      );
    });

    test('seed', () {
      ExtendedSigningKey signingKey = ExtendedSigningKey(secret: sk);
      final SignedMessage signed = signingKey.sign(
        Uint8List.fromList(
          message.codeUnits,
        ),
      );

      expect(
        signingKey.verifyKey.verify(
          signature: signed.signature,
          message: Uint8List.fromList(message.codeUnits),
        ),
        true,
      );
    });
  });
}