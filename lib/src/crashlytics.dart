import 'package:cogni_chat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

final crash = Crashlytics.instance;

class Crashlytics {
  Crashlytics._();

  static final Crashlytics _instance = Crashlytics._();

  static Crashlytics get instance => _instance;

  bool _initialized = false;

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    _initialized = true;
  }

  void recordFlutterError(FlutterErrorDetails details) {
    if (!_enabled) {
      return;
    }
    FirebaseCrashlytics.instance.recordFlutterError(details);
  }

  void recordError(dynamic exception, StackTrace? stack) {
    if (!_enabled) {
      return;
    }
    FirebaseCrashlytics.instance.recordError(exception, stack);
  }

  bool get _enabled => _initialized && kReleaseMode;
}
