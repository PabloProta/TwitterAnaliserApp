import 'package:flutter/material.dart';
import 'package:twitter_analiser_app/presentation/controller/main_controller.dart';

class PlataformsSectionWidget extends StatefulWidget {
  const PlataformsSectionWidget({super.key, required this.controller});
  final MainController controller;

  @override
  State<PlataformsSectionWidget> createState() => _PlataformsSectionWidgetState();
}

class _PlataformsSectionWidgetState extends State<PlataformsSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: widget.controller.getPlataform(),
      items: const [
        DropdownMenuItem(value: "android", child: Text("Android")),
        DropdownMenuItem(value: "ios", child: Text("Ios")),
        DropdownMenuItem(value: "web", child: Text("Internet")),
      ],
      onChanged: ((value) => widget.controller.setPlataform(value!)),
    );
  }
}
