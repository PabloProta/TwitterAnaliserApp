import 'package:flutter/material.dart';

class RegionsSectionWidget extends StatelessWidget {
  const RegionsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: "sp",
      items: const [
        DropdownMenuItem(value: "sp", child: Text("São Paulo")),
        DropdownMenuItem(value: "rj", child: Text("Rio de Janeiro")),
        DropdownMenuItem(value: "ba", child: Text("Bahia")),
      ],
      onChanged: ((value) {}),
    );
  }
}
