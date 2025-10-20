import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/core/utils/colors.dart';
import 'package:spacex_flutter_app/core/utils/text_theme.dart';
import 'package:spacex_flutter_app/data/models/capsule_model.dart';
import 'package:spacex_flutter_app/presentation/utils/helper_functions.dart';
import 'package:spacex_flutter_app/presentation/widgets/status_badge.dart';
import 'package:spacex_flutter_app/presentation/widgets/spaces.dart';

class CapsuleCard extends StatelessWidget {
  const CapsuleCard({
    super.key,
    required this.capsule,
    required this.status,
    this.miniBadge = false,
  });

  final CapsuleModel capsule;
  final String status;
  final bool miniBadge;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: getStatusColor(capsule.status, context).withOpacity(0.15),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: getStatusColor(capsule.status, context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatusBadge(
            capsule: capsule,
            status: status,
            miniBadge: miniBadge,
          ),
          verySmallVerticalSizedBox,
          Text(
            capsule.type ?? 'Unknown Type',
            style: mediumSize16Text(status == 'active'
                ? AppColors.success
                : status == 'destroyed'
                    ? AppColors.error
                    : Theme.of(context).colorScheme.onSurface),
          ),
          verySmallVerticalSizedBox,
          Text(
            'Reuse count: ${capsule.reuseCount ?? 0}',
            style: normalSize12Text((status == 'active'
                    ? AppColors.success
                    : status == 'destroyed'
                        ? AppColors.error
                        : Theme.of(context).colorScheme.onSurface)
                .withOpacity(0.75)),
          ),
        ],
      ),
    );
  }
}
