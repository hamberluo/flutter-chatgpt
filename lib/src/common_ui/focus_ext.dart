import 'package:flutter/widgets.dart';

extension FocusExt on BuildContext {
  void unfocus() => FocusScope.of(this).unfocus();
}
