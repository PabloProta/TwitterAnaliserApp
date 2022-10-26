import 'package:flutter/material.dart';
import 'package:twitter_analiser_app/presentation/hate_section/hate_section.dart';
import 'package:twitter_analiser_app/presentation/option_section/options_section.dart';
import 'package:twitter_analiser_app/presentation/widgets/twitter_section.dart';

void main() {
  runApp(const AppContainre());
}

class AppContainre extends StatelessWidget {
  const AppContainre({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Twitter Analiser"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Expanded(
                        child: OptionsSectionWidget(),
                      ),
                      Expanded(
                        child: HateSectionWidget(),
                      )
                    ],
                  ),
                ),
              ),
              const Expanded(
                flex: 30,
                child: TwitterSectionWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
