import 'package:cogni_chat/i18n/i18n.g.dart';
import 'package:cogni_chat/src/biz_logic/data/repo/openai/openai_repo.dart';
import 'package:flutter/material.dart';

class ApiKeyPage extends StatefulWidget {
  const ApiKeyPage({super.key});

  @override
  State<ApiKeyPage> createState() => _ApiKeyPageState();
}

class _ApiKeyPageState extends State<ApiKeyPage> {
  late final TextEditingController _apiKeyController;

  @override
  void initState() {
    super.initState();
    _apiKeyController = TextEditingController();
    openAiRepo.getApiKey().then((value) {
      _apiKeyController.text = value;
    });
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.t.apiKey.title),
      content: TextField(
        controller: _apiKeyController,
        decoration: InputDecoration(hintText: context.t.apiKey.hint),
        obscureText: true,
      ),
      actions: [
        TextButton(
          child: Text(context.t.general.cancel),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: Text(context.t.general.ok),
          onPressed: () {
            final newApiKey = _apiKeyController.text.trim();
            openAiRepo.setApiKey(newApiKey);
            Navigator.pop(context, newApiKey);
          },
        ),
      ],
    );
  }
}
