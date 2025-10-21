import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex_flutter_app/core/utils/localization/language_constants.dart';
import 'package:spacex_flutter_app/domain/entities/app_assets.dart';

class ErrorStateWidget extends StatelessWidget {
  final String? errorMessage;
  final VoidCallback callBack;
  const ErrorStateWidget({
    super.key,
    this.errorMessage,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              SpaceXAnimations.sadErrorLottie,
              // width: 60,
              // height: 60,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 16),
            Text(
              errorMessage ?? getTranslated(context, 'error_loading_data') ?? 'Error loading data',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.redAccent),
            ),
            const SizedBox(height: 16),
            // Button to retry fetching
            ElevatedButton.icon(
              onPressed: callBack,
              icon: const Icon(Icons.refresh),
              label: Text(getTranslated(context, 'try_again') ?? 'Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
