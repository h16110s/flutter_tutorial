import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tutorial/app_state.dart';
import 'package:flutter_tutorial/chat_data.dart';

class SendForm extends StatefulWidget {
  const SendForm({
    super.key,
  });

  @override
  State<SendForm> createState() => _SendFormState();
}

class _SendFormState extends State<SendForm> {
  final _editController = TextEditingController();

  Future<Map> sendChatMessage(String message) async {
    await dotenv.load(fileName: '.env');
    String apiKey = dotenv.get('API_KEY');

    var response = await http.post(
      // TODO: constとして定義しておくといい
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo-0613",
        "max_tokens": 256,
        "messages": [
          {
            "role": "system",
            "content":
                "Please make all responses in sentences of up to 256 tokens."
          },
          {"role": "user", "content": message},
        ]
      }),
    );
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // appStateの取得
    var appState = context.watch<AppState>();

    return Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            controller: _editController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
            onChanged: (String text) {
              appState.setCurrent(text);
            },
          ),
        ),
        IconButton(
          onPressed: () {
            String current = appState.current;
            appState.addHistory(ChatData(ChatMessageType.sent, current));
            sendChatMessage(current).then((response) {
              String msg = response['choices'][0]['message']['content'];
              appState.addHistory(ChatData(ChatMessageType.received, msg));
            });
            _editController.clear();
          },
          icon: const Icon(Icons.send),
          color: theme.colorScheme.primary,
          iconSize: 40,
        )
      ],
    );
  }
}
