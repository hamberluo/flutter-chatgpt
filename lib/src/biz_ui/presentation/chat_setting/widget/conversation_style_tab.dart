import 'package:cogni_chat/src/common_ui/cui/preset_text_style.dart';
import 'package:flutter/material.dart';

class ConversationStyleTab extends StatelessWidget {
  const ConversationStyleTab({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 100,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: PresetTextStyle.text16B,
      ),
    );
  }
}
