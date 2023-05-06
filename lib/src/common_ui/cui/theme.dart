import 'package:cogni_chat/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _pageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
  },
);

final _light = _LightTheme();
final _typography = Typography.material2018();

const _splashFactory = NoSplash.splashFactory;

class AppTheme {
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        fontFamily: FontFamily.notoSans,
        splashFactory: _splashFactory,
        useMaterial3: false,
        colorScheme: ColorScheme.light(
          primary: _light.brand.normal,
          onPrimary: _light.neutral.black100,
        ),
        typography: _typography,
        // ignore: deprecated_member_use
        androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
        pageTransitionsTheme: _pageTransitionsTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: _light.neutral.bg,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: systemUiLight,
          color: _light.neutral.white100,
          iconTheme: IconThemeData(
            color: _light.neutral.black100,
          ),
          actionsIconTheme: IconThemeData(
            color: _light.neutral.black100,
          ),
          titleTextStyle: TextStyle(
            color: _light.neutral.black100,
          ),
        ),
        extensions: <ThemeExtension<dynamic>>[
          CogniTheme(
            brand: _light.brand,
            neutral: _light.neutral,
          ),
        ],
      );

  static SystemUiOverlayStyle get systemUiLight => SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: _light.neutral.white100,
        systemNavigationBarDividerColor: _light.neutral.white100,
        systemNavigationBarContrastEnforced: false,
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
      );

  static SystemUiOverlayStyle get systemUiDark => SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: _light.neutral.black100,
        systemNavigationBarDividerColor: _light.neutral.black100,
        systemNavigationBarContrastEnforced: false,
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
      );

  static SystemUiOverlayStyle get systemUiBrand => SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: _light.brand.normal,
        systemNavigationBarDividerColor: _light.brand.normal,
        systemNavigationBarContrastEnforced: false,
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
      );
}

class CogniTheme extends ThemeExtension<CogniTheme> {
  CogniTheme({
    required this.brand,
    required this.neutral,
  });

  final ColorState brand;

  final Neutral neutral;

  @override
  ThemeExtension<CogniTheme> copyWith({
    ColorState? brand,
    Neutral? neutral,
  }) =>
      CogniTheme(
        brand: brand ?? this.brand,
        neutral: neutral ?? this.neutral,
      );

  @override
  ThemeExtension<CogniTheme> lerp(ThemeExtension<CogniTheme>? other, double t) => this;
}

abstract class _Theme {
  ColorState get brand;

  Neutral get neutral;
}

class _LightTheme implements _Theme {
  @override
  ColorState get brand => ColorState(const Color(0xff20a090));

  @override
  Neutral get neutral => Neutral(
        bg: const Color(0xfff3f3f3),
        inputBg: const Color(0xffe2e2e2),
        black100: const Color(0xff111111),
        white100: const Color(0xffffffff),
      );
}

class ColorState {
  ColorState(this.normal);

  final Color normal;

  Color get pressed => Color.alphaBlend(Colors.white.withOpacity(0.2), normal);

  Color get disable => Color.alphaBlend(Colors.black.withOpacity(0.7), normal);

  Color get background => Color.alphaBlend(Colors.black.withOpacity(0.85), normal);
}

class Neutral {
  Neutral({
    required this.bg,
    required this.inputBg,
    required this.black100,
    required this.white100,
  });

  final Color black100;
  final Color white100;
  final Color bg;
  final Color inputBg;
}
