import 'package:flutter/material.dart';
import 'package:movies_example/shared/ui_components/ui_text.dart';
import 'package:movies_example/utils/extensions/build_context_extension.dart';

class UIDivider extends StatelessWidget {
  final String? middleText;
  final double spaceAroundText;
  final double? indent;
  final double? endIndent;
  final double thickness;
  final Color? color;
  final DividerDirection direction;

  const UIDivider({
    super.key,
    this.middleText,
    this.spaceAroundText = 16,
    this.indent,
    this.endIndent,
    this.thickness = 1,
    this.color,
    this.direction = DividerDirection.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    if (direction == DividerDirection.horizontal) {
      return Row(
        children: [
          Expanded(
            child: Divider(
              thickness: thickness,
              indent: indent,
              endIndent: middleText != null ? spaceAroundText : 0,
              color: color ?? context.themeData.dividerColor,
              height: thickness,
            ),
          ),
          if (middleText != null)
            UIText(
              middleText!,
              padding: const EdgeInsets.only(bottom: 4),
              color: color,
            ),
          Expanded(
            child: Divider(
              thickness: thickness,
              indent: middleText != null ? spaceAroundText : 0,
              endIndent: endIndent,
              color: color ?? context.themeData.dividerColor,
              height: thickness,
            ),
          ),
        ],
      );
    }
    return Column(
      children: [
        Expanded(
          child: VerticalDivider(
            thickness: thickness,
            indent: indent,
            endIndent: middleText != null ? spaceAroundText : 0,
            color: color ?? context.themeData.dividerColor,
            width: thickness,
          ),
        ),
        if (middleText != null)
          UIText(
            middleText!,
            padding: const EdgeInsets.only(bottom: 4),
          ),
        Expanded(
          child: VerticalDivider(
            thickness: thickness,
            indent: middleText != null ? spaceAroundText : 0,
            endIndent: endIndent,
            color: color ?? context.themeData.dividerColor,
            width: thickness,
          ),
        ),
      ],
    );
  }
}

enum DividerDirection { horizontal, vertical }
