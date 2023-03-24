const kadenaCrypto = require('cardano-crypto.js/kadena-crypto.js');

window.kadenaMnemonicToRootKeypair = kadenaCrypto.kadenaMnemonicToRootKeypair;
window.kadenaGenKeypair = kadenaCrypto.kadenaGenKeypair;

function interopArrayBufferToUint8List(arrayBuffer) {
  return new Uint8Array(arrayBuffer);
}

window.interopArrayBufferToUint8List = interopArrayBufferToUint8List;
