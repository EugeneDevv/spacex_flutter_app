import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spacex_flutter_app/core/utils/text_theme.dart';
import 'package:spacex_flutter_app/domain/entities/app_assets.dart';
import 'package:spacex_flutter_app/domain/entities/launch_entity.dart';
import 'package:spacex_flutter_app/presentation/widgets/info_pill_widget.dart';
import 'package:spacex_flutter_app/presentation/widgets/spaces.dart';

class LaunchCard extends StatelessWidget {
  final LaunchEntity launch;

  const LaunchCard({required this.launch, super.key});

  @override
  Widget build(BuildContext context) {
    // Determine status text and color

    // Format the UTC date nicely
    final formattedDate = DateFormat('MMM dd, yyyy')
        .format(launch.launchDateUtc ?? DateTime.now());

    return GestureDetector(
      onTap: () {
        Get.toNamed('/launch-details', arguments: launch);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.6),
          borderRadius: BorderRadius.circular(12.0),
          // Highlight the card based on launch success status
          border:
              Border.all(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mission Name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      launch.missionName,
                      style: boldSize16Text(
                          Theme.of(context).colorScheme.onSurface),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  smallHorizontalSizedBox,
                  Text(
                    formattedDate,
                    style: normalSize14Text(
                        Theme.of(context).colorScheme.onSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              smallVerticalSizedBox,
              // Description
              Text(
                launch.details ?? 'No description available.',
                style:
                    normalSize14Text(Theme.of(context).colorScheme.onSurface),
                maxLines: 2,
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
                  // Rocket Name
                  InfoPillWidget(
                    label: launch.rocketName,
                    iconSvgPath: SpaceXSvgs.verticalRocketIcon,
                  ),
                  if(launch.launchCost?.isNotEmpty ?? false)
                  InfoPillWidget(
                    label: launch.launchCost!,
                    iconSvgPath: SpaceXSvgs.dollarRocketIcon,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
