import 'package:flutter/material.dart';
import 'package:movies_example/utils/extensions/build_context_extension.dart';

class UIText extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  final double? fontSize;
  final FontStyle? fontStyle;
  final Color? color;
  final FontWeight? fontWeight;
  final double? height;
  final double? letterSpacing;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  const UIText(
    this.text, {
    super.key,
    this.padding = EdgeInsets.zero,
    this.fontSize,
    this.fontStyle,
    this.color,
    this.fontWeight,
    this.height,
    this.letterSpacing,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: textStyle ??
            context.themeData.textTheme.bodyMedium!.copyWith(
              fontSize: fontSize,
              fontStyle: fontStyle,
              color: color,
              fontWeight: fontWeight,
              height: height,
              letterSpacing: letterSpacing,
            ),
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
      ),
    );
  }
}
