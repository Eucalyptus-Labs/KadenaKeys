import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import '../../../constants/values/values.dart';
import '../../../models/key_derivation_result.dart';

class DerivedAccountItem extends StatelessWidget {
  const DerivedAccountItem({
    required this.index,
    required this.result,
    super.key,
  });

  final int index;
  final KeyDerivationResult result;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        margin: EdgeInsets.only(
          bottom: 8.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: CustomColors.dark100,
        ),
        child: Row(
          children: [
            Flexible(
              flex: 60,
              fit: FlexFit.tight,
              child: Row(
                children: [
                  Text('$index'),
                  SizedBox(width: 80.w),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: CustomToast(
                      content: result.account,
                      child: Text(result.account),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 40,
              fit: FlexFit.tight,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(
                      ClipboardData(text: result.privateKey),
                    );
                    toast(Strings.copiedToClipboard);
                  },
                  child: Text(result.privateKey),
                ),
              ),
            ),
          ],
        ),
      );
}

class CustomToast extends StatefulWidget {
  final Widget child;
  final String content;

  const CustomToast({
    required this.child,
    required this.content,
    super.key,
  });

  @override
  State<CustomToast> createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast> {
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  void _showToast(BuildContext context, Offset position) {
    _overlayEntry?.remove();
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx + 30,
        top: position.dy + 30,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.9),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Text(
              'Copied to clipboard',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    Future.delayed(
      const Duration(seconds: 2),
      () {
        _overlayEntry?.remove();
        _overlayEntry = null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) async {
        _showToast(context, details.globalPosition);
        await Clipboard.setData(
          ClipboardData(text: widget.content),
        );
      },
      child: widget.child,
    );
  }
}
