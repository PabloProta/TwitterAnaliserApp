import 'package:flutter/material.dart';
import 'package:twitter_analiser_app/presentation/option_section/widgets/candidate_section_widget.dart';
import 'package:twitter_analiser_app/presentation/option_section/widgets/plataforms_section_widget.dart';
import 'package:twitter_analiser_app/presentation/option_section/widgets/regions_section_widget.dart';

class OptionsSectionWidget extends StatelessWidget {
  const OptionsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CandidateSectionWidget(),
        PlataformsSectionWidget(),
        RegionsSectionWidget()
      ],
    );
  }
}
