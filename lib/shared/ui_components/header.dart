import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_example/shared/ui_components/ui_text.dart';
import 'package:movies_example/utils/extensions/build_context_extension.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? backButtonIcon;
  final Widget? leading;
  final double? leadingWidth;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onBack;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final double height;
  final bool showBackButton;

  const Header({
    super.key,
    this.titleText,
    this.actions,
    this.backButtonIcon,
    this.leading,
    this.leadingWidth,
    this.bottom,
    this.onBack,
    this.title,
    this.backgroundColor,
    this.padding,
    this.height = 52,
    this.showBackButton = true,
  });

  double get headerHeight => height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? Padding(
              padding: padding ?? EdgeInsets.zero,
              child: leading ??
                  IconButton(
                    onPressed: () => onBack != null ? onBack!() : context.pop(),
                    icon: backButtonIcon ??
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: context.textColor,
                        ),
                  ),
            )
          : null,
      leadingWidth: leadingWidth,
      title: title ??
          UIText(
            titleText ?? '',
            fontSize: 20,
          ),
      centerTitle: false,
      bottom: bottom,
      surfaceTintColor: Colors.transparent,
      backgroundColor: backgroundColor,
      shadowColor: context.themeData.appBarTheme.shadowColor,
      elevation: 5,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, height);
}
