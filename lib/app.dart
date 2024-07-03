import 'package:flutter/material.dart';
import 'package:movies_example/routing/router.dart';
import 'package:movies_example/shared/locator.dart';
import 'package:movies_example/theme/light_theme.dart';
import 'package:movies_example/utils/debug_logger.dart';

class App extends StatefulWidget {
  const App({super.key});

  static Future<void> initialize() async {
    setupLocator();
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    router.routeInformationProvider.addListener(() {
      DebugLogger.log(
        'Navigation url: ${router.routeInformationProvider.value.uri}',
      );
    });
  }

  void onResumed(AppLifecycleState state) {
    DebugLogger.log(state);
  }

  void onDetached(AppLifecycleState state) {
    WidgetsBinding.instance.removeObserver(this);

    DebugLogger.log(state);
  }

  void onHidden(AppLifecycleState state) {
    DebugLogger.log(state);
  }

  void onInactive(AppLifecycleState state) {
    DebugLogger.log(state);
  }

  void onPaused(AppLifecycleState state) {
    DebugLogger.log(state);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    return switch (state) {
      AppLifecycleState.resumed => onResumed(state),
      AppLifecycleState.detached => onDetached(state),
      AppLifecycleState.hidden => onHidden(state),
      AppLifecycleState.inactive => onInactive(state),
      AppLifecycleState.paused => onPaused(state),
    };
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      theme: LightTheme.data,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      builder: (context, child) {
        return Material(
          surfaceTintColor: Colors.transparent,
          child: child,
        );
      },
    );
  }
}
