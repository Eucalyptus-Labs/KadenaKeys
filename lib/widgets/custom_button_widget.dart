import 'package:flutter/material.dart';
import '../utils/style_constants.dart';

enum CustomButtonType { primary, secondary, success, failure, disabled }

class CustomButtonWidget extends StatelessWidget {
  final CustomButtonType type;
  final Widget child;
  final VoidCallback? onTap;

  const CustomButtonWidget({
    required this.type,
    required this.child,
    this.onTap,
    super.key,
  });

  Color get _backgroundColor {
    switch (type) {
      case CustomButtonType.primary:
        return Colors.deepPurple;
      case CustomButtonType.secondary:
        return Colors.transparent;
      case CustomButtonType.success:
        return const Color(0xFF19990E);
      case CustomButtonType.failure:
        return const Color(0xFFB92929);
      case CustomButtonType.disabled:
        return const Color.fromARGB(255, 141, 141, 141);
    }
  }

  BorderSide get _borderSide {
    switch (type) {
      case CustomButtonType.secondary:
        return const BorderSide(width: 4, color: Color(0xFF2980B9));
      default:
        return BorderSide.none;
    }
  }

  TextStyle get _textTheme {
    switch (type) {
      case CustomButtonType.secondary:
        return const TextStyle(fontSize: 18, color: Color(0xFF2980B9));
      default:
        return const TextStyle(fontSize: 18, color: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(
          StyleConstants.linear8,
        ),
        decoration: BoxDecoration(
          color: _backgroundColor,
          border: Border.fromBorderSide(_borderSide),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DefaultTextStyle.merge(
          style: _textTheme,
          child: child,
        ),
      ),
    );
}
