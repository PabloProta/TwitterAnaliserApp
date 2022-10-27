import 'package:flutter/material.dart';
import 'package:twitter_analiser_app/presentation/controller/main_controller.dart';
import 'package:twitter_analiser_app/presentation/option_section/widgets/candidate_section_widget.dart';
import 'package:twitter_analiser_app/presentation/option_section/widgets/plataforms_section_widget.dart';
import 'package:twitter_analiser_app/presentation/option_section/widgets/regions_section_widget.dart';

class OptionsSectionWidget extends StatefulWidget {
  const OptionsSectionWidget({super.key, required this.controller});

  final MainController controller;

  @override
  State<OptionsSectionWidget> createState() => _OptionsSectionWidgetState();
}

class _OptionsSectionWidgetState extends State<OptionsSectionWidget> {
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
        CandidateSectionWidget(controller: widget.controller),
        PlataformsSectionWidget(controller: widget.controller),
        RegionsSectionWidget(controller : widget.controller)
      ],
    );
  }
}
