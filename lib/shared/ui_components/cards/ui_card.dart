import 'package:flutter/material.dart';
import 'package:movies_example/utils/extensions/build_context_extension.dart';

class UICard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color? color;
  final Color? shadowColor;
  final Color? splashColor;
  final EdgeInsets margin;
  final VoidCallback? onTap;
  final BorderSide? border;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final Clip? clipBehaviour;

  const UICard({
    super.key,
    required this.child,
    this.color,
    this.shadowColor,
    this.splashColor,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 32,
    ),
    this.margin = EdgeInsets.zero,
    this.onTap,
    this.borderRadius,
    this.border,
    this.elevation,
    this.clipBehaviour,
  });

  @override
  Widget build(BuildContext context) {
    final cardTheme = context.themeData.cardTheme;
    final shape = cardTheme.shape as RoundedRectangleBorder;

    Widget childWidget = Padding(
      padding: padding,
      child: child,
    );

    if (onTap != null) {
      childWidget = InkWell(
        onTap: onTap,
        borderRadius: borderRadius?.resolve(TextDirection.ltr) ??
            shape.borderRadius.resolve(TextDirection.ltr),
        splashColor:
            splashColor ?? context.colorScheme.primary.withOpacity(0.05),
        highlightColor: splashColor?.withOpacity(0.2) ??
            context.colorScheme.primary.withOpacity(0.05),
        child: childWidget,
      );
    }

    return Card(
      clipBehavior: clipBehaviour,
      elevation: elevation ?? 0,
      margin: margin,
      color: color,
      surfaceTintColor: color ?? cardTheme.surfaceTintColor,
      shadowColor: shadowColor ?? cardTheme.shadowColor,
      shape: RoundedRectangleBorder(
        side: border ?? shape.side,
        borderRadius: borderRadius ?? shape.borderRadius,
      ),
      child: childWidget,
    );
  }
}
