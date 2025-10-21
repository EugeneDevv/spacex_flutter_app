import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spacex_flutter_app/core/utils/colors.dart';
import 'package:spacex_flutter_app/core/utils/localization/language_constants.dart';
import 'package:spacex_flutter_app/core/utils/text_theme.dart';
import 'package:spacex_flutter_app/data/models/rocket_model.dart';
import 'package:spacex_flutter_app/domain/entities/app_assets.dart';
import 'package:spacex_flutter_app/presentation/utils/helper_functions.dart';
import 'package:spacex_flutter_app/presentation/widgets/info_pill_widget.dart';
import 'package:spacex_flutter_app/presentation/widgets/spaces.dart';

class RocketCard extends StatelessWidget {
  const RocketCard({
    super.key,
    required this.rocket,
  });

  final RocketModel rocket;

  @override
  Widget build(BuildContext context) {
    // Format the UTC date nicely
    final formattedDate = DateFormat('MMM dd, yyyy')
        .format(DateTime.tryParse(rocket.firstFlight ?? '') ?? DateTime.now());
    return GestureDetector(
      onTap: () {
        Get.toNamed('/rocket-details', arguments: rocket);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.6),
          borderRadius: BorderRadius.circular(12.0),
          border:
              Border.all(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    rocket.name ??
                        getTranslated(context, 'unknown') ??
                        'Unknown',
                    style: mediumSize16Text(
                        Theme.of(context).colorScheme.onSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                smallHorizontalSizedBox,
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 1.0),
                  decoration: BoxDecoration(
                    color: rocket.isActive ?? false
                        ? AppColors.success
                        : AppColors.error,
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(rocket.isActive ?? false ? Icons.check : Icons.close,
                          size: 12, color: Colors.white),
                      tinyHorizontalSizedBox,
                      tinyHorizontalSizedBox,
                      Text(
                        rocket.isActive ?? false ? 'Active' : 'Inactive',
                        style: normalSize8Text(Colors.white)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
            smallVerticalSizedBox,
            // Description
            Text(
              rocket.description ?? 'No description available.',
              style: normalSize14Text(Theme.of(context).colorScheme.onSurface),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            smallVerticalSizedBox,
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.start,
              children: [
                if (rocket.country?.isNotEmpty ?? false)
                  InfoPillWidget(
                    label: rocket.country!,
                    iconSvgPath: SpaceXSvgs.locationIcon,
                  ),
                if ((rocket.costPerLaunch ?? 0) > 0)
                  InfoPillWidget(
                    label: formatNumberConcise(rocket.costPerLaunch!),
                    iconSvgPath: SpaceXSvgs.dollarRocketIcon,
                  ),
                if ((rocket.mass?.kg ?? 0) > 0)
                  InfoPillWidget(
                    label: formatWeightInTonnes(rocket.mass!.kg!),
                    iconSvgPath: SpaceXSvgs.weightIcon,
                  ),
                if ((rocket.height?.meters ?? 0) > 0)
                  InfoPillWidget(
                    label: formatDistanceConcise(rocket.height!.meters!),
                    iconSvgPath: SpaceXSvgs.heightIcon,
                  ),
                if ((rocket.diameter?.meters ?? 0) > 0)
                  InfoPillWidget(
                    label: formatDistanceConcise(rocket.diameter!.meters!),
                    iconSvgPath: SpaceXSvgs.widthIcon,
                  ),
              ],
            ),
            smallVerticalSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    rocket.company ?? getTranslated(context, 'unknown') ??
                        'Unknown',
                    style: normalSize12Text(
                        Theme.of(context).colorScheme.onSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  formattedDate,
                  style:
                      normalSize12Text(Theme.of(context).colorScheme.onSurface),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
