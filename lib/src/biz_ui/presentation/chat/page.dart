import 'dart:async';

import 'package:cogni_chat/gen/assets.gen.dart';
import 'package:cogni_chat/gen/fonts.gen.dart';
import 'package:cogni_chat/i18n/i18n.g.dart';
import 'package:cogni_chat/src/biz_ui/bloc/bean/chat/chat_message.dart';
import 'package:cogni_chat/src/biz_ui/bloc/provider/chat/chat_notifier.dart';
import 'package:cogni_chat/src/biz_ui/presentation/route.r.dart';
import 'package:cogni_chat/src/common_ui/cui/c_image.dart';
import 'package:cogni_chat/src/common_ui/cui/chat_bubble.dart';
import 'package:cogni_chat/src/common_ui/cui/chat_input_bar.dart';
import 'package:cogni_chat/src/common_ui/cui/preset_text_style.dart';
import 'package:cogni_chat/src/common_ui/focus_ext.dart';
import 'package:cogni_chat/src/common_ui/theme_ext.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({
    super.key,
    required this.message,
    required this.hint,
  });

  final String message;
  final String hint;

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  late final ScrollController _scrollController;
  Timer? _scrollTimer;
  final _chatProvider =
      StateNotifierProvider<ChatNotifier, List<ChatMessage>>((ref) => ChatNotifier());
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    if (widget.message.isNotEmpty) {
      Future.microtask(() => _onSubmitted(prompt: widget.message));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollTimer?.cancel();
    _scrollTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
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
                top: 12,
              ),
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 72),
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      final message = ref.watch(_chatProvider)[index];
                      return ChatBubble(message: message);
                    },
                    itemCount: ref.watch(_chatProvider).length,
                  ),
                ),
                if (_hasError)
                  OutlinedButton(
                    onPressed: _onSubmitted,
                    child: PaddedRow(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.refresh),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            context.t.chat.regenerate,
                          ),
                        ),
                      ],
                    ),
                  ),
                const Gap(8),
              ],
            ),
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: _hasError || ref.watch(_chatProvider.notifier).isQuerying() ? 0 : 1,
                duration: const Duration(milliseconds: 500),
                child: ChatInputBar(
                  maxLines: 5,
                  hintText: widget.hint,
                  onSubmitted: (value) {
                    context.unfocus();
                    _onSubmitted(prompt: value);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmitted({String? prompt}) {
    setState(() {
      _hasError = false;
    });
    ref.read(_chatProvider.notifier).query(prompt).then((success) {
      setState(() {
        _hasError = !success;
      });
    });
    _scrollTimer?.cancel();
    _scrollTimer = null;
    _scrollTimer = Timer(
      const Duration(milliseconds: 300),
      () {
        if (mounted) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }
      },
    );
  }
}
