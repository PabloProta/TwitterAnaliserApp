import 'package:flutter/material.dart';

class PlataformsSectionWidget extends StatelessWidget {
  const PlataformsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: "android",
      items: const [
        DropdownMenuItem(value: "android", child: Text("Android")),
        DropdownMenuItem(value: "ios", child: Text("Ios")),
        DropdownMenuItem(value: "web", child: Text("Internet")),
      ],
      onChanged: ((value) {}),
    );
  }
}
