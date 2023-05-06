import 'package:cogni_chat/src/common_ui/cui/preset_text_style.dart';
import 'package:cogni_chat/src/common_ui/theme_ext.dart';
import 'package:flutter/widgets.dart';

class PromptText extends StatelessWidget {
  const PromptText({
    super.key,
    required this.text,
    this.onTap,
    this.margin = EdgeInsets.zero,
  });

  final String text;
  final VoidCallback? onTap;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: context.cogniTheme.brand.normal.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: PresetTextStyle.text14R.withColor(
            context.cogniTheme.brand.normal,
          ),
        ),
      ),
    );
  }
}
