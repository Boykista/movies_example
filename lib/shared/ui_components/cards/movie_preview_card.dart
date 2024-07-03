import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movies_example/shared/locator.dart';
import 'package:movies_example/shared/ui_components/cached_url_image.dart';
import 'package:movies_example/shared/ui_components/cards/ui_card.dart';
import 'package:movies_example/shared/ui_components/ui_text.dart';
import 'package:movies_example/utils/utils.dart';

class MoviePreviewCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final DateTime? releaseDate;
  final String? imageUrl;
  final double rating;

  const MoviePreviewCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.releaseDate,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final utils = locator<Utils>();

    return UICard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                CachedUrlImage(
                  url: imageUrl,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(24),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: const StadiumBorder(),
                      color: Colors.pink[50]!.withOpacity(0.9),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                          size: 20,
                        ),
                        const Gap(4),
                        UIText(
                          rating.toStringAsFixed(1),
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText(
                    title,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  if (releaseDate != null) ...[
                    const Gap(8),
                    UIText(utils.formatDate(releaseDate!)),
                  ],
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
