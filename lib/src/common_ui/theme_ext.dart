import 'package:cogni_chat/src/common_ui/cui/theme.dart';
import 'package:flutter/material.dart';

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  CogniTheme get cogniTheme => maybeCogniTheme!;

  CogniTheme? get maybeCogniTheme => theme.extension<CogniTheme>();

  bool get isLight => theme.brightness == Brightness.light;
}
