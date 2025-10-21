import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spacex_flutter_app/core/utils/localization/language_constants.dart';
import 'package:spacex_flutter_app/core/utils/text_theme.dart';
import 'package:spacex_flutter_app/data/models/rocket_model.dart';
import 'package:spacex_flutter_app/domain/entities/app_assets.dart';
import 'package:spacex_flutter_app/presentation/utils/helper_functions.dart';
import 'package:spacex_flutter_app/presentation/widgets/custom_app_bar_widget.dart';
import 'package:spacex_flutter_app/presentation/widgets/info_pill_widget.dart';
import 'package:spacex_flutter_app/presentation/widgets/spaces.dart';
import 'package:spacex_flutter_app/presentation/widgets/url_launcher_icon_button.dart';

class RocketDetailsScreen extends StatelessWidget {
  const RocketDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rocket = Get.arguments as RocketModel?;
    final formattedDate = DateFormat('MMM dd, yyyy')
        .format(DateTime.tryParse(rocket?.firstFlight ?? '') ?? DateTime.now());
    return buildBackgroundBody(
      context,
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
            title:
                getTranslated(context, 'rocket_details') ?? 'Rocket Details'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        rocket?.name ?? getTranslated(context, 'unknown') ??
                            'Unknown',
                        style: boldSize20Text(
                            Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                    smallHorizontalSizedBox,
                    if (rocket?.wikipedia?.isNotEmpty ?? false)
                      UrlLauncherIcon(
                        // Replace with the actual URL property from your RocketModel or CapsuleModel
                        url: rocket!.wikipedia!,
                        icon: Icons.open_in_new_rounded,

                        iconColor: Theme.of(context).colorScheme.onSurface,
                        iconSize: 18, // Adjust size as needed
                      ),
                  ],
                ),
                verySmallVerticalSizedBox,
                Text(
                  rocket?.description ?? 'No details available.',
                  style:
                      normalSize14Text(Theme.of(context).colorScheme.onSurface),
                ),
                smallVerticalSizedBox,
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  alignment: WrapAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  children: [
                    if (rocket?.country?.isNotEmpty ?? false)
                      InfoPillWidget(
                        label: rocket!.country!,
                        iconSvgPath: SpaceXSvgs.locationIcon,
                      ),
                    if ((rocket?.costPerLaunch ?? 0) > 0)
                      InfoPillWidget(
                        label: formatNumberConcise(rocket!.costPerLaunch!),
                        iconSvgPath: SpaceXSvgs.dollarRocketIcon,
                      ),
                    if ((rocket?.mass?.kg ?? 0) > 0)
                      InfoPillWidget(
                        label: formatWeightInTonnes(rocket!.mass!.kg!),
                        iconSvgPath: SpaceXSvgs.weightIcon,
                      ),
                    if ((rocket?.height?.meters ?? 0) > 0)
                      InfoPillWidget(
                        label: formatDistanceConcise(rocket!.height!.meters!),
                        iconSvgPath: SpaceXSvgs.heightIcon,
                      ),
                    if ((rocket?.diameter?.meters ?? 0) > 0)
                      InfoPillWidget(
                        label: formatDistanceConcise(rocket!.diameter!.meters!),
                        iconSvgPath: SpaceXSvgs.widthIcon,
                      ),
                  ],
                ),
                largeVerticalSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        rocket?.company ?? 'Unknown',
                        style: normalSize12Text(
                            Theme.of(context).colorScheme.onSurface),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: normalSize12Text(
                          Theme.of(context).colorScheme.onSurface),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
