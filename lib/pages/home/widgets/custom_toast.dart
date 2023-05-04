import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import '../../../store/home_page/home_page_store.dart';

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
  final homePageStore = GetIt.I<HomePageStore>();

  @override
  void dispose() {
    homePageStore.overlayEntry?.remove();
    homePageStore.cancelableOperation?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) async {
        homePageStore.showCustomToast(context, details.globalPosition);
        await Clipboard.setData(
          ClipboardData(text: widget.content),
        );
      },
      child: widget.child,
    );
  }
}
