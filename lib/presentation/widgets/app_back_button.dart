import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spacex_flutter_app/domain/entities/app_assets.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({this.iconSvgPath, this.onPressed, super.key});
  final String? iconSvgPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ??
          () {
            if (Navigator.of(context).canPop()) {
              Get.back();
            }
          },
      icon: SvgPicture.asset(
        iconSvgPath ?? SpaceXSvgs.shortBackArrowIcon,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onSurface,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
