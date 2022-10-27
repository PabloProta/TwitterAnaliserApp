import 'package:flutter/material.dart';
import 'package:twitter_analiser_app/presentation/controller/main_controller.dart';

class RegionsSectionWidget extends StatefulWidget {
  const RegionsSectionWidget({super.key, required this.controller});
  final MainController controller;

  @override
  State<RegionsSectionWidget> createState() => _RegionsSectionWidgetState();
}

class _RegionsSectionWidgetState extends State<RegionsSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: widget.controller.getRegion(),
      items: widget.controller.getRegioes(),
      onChanged: ((value)  => widget.controller.setRegion(value!)),
    );
  }
}
