import 'package:flutter/material.dart';
import 'package:movies_example/shared/locator.dart';
import 'package:movies_example/shared/ui_components/cards/ui_card.dart';
import 'package:movies_example/shared/ui_components/ui_text.dart';
import 'package:movies_example/utils/extensions/build_context_extension.dart';

import '../../utils/utils.dart';

void showToastMessage(
  BuildContext context, {
  required String message,
  Widget? suffixIcon,
  Widget? prefixIcon,
  Color? backgroundColor,
  Color? textColor,
  Color? iconsColor,
  Duration? duration,
  EdgeInsets? margin,
  VoidCallback? onDismiss,
}) {
  OverlayState overlayState = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (BuildContext context) {
      return _AnimatedToastMessage(
        message: message,
        onDismiss: () {
          if (onDismiss != null) {
            onDismiss();
          }
          overlayEntry.remove();
        },
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        backgroundColor: backgroundColor,
        textColor: textColor,
        iconsColor: iconsColor,
        duration: duration,
        margin: margin,
      );
    },
  );

  overlayState.insert(overlayEntry);
}

void showErrorToastMessage(
  BuildContext context, {
  required dynamic message,
  EdgeInsets? margin,
  VoidCallback? onDismiss,
}) {
  String? shownMessage;

  if (message is List) {
    shownMessage = message.join('\n\n');
  } else if (message is String) {
    shownMessage = message;
  } else {
    throw FormatException(
        'Provided message is a type of ${message.runtimeType}');
  }

  showToastMessage(
    context,
    message: shownMessage,
    backgroundColor: context.colorScheme.error,
    textColor: context.colorScheme.onError,
    iconsColor: context.colorScheme.onError,
    margin: margin,
    onDismiss: onDismiss,
  );
}

class _AnimatedToastMessage extends StatefulWidget {
  final String message;
  final void Function() onDismiss;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconsColor;
  final Duration? duration;
  final EdgeInsets? margin;

  const _AnimatedToastMessage({
    required this.message,
    required this.onDismiss,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.textColor,
    this.iconsColor,
    this.duration,
    this.margin,
  });

  @override
  State<_AnimatedToastMessage> createState() => _AnimatedToastMessageState();
}

class _AnimatedToastMessageState extends State<_AnimatedToastMessage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  final utils = locator<Utils>();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(2.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await utils.sleep(
            duration: widget.duration ?? const Duration(seconds: 5));
        handleOnDismiss();
      }
    });
  }

  Future<void> handleOnDismiss() async {
    if (!_controller.isDismissed) {
      await _controller.reverse();
      widget.onDismiss();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: UICard(
          color: widget.backgroundColor ?? context.colorScheme.primary,
          border: BorderSide(color: context.colorScheme.secondary),
          padding: const EdgeInsets.all(12),
          margin: widget.margin ??
              EdgeInsets.fromLTRB(16, 0, 16, context.screenInsets.bottom + 16),
          child: Row(
            children: [
              widget.prefixIcon ??
                  Icon(
                    Icons.info_outline_rounded,
                    color: widget.iconsColor ?? context.colorScheme.onPrimary,
                  ),
              Expanded(
                child: UIText(
                  widget.message,
                  color: widget.textColor ?? context.colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              IconButton(
                onPressed: handleOnDismiss,
                icon: widget.suffixIcon ??
                    Icon(
                      Icons.close_rounded,
                      color: widget.iconsColor ?? context.colorScheme.onPrimary,
                    ),
                padding: const EdgeInsets.all(16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
