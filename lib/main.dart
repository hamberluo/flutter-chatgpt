import 'dart:async';

import 'package:cogni_chat/i18n/i18n.g.dart';
import 'package:cogni_chat/src/biz_ui/presentation/app.dart';
import 'package:cogni_chat/src/crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  crash.init();

  final onError = FlutterError.onError;
  FlutterError.onError = (FlutterErrorDetails details) {
    onError?.call(details);
    crash.recordFlutterError(details);
  };

  runZonedGuarded(
    () {
      runApp(
        TranslationProvider(
          child: const App(),
        ),
      );
    },
    crash.recordError,
  );
}
