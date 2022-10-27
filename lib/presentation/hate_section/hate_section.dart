import 'package:flutter/material.dart';
import 'package:twitter_analiser_app/presentation/controller/main_controller.dart';
import 'package:twitter_analiser_app/presentation/model/hate_types.dart';

class HateSectionWidget extends StatefulWidget {
  const HateSectionWidget({super.key, required this.controller});
  final MainController controller;

  @override
  State<HateSectionWidget> createState() => _HateSectionWidgetState();
}

class _HateSectionWidgetState extends State<HateSectionWidget> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text("Positive"),
          secondary: const Icon(Icons.sentiment_very_satisfied),
          controlAffinity: ListTileControlAffinity.leading,
          value: widget.controller.getHate(HateTypes.positive),
          onChanged: (value) =>
              widget.controller.setHate(HateTypes.positive, value!),
        ),
        CheckboxListTile(
          title: const Text("Neutro"),
          secondary: const Icon(Icons.sentiment_neutral),
          controlAffinity: ListTileControlAffinity.leading,
          value: widget.controller.getHate(HateTypes.neutral),
          onChanged: (value) =>
              widget.controller.setHate(HateTypes.neutral, value!),
        ),
        CheckboxListTile(
          title: const Text("Negativo"),
          secondary: const Icon(Icons.sentiment_very_dissatisfied),
          controlAffinity: ListTileControlAffinity.leading,
          value: widget.controller.getHate(HateTypes.negative),
          onChanged: (value) =>
              widget.controller.setHate(HateTypes.negative, value!),
        ),
      ],
    );
  }
}
