import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cogni_chat/gen/assets.gen.dart';
import 'package:cogni_chat/gen/fonts.gen.dart';
import 'package:cogni_chat/i18n/i18n.g.dart';
import 'package:cogni_chat/src/biz_ui/presentation/route.r.dart';
import 'package:cogni_chat/src/common_ui/cui/c_image.dart';
import 'package:cogni_chat/src/common_ui/cui/preset_text_style.dart';
import 'package:cogni_chat/src/common_ui/cui/system_ui.dart';
import 'package:cogni_chat/src/common_ui/cui/theme.dart';
import 'package:cogni_chat/src/common_ui/theme_ext.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return SystemUi(
      overlayStyle: AppTheme.systemUiBrand,
      child: Scaffold(
        backgroundColor: context.cogniTheme.brand.normal,
        body: Center(
          child: PaddedColumn(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CImage(
                Assets.images.launch.icLauncher,
                width: 180,
                height: 180,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    context.t.general.appName,
                    speed: const Duration(milliseconds: 100),
                    textStyle: PresetTextStyle.text28B.copyWith(
                      fontFamily: FontFamily.orbitron,
                      color: context.cogniTheme.neutral.white100,
                    ),
                  ),
                ],
                isRepeatingAnimation: false,
                onFinished: () => HomeRoute().go(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
