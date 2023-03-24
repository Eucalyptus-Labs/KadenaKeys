const path = require('path');

module.exports = {
  mode: 'production',
  // entry: './node_modules/cardano-crypto.js/kadena-crypto.js',
  entry: './expose_functions.js',
  output: {
    path: path.resolve(__dirname, 'web/js'),
    filename: 'bundle.js'
  }
};
