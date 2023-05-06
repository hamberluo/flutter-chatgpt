import 'package:cogni_chat/i18n/i18n.g.dart';
import 'package:cogni_chat/src/biz_logic/data/repo/openai/openai_repo.dart';
import 'package:cogni_chat/src/biz_ui/presentation/chat_setting/widget/conversation_style_tab.dart';
import 'package:flutter/material.dart';

class ConversationStyleTabBar extends StatefulWidget {
  const ConversationStyleTabBar({super.key});

  @override
  State<ConversationStyleTabBar> createState() => _ConversationStyleTabBarState();
}

class _ConversationStyleTabBarState extends State<ConversationStyleTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    openAiRepo.getConversationStyle().then((value) {
      _tabController.animateTo(
        value,
        duration: Duration.zero,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      splashBorderRadius: BorderRadius.circular(12),
      onTap: openAiRepo.setConversationStyle,
      tabs: [
        ConversationStyleTab(
          text: context.t.home.styleCreative,
        ),
        ConversationStyleTab(
          text: context.t.home.styleBalance,
        ),
        ConversationStyleTab(
          text: context.t.home.stylePrecise,
        ),
      ],
    );
  }
}
