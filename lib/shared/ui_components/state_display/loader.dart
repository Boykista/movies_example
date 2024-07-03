import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_example/utils/extensions/build_context_extension.dart';

class Loader extends StatelessWidget {
  final Color? color;

  const Loader({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? Transform.scale(
              scale: 1.5,
              child: CupertinoActivityIndicator(
                color: color ?? context.colorScheme.primary,
              ),
            )
          : CircularProgressIndicator(
              color: color ?? context.colorScheme.primary,
            ),
    );
  }
}
