import 'package:flutter/widgets.dart';

class MediaQueryLocker extends StatelessWidget {
  const MediaQueryLocker({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(
        textScaleFactor: 1,
        boldText: false,
        alwaysUse24HourFormat: true,
        invertColors: false,
        disableAnimations: false,
        highContrast: false,
      ),
      child: child,
    );
  }
}
