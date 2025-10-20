import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spacex_flutter_app/core/utils/text_theme.dart';
import 'package:spacex_flutter_app/domain/entities/app_assets.dart';
import 'package:spacex_flutter_app/domain/entities/launch_entity.dart';
import 'package:spacex_flutter_app/presentation/widgets/custom_app_bar_widget.dart';
import 'package:spacex_flutter_app/presentation/widgets/info_pill_widget.dart';
import 'package:spacex_flutter_app/presentation/widgets/spaces.dart';

class LaunchDetailsScreen extends StatelessWidget {
  final LaunchEntity? launch;
  const LaunchDetailsScreen({super.key, this.launch});

  @override
  Widget build(BuildContext context) {
    final launch = Get.arguments;
    final formattedDate = DateFormat('MMM dd, yyyy')
        .format(launch.launchDateUtc ?? DateTime.now());
    return Scaffold(
      appBar: const CustomAppBar(title: 'Launch Details'),
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
                      launch.missionName,
                      style: boldSize20Text(
                          Theme.of(context).colorScheme.onSurface),
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
              verySmallVerticalSizedBox,
              Text(
                launch.details ?? 'No details available.',
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
                  // Rocket Name
                  InfoPillWidget(
                    label: launch.rocketName,
                    iconSvgPath: SpaceXSvgs.verticalRocketIcon,
                  ),
                  if (launch.launchCost?.isNotEmpty ?? false)
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
