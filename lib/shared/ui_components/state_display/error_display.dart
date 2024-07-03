import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movies_example/shared/ui_components/ui_text.dart';
import 'package:movies_example/utils/extensions/build_context_extension.dart';

class ErrorDisplay extends StatelessWidget {
  final String? message;
  final String? description;
  final Widget? icon;
  final double? height;
  final double? width;
  final VoidCallback? onRefresh;
  final Color? textColor;
  final String? buttonLabel;

  const ErrorDisplay({
    super.key,
    this.onRefresh,
    this.message,
    this.description,
    this.height,
    this.width,
    this.icon,
    this.textColor,
    this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            const Spacer(),
            Icon(
              Icons.warning_amber_rounded,
              color: context.colorScheme.error,
              size: 42,
            ),
            const Gap(16),
            UIText(
              message ?? 'Dogodila se greška.',
              textAlign: TextAlign.center,
              color: textColor ?? context.colorScheme.error,
            ),
            const Gap(12),
            if (description != null)
              UIText(
                description!,
                fontSize: 14,
                textAlign: TextAlign.center,
                color: textColor ?? context.colorScheme.error,
              ),
            const Gap(12),
            if (onRefresh != null)
              FilledButton(
                onPressed: onRefresh,
                child: UIText(
                  buttonLabel ?? 'Osvježi',
                  color: context.colorScheme.secondary,
                ),
              ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
