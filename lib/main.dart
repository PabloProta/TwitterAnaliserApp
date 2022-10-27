import 'package:flutter/material.dart';
import 'package:twitter_analiser_app/presentation/controller/main_controller.dart';
import 'package:twitter_analiser_app/presentation/hate_section/hate_section.dart';
import 'package:twitter_analiser_app/presentation/option_section/options_section.dart';
import 'package:twitter_analiser_app/presentation/widgets/twitter_section.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppContainer());
}

class AppContainer extends StatelessWidget {
  AppContainer({super.key});

  final _controller = MainController();
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
                    children: [
                      Expanded(
                        child: OptionsSectionWidget(
                          controller: _controller,
                        ),
                      ),
                      Expanded(
                        child: HateSectionWidget(
                          controller: _controller,
                        ),
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
