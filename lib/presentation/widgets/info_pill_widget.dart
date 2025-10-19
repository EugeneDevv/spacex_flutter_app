// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spacex_flutter_app/core/utils/text_theme.dart';
import 'package:spacex_flutter_app/presentation/widgets/spaces.dart';

class InfoPillWidget extends StatelessWidget {
  const InfoPillWidget({
    super.key,
    required this.label,
    required this.iconSvgPath,
  });

  final String label;
  final String iconSvgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconSvgPath,
            color: Theme.of(context).colorScheme.onSurface,
            height: 18,
          ),
          verySmallHorizontalSizedBox,
          Text(
            label,
            style: normalSize14Text(Theme.of(context).colorScheme.onSurface),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
