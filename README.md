# KadenaKeys

Used to derive the private key from a passphrase for multiple wallets in the Kadena ecosystem.

# To Run Locally from Flutter

```
flutter clean
flutter pub get
flutter run -d chrome --web-renderer html
```
Web app opens automatically in Chrome.

# To run Locally in Node

```
flutter clean
flutter pub get
flutter build web --web-renderer html --csp --no-web-resources-cdn
npm install -g http-server
```
Change directory to /build/web and run the server on localhost with:
```
npx http-server
```

Web app runs on localhost and URL will be given in terminal.

# To Build for Remote Server

```
nvm install 14
npm cache clean --force
npm install
npx webpack

flutter clean
flutter pub get
flutter build web --web-renderer html --csp --no-web-resources-cdn
```

The `build/web/` directory will contain the compiled web app. Can be served with pm2 or other server

```
pm2 serve build/web 6000 --name develop.kadenakeys.io
```

# To build for release tagging/offline use

```
flutter clean
flutter pub get
flutter build web --web-renderer html --csp --no-web-resources-cdn
```

Create an archive/zip file from the resulting build/web directory and upload to github

# To Test

To run all unit tests:
`flutter test`

# Specific Wallet Phrases and Expected Private Keys

### Koala Wallet

**Recovery Phrase:** plug utility enable phone tip scale left blind clown someone knife oval drink road want erase salt jewel move whisper picnic history avocado symbol  
**Expected Private Key:** fffd5e65d1ae2786ff1246f77ae367ec52393eaab92352974ea6b62ac19df740  
**Expected Public Key:** 247c41591fedddc44a4b5bf44d80e38c400fa2d79e376e7ea29f1f957cda151b  
**Expected Account:** k:247c41591fedddc44a4b5bf44d80e38c400fa2d79e376e7ea29f1f957cda151b  

### eckoWallet

**Recovery Phrase:** faint circle forget keep cotton solar brown snow clay left exist bird  
**Expected Private Key:** 88cc74fdaa0ebdf60ad75c28eddb288bf928da9cf78652f8d541b716c5e97c5af6c073dc5ce52d6a202009908049003f750733a4f16cc5e84896db6f5f3aaa4a  
**Expected Public Key:** d2adf52af5b0c969763a2d536692ba2727cc042615c0de8d07c08d1e90a5d901  
**Expected Account:** k:d2adf52af5b0c969763a2d536692ba2727cc042615c0de8d07c08d1e90a5d901  

### Chainweaver

**Recovery Phrase:** logic easily waste eager injury oval sentence wine bomb embrace gossip supreme  
**Expected Private Key:** 78a7b0d297708efd3ef0fc2eed706459c910635e235684838f882530a00bd65b84a9a58d1bbbb1cbfdc67bcf28b84254e90da8873115ab952174c89f6d5b5859  
**Expected Public Key:** 3cae1ab99513cdbbe9c361f9629d35abcd5f535748fc76d45f72b4fcdaf7f4e4  
**Expected Account:** k:3cae1ab99513cdbbe9c361f9629d35abcd5f535748fc76d45f72b4fcdaf7f4e4

# Misc. Commands

1. `flutter pub run dependency_validator`
2. `dart run build_runner build --delete-conflicting-outputs`

### Build the js for Squadron

`dart compile js ./lib/utils/key_derivers/derive_seed/browser/derive_seed_worker.dart -o ./web/js/derive_seed_worker.dart.js -m -O2`

### Build js debug non minified for Squadron

`dart compile js ./lib/utils/key_derivers/derive_seed/browser/derive_seed_worker.dart -o ./web/js/derive_seed_worker.dart.js -O2`
