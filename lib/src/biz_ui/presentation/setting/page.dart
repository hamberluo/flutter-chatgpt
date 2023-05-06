import 'package:cogni_chat/i18n/i18n.g.dart';
import 'package:cogni_chat/src/biz_ui/presentation/api_key/page.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaddedColumn(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: Text(context.t.setting.apiKey),
            onTap: () =>
                showDialog<String>(context: context, builder: (context) => const ApiKeyPage()),
          ),
          ListTile(
            title: Text(context.t.setting.language),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(context.t.setting.about),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
