// Flutter imports:
import 'package:flutter/material.dart';
import 'package:kadena_keys/constants/values/values.dart';

// Package imports:
import 'package:overlay_support/overlay_support.dart';

void showCustomOverlayNotification({
  required Color color,
  required String text,
  Key? key,
  Duration duration = const Duration(seconds: 3),
}) {
  showOverlayNotification(
    (context) => SafeArea(
      child: GestureDetector(
        onVerticalDragStart: (_) {
          OverlaySupportEntry.of(context)!.dismiss();
        },
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: color,
              boxShadow: [
                BoxShadow(
                  color: CustomColors.dark90.withOpacity(0.3),
                  blurRadius: 30, // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.8, //not the best approach
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.lightGrayColor),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    duration: duration,
    key: key,
  );
}
