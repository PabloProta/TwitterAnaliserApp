import 'package:flutter/material.dart';
import 'package:twitter_analiser_app/presentation/controller/main_controller.dart';

class CandidateSectionWidget extends StatefulWidget {
  const CandidateSectionWidget({super.key, required this.controller});
  final MainController controller;

  @override
  State<CandidateSectionWidget> createState() => _CandidateSectionWidgetState();
}

class _CandidateSectionWidgetState extends State<CandidateSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: widget.controller.getCandidate(),
      items: const [
        DropdownMenuItem(value: "bolsonaro", child: Text("Jair Bolsonaro")),
        DropdownMenuItem(value: "lula", child: Text("Lula")),
        DropdownMenuItem(value: "cirogomes", child: Text("Ciro Gomes")),
      ],
      onChanged: ((value) {
          widget.controller.setCandidate(value!);
      }),
    );
  }
}
