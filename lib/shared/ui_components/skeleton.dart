import 'package:flutter/material.dart';
import 'package:movies_example/utils/extensions/build_context_extension.dart';

class Skeleton extends StatefulWidget {
  final Widget child;

  const Skeleton({
    super.key,
    required this.child,
  });

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = Tween<double>(begin: 0.9, end: 0.4)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(animationController);

    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value,
          child: widget.child,
        );
      },
    );
  }
}

class SkeletonType extends StatelessWidget {
  final EdgeInsets? margin;
  final Size size;
  final Color? color;
  final BorderRadius? borderRadius;
  final BoxShape shape;

  const SkeletonType.line({
    super.key,
    this.margin,
    this.size = const Size.fromHeight(24),
    this.color,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  }) : shape = BoxShape.rectangle;

  const SkeletonType.circle({
    super.key,
    this.margin,
    this.size = const Size.fromRadius(20),
    this.color,
    this.borderRadius,
  }) : shape = BoxShape.circle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: color ?? context.colorScheme.primary.withOpacity(0.6),
        borderRadius: borderRadius,
        shape: shape,
      ),
    );
  }
}
