@JS()
library kadena_crypto;

import 'dart:typed_data';

import 'package:js/js.dart';

@JS('kadenaMnemonicToRootKeypair')
external Uint8List kadenaMnemonicToRootKeypair(String pwd, String mnemonic);

@JS('kadenaGenKeypair')
external dynamic _kadenaGenKeypair(String pwd, Uint8List root, num index);

@JS('interopArrayBufferToUint8List')
external Uint8List _interopArrayBufferToUint8List(Object arrayBuffer);

List<List<int>> kadenaGenKeypair(String pwd, Uint8List root, num index) {
  final nativeByteBuffers = _kadenaGenKeypair(pwd, root, index);
  return [
    _interopArrayBufferToUint8List(nativeByteBuffers[0]),
    _interopArrayBufferToUint8List(nativeByteBuffers[1]),
  ];
}
