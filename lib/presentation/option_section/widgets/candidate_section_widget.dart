import 'package:flutter/material.dart';

class CandidateSectionWidget extends StatelessWidget {
  const CandidateSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: "bolsonaro",
      items: const [
        DropdownMenuItem(value: "bolsonaro", child: Text("Jair Bolsonaro")),
        DropdownMenuItem(value: "lula", child: Text("Lula")),
        DropdownMenuItem(value: "cirogomes", child: Text("Ciro Gomes")),
      ],
      onChanged: ((value) {}),
    );
  }
}
