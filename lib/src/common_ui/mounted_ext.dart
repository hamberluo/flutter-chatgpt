import 'package:flutter/material.dart';

extension MountedExt on BuildContext {
  bool get mounted {
    try {
      // ignore: unnecessary_null_comparison
      return widget != null;
    } on Exception catch (_, __) {
      return false;
      // ignore: avoid_catching_errors
    } on Error catch (_, __) {
      return false;
    }
  }
}
