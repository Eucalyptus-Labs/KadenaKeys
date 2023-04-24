import 'package:flutter/material.dart';
import 'package:kadena_keys/utils/style_constants.dart';

import '../../../constants/values/values.dart';

class EckoWidget extends StatelessWidget {
  const EckoWidget({Key? key}) : super(key: key);

  static const String derivationMethod = 'cardano-crypto.js';
  static const String derivationPath = 'kadena-crypto.js';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(
            right: StyleConstants.magic20,
          ),
          child: Text(
            Strings.derivationMethod,
            style: StyleConstants.bodyBold,
          ),
        ),
        _centeredText(derivationMethod),
        const SizedBox(
          width: StyleConstants.magic30,
        ),
        const Padding(
          padding: EdgeInsets.only(
            right: StyleConstants.magic20,
          ),
          child: Text(
            Strings.derivationPath,
            style: StyleConstants.bodyBold,
          ),
        ),
        _centeredText(derivationPath),
      ],
    );
  }

  Widget _centeredText(
    String text, {
    TextStyle? style,
  }) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}
