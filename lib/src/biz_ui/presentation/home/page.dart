import 'package:cogni_chat/gen/assets.gen.dart';
import 'package:cogni_chat/gen/fonts.gen.dart';
import 'package:cogni_chat/i18n/i18n.g.dart';
import 'package:cogni_chat/src/biz_logic/data/repo/openai/openai_repo.dart';
import 'package:cogni_chat/src/biz_ui/presentation/home/widget/prompt_text.dart';
import 'package:cogni_chat/src/biz_ui/presentation/route.r.dart';
import 'package:cogni_chat/src/common_ui/cui/c_image.dart';
import 'package:cogni_chat/src/common_ui/cui/chat_input_bar.dart';
import 'package:cogni_chat/src/common_ui/cui/preset_text_style.dart';
import 'package:cogni_chat/src/common_ui/theme_ext.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    openAiRepo.initApiKey();
  }

  @override
  Widget build(BuildContext context) {
    final prompts = [
      context.t.home.prompt1,
      context.t.home.prompt2,
      context.t.home.prompt3,
    ];
    final hint = context.t.home.inputHint;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.general.appName,
          style: PresetTextStyle.text16M.copyWith(
            color: context.cogniTheme.neutral.black100,
            fontFamily: FontFamily.orbitron,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => const SettingRoute().push<void>(context),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CImage(
                Assets.images.general.icSetting,
                width: 24,
                height: 24,
                color: context.cogniTheme.neutral.black100,
              ),
            ),
          ),
          const Gap(8),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          PaddedColumn(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
              bottom: 72,
            ),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.t.home.hello,
                style: PresetTextStyle.text20R.withColor(context.cogniTheme.neutral.black100),
              ),
              const Gap(12),
              Text(
                context.t.home.guide,
                style: PresetTextStyle.text14R.withColor(context.cogniTheme.neutral.black100),
              ),
              const Gap(32),
              ...List.generate(prompts.length, (index) {
                return PromptText(
                  text: prompts[index],
                  onTap: () => ChatRoute(
                    message: prompts[index],
                    hint: hint,
                  ).push<void>(context),
                  margin: EdgeInsets.only(top: index > 0 ? 16 : 0),
                );
              }),
            ],
          ),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => ChatRoute(hint: hint).push<void>(context),
              behavior: HitTestBehavior.opaque,
              child: IgnorePointer(
                child: ChatInputBar(
                  hintText: hint,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
