part of 'values.dart';

class Decorations {
  static BoxDecoration shadowBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        CustomColors.dark100,
        CustomColors.dark100.withOpacity(.9),
        CustomColors.dark100.withOpacity(.1),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      stops: const [
        0.1,
        0.5,
        1.0,
      ],
    ),
  );
}
