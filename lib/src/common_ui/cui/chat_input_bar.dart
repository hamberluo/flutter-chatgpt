import 'package:cogni_chat/gen/assets.gen.dart';
import 'package:cogni_chat/src/common_ui/cui/c_image.dart';
import 'package:cogni_chat/src/common_ui/cui/preset_text_style.dart';
import 'package:cogni_chat/src/common_ui/theme_ext.dart';
import 'package:flutter/material.dart';

class ChatInputBar extends StatefulWidget {
  const ChatInputBar({
    super.key,
    this.onSubmitted,
    this.hintText,
    this.maxLines,
  });

  final ValueChanged<String>? onSubmitted;
  final String? hintText;
  final int? maxLines;

  @override
  _ChatInputBarState createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  late TextEditingController _textEditingController;

  bool get _isComposing => _textEditingController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: context.cogniTheme.neutral.white100,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: context.cogniTheme.neutral.black100.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _textEditingController,
        style: PresetTextStyle.text14R.withColor(context.cogniTheme.neutral.black100),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: PresetTextStyle.text14R
              .withColor(context.cogniTheme.neutral.black100.withOpacity(0.4)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          suffixIcon: GestureDetector(
            onTap: _isComposing ? () => _handleSubmitted(_textEditingController.text) : null,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 32,
                height: 32,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isComposing ? context.cogniTheme.brand.normal : const Color(0xffd9d9d9),
                ),
                child: CImage(
                  Assets.images.general.icSend,
                ),
              ),
            ),
          ),
        ),
        onSubmitted: _isComposing ? _handleSubmitted : null,
        textInputAction: TextInputAction.newline,
        maxLines: widget.maxLines,
        minLines: 1,
        onChanged: (value) => setState(() {}),
      ),
    );
  }

  void _handleSubmitted(String text) {
    final trimmedText = text.trim();
    widget.onSubmitted?.call(trimmedText);
    _textEditingController.clear();
  }
}
