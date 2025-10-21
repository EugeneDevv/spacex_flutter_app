import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/core/utils/localization/language_constants.dart';
import 'package:spacex_flutter_app/presentation/utils/helper_functions.dart';
import 'package:spacex_flutter_app/presentation/widgets/custom_app_bar_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return buildBackgroundBody(
      context,
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
            title: getTranslated(context, 'settings') ?? 'Settings'),
      ),
    );
  }
}
