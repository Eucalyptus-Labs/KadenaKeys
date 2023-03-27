// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';

import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
// ignore: depend_on_referenced_packages
import 'package:convert/convert.dart';
import 'package:x25519/x25519.dart' as x;

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final String privKeyStr =
        '88cc74fdaa0ebdf60ad75c28eddb288bf928da9cf78652f8d541b716c5e97c5af6c073dc5ce52d6a202009908049003f750733a4f16cc5e84896db6f5f3aaa4ad2adf52af5b0c969763a2d536692ba2727cc042615c0de8d07c08d1e90a5d901b18400b8da916c664e6a86941da251947fd9a4b3cc4bf3c010d4d2f95073958d';
    // final privKey = ed.PrivateKey(
    //
    // );

    // ed.

    // List<int> privKey = hex.decode(privKeyStr.substring(0, 64));

    // privKey[0] &= 248;
    // privKey[31] &= 127;
    // privKey[31] |= 64;

    print(
      hex.encode(
        x.X25519(
          hex.decode(
            privKeyStr.substring(0, 64),
          ),
          x.basePoint,
        ),
      ),
    );
  });
}
