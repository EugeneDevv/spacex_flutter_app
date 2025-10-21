import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spacex_flutter_app/core/utils/localization/language_constants.dart';
import 'package:spacex_flutter_app/core/utils/text_theme.dart';
import 'package:spacex_flutter_app/domain/entities/app_assets.dart';

class ZeroStateWidget extends StatelessWidget {
  final VoidCallback callBack;
  const ZeroStateWidget({
    super.key,
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
            SvgPicture.asset(SpaceXSvgs.emptyStateRafiki, height: 260,),
            const SizedBox(height: 16),
            Text(
              getTranslated(context, 'error_data_not_found') ??
                  'Data not found',
              style: normalSize16Text(Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 16),
            // Button to retry fetching
            ElevatedButton.icon(
              onPressed: callBack,
              icon: const Icon(Icons.refresh),
              label: Text(getTranslated(context, 'refresh') ?? 'Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
