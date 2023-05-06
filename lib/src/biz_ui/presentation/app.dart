import 'package:cogni_chat/i18n/i18n.g.dart';
import 'package:cogni_chat/src/biz_ui/presentation/route.r.dart';
import 'package:cogni_chat/src/common_ui/auto_display_mode.dart';
import 'package:cogni_chat/src/common_ui/cui/system_ui.dart';
import 'package:cogni_chat/src/common_ui/cui/theme.dart';
import 'package:cogni_chat/src/common_ui/media_query_locker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: AutoDisplayMode(
        child: SystemUi(
          child: MaterialApp.router(
            title: context.t.general.appName,
            routerConfig: router,
            theme: AppTheme.light,
            locale: TranslationProvider.of(context).flutterLocale,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            builder: (_, child) => MediaQueryLocker(child: child!),
          ),
        ),
      ),
    );
  }
}
