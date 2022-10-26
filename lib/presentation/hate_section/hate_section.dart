import 'package:flutter/material.dart';

class HateSectionWidget extends StatelessWidget {
  const HateSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text("Positive"),
          secondary: const Icon(Icons.sentiment_very_satisfied),
          controlAffinity: ListTileControlAffinity.leading,
          value: false,
          onChanged: (value) {},
        ),
        CheckboxListTile(
          title: const Text("Neutro"),
          secondary: const Icon(Icons.sentiment_neutral),
          controlAffinity: ListTileControlAffinity.leading,
          value: false,
          onChanged: (value) {},
        ),
        CheckboxListTile(
          title: const Text("Negativo"),
          secondary: const Icon(Icons.sentiment_very_dissatisfied),
          controlAffinity: ListTileControlAffinity.leading,
          value: false,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
