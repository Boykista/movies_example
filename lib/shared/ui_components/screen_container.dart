import 'package:flutter/material.dart';
import 'package:movies_example/utils/extensions/build_context_extension.dart';

class ScreenContainer extends StatelessWidget {
  final PreferredSizeWidget? header;
  final Widget? bottomBar;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final bool topInset;
  final bool bottomInset;
  final Widget body;
  final bool resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation floatingButtonLocation;

  const ScreenContainer({
    super.key,
    this.header,
    this.bottomBar,
    this.padding = EdgeInsets.zero,
    this.backgroundColor,
    this.topInset = true,
    this.bottomInset = true,
    required this.body,
    this.resizeToAvoidBottomInset = false,
    this.floatingActionButton,
    this.floatingButtonLocation = FloatingActionButtonLocation.centerFloat,
  });

  @override
  Widget build(BuildContext context) {
    final bottomNotch = context.screenInsets.bottom;

    if (header != null) {
      return Scaffold(
        appBar: header,
        backgroundColor: backgroundColor,
        extendBodyBehindAppBar: !topInset,
        extendBody: !bottomInset,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: Padding(
          padding: EdgeInsets.fromLTRB(
            padding.left,
            padding.top,
            padding.right,
            bottomInset ? padding.bottom + bottomNotch : padding.bottom,
          ),
          child: body,
        ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingButtonLocation,
        bottomNavigationBar: bottomBar,
      );
    }

    return Container(
      color: backgroundColor,
      child: SafeArea(
        top: topInset,
        bottom: bottomInset,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            padding.left,
            padding.top,
            padding.right,
            padding.bottom,
          ),
          child: body,
        ),
      ),
    );
  }
}
