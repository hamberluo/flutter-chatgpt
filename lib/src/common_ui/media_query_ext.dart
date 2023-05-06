import 'package:flutter/material.dart';

extension MediaQueryExt on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;

  Orientation get orientation => MediaQuery.of(this).orientation;
}
