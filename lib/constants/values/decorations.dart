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

  static InputDecoration defaultInputDecoration = InputDecoration(
    isDense: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        width: 1,
        color: CustomColors.light02,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        width: 1,
        color: CustomColors.failed100,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        width: 1,
        color: CustomColors.light02,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        width: 1,
        color: CustomColors.failed100,
      ),
    ),
  );
}
