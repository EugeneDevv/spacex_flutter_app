import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/core/utils/colors.dart';
import 'package:spacex_flutter_app/core/utils/text_theme.dart';
import 'package:spacex_flutter_app/data/models/capsule_model.dart';
import 'package:spacex_flutter_app/presentation/utils/helper_functions.dart';
import 'package:spacex_flutter_app/presentation/widgets/spaces.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    const double outerRadius = 8;
    const double dotRadius = 3;
    final Color outerColor =
        !isDarkMode && (status == 'retired' || status == 'unknown')
            ? AppColors.lightBackground
            : getStatusColor(status, context);

    final Color dotColor = capsule.status == 'destroyed' || status == 'active'
                        ? Colors.white
                        : AppColors.background;
    return miniBadge
        ? Container(
            // Outer Circle
            width: outerRadius * 2,
            height: outerRadius * 2,
            decoration: BoxDecoration(
              color: outerColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              // Inner Dot
              child: Container(
                width: dotRadius * 2,
                height: dotRadius * 2,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
            decoration: BoxDecoration(
              color: outerColor,
              borderRadius: BorderRadius.circular(60.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                    status == 'active'
                        ? Icons.check
                        : status == 'destroyed'
                            ? Icons.close
                            : Icons.circle,
                    size: 8,
                    color: dotColor),
                tinyHorizontalSizedBox,
                tinyHorizontalSizedBox,
                Text(
                  status,
                  style: normalSize8Text(
                          capsule.status == 'destroyed' || status == 'active'
                              ? Colors.white
                              : AppColors.background)
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
  }
}
