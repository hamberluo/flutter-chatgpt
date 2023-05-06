import 'package:cogni_chat/src/common_ui/cui/theme.dart';
import 'package:cogni_chat/src/common_ui/theme_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUi extends StatelessWidget {
  const SystemUi({
    super.key,
    required this.child,
    this.overlayStyle,
  });

  final Widget child;
  final SystemUiOverlayStyle? overlayStyle;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle ?? (context.isLight ? AppTheme.systemUiLight : AppTheme.systemUiDark),
      child: child,
    );
  }
}
