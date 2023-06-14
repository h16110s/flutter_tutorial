import 'package:flutter/material.dart';

class SendForm extends StatelessWidget {
  const SendForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: <Widget>[
        const Flexible(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            print('btn pressed');
          },
          icon: const Icon(Icons.send),
          color: theme.colorScheme.primary,
          iconSize: 40,
        )
      ],
    );
  }
}
