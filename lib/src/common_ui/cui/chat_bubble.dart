import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cogni_chat/src/biz_ui/bloc/bean/chat/chat_message.dart';
import 'package:cogni_chat/src/biz_ui/bloc/bean/chat/gpt_message.dart';
import 'package:cogni_chat/src/biz_ui/bloc/bean/chat/user_message.dart';
import 'package:cogni_chat/src/common_ui/cui/preset_text_style.dart';
import 'package:cogni_chat/src/common_ui/theme_ext.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
  });

  final ChatMessage message;

  bool get isMe => message is UserMessage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: isMe ? 32 : 16,
          right: isMe ? 16 : 32,
        ),
        child: PaddedColumn(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isMe
                    ? context.cogniTheme.brand.normal.withOpacity(0.16)
                    : context.cogniTheme.neutral.inputBg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isMe ? 24 : 0),
                  topRight: Radius.circular(isMe ? 24 : 24),
                  bottomLeft: Radius.circular(isMe ? 24 : 24),
                  bottomRight: Radius.circular(isMe ? 0 : 24),
                ),
              ),
              child: isMe
                  ? SelectableText(
                      message.message,
                    )
                  : (message as GptMessage).isQuerying
                      ? SizedBox(
                          width: 48,
                          child: SpinKitThreeBounce(
                            size: 12,
                            color: context.cogniTheme.neutral.black100,
                          ),
                        )
                      : AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              message.message,
                              textStyle: PresetTextStyle.text14R
                                  .withColor(context.cogniTheme.neutral.black100),
                              speed: const Duration(milliseconds: 20),
                            ),
                          ],
                          isRepeatingAnimation: false,
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
