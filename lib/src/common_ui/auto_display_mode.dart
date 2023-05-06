import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

class AutoDisplayMode extends StatefulWidget {
  const AutoDisplayMode({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AutoDisplayMode> createState() => _AutoDisplayModeState();
}

class _AutoDisplayModeState extends State<AutoDisplayMode> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _fixRefreshRate();
      });
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;

  Future<void> _fixRefreshRate() async {
    try {
      await FlutterDisplayMode.setHighRefreshRate();
    } on PlatformException catch (e) {
      switch (e.code) {
        // No API support. Only Marshmallow and above.
        case 'noAPI':
        // Activity is not available. Probably app is in background.
        case 'noActivity':
          break;
        default:
          rethrow;
      }
    }
  }
}
