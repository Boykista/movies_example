import 'package:flutter/material.dart';
import 'package:movies_example/shared/ui_components/ui_text.dart';

class ErrorRoutingDisplay extends StatelessWidget {
  final String? route;

  const ErrorRoutingDisplay({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: UIText(
          'Route $route isn\'t defined in router!',
          textAlign: TextAlign.center,
          padding: const EdgeInsets.symmetric(horizontal: 32),
        ),
      ),
    );
  }
}
