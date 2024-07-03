import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_example/shared/ui_components/skeleton.dart';
import 'package:movies_example/shared/ui_components/ui_text.dart';
import 'package:movies_example/utils/debug_logger.dart';
import 'package:movies_example/utils/extensions/build_context_extension.dart';

class CachedUrlImage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final BlendMode? colorBlendMode;
  final BorderRadiusGeometry? borderRadius;

  const CachedUrlImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.colorBlendMode,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: url ?? '',
        width: width,
        height: height,
        fit: fit,
        color: color,
        colorBlendMode: colorBlendMode,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Skeleton(
            child: SkeletonType.line(
              size: Size.fromHeight(height ?? 110),
            ),
          );
        },
        errorWidget: (context, url, error) {
          DebugLogger.log(error);

          return SizedBox(
            height: height,
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: context.colorScheme.error,
                    size: 40,
                  ),
                  UIText(
                    'Slika se ne može učitati',
                    color: context.colorScheme.error,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
