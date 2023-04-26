import 'package:flutter/material.dart';
import 'package:kadena_keys/constants/values/values.dart';
import 'package:kadena_keys/utils/style_constants.dart';

class KoalaWidget extends StatelessWidget {
  const KoalaWidget({Key? key}) : super(key: key);

  static const String derivationMethod = 'BIP44';
  static const String derivationPath = "m/44'/626'/0'";

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
