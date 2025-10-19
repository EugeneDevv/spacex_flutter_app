import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_flutter_app/core/utils/text_theme.dart';
import 'package:spacex_flutter_app/presentation/providers/theme_provider.dart';
import 'package:spacex_flutter_app/presentation/widgets/app_back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.backButtonIconSvPath,
    this.titleStyle,
    this.titleWidget,
    this.backgroundColor,
    this.textColor,
    this.leadingWidget,
    this.showBackButton = true,
    this.centerTitle = true,
    this.backButtonCallback,
  });
  final String? title;
  final String? backButtonIconSvPath;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? titleWidget;
  final bool showBackButton;
  final Widget? leadingWidget;
  final bool centerTitle;
  final VoidCallback? backButtonCallback;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        // Determine the current icon based on the theme mode
        final isDarkMode = themeProvider.themeMode == ThemeMode.dark;
        final icon = isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined;

        return AppBar(
          automaticallyImplyLeading: false,
          centerTitle: centerTitle,
          leadingWidth: showBackButton ? 72 : null,
          leading: showBackButton
              ? Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      AppBackButton(
                        iconSvgPath: backButtonIconSvPath,
                        onPressed: backButtonCallback,
                      ),
                    ],
                  ),
                )
              : leadingWidget,
          elevation: 0,
          title: titleWidget ??
              ((title?.isNotEmpty ?? false)
                  ? Text(
                      title ?? '',
                      style: titleStyle ??
                          mediumSize14Text(
                              Theme.of(context).colorScheme.onSurface),
                    )
                  : null),
          // --- Theme Toggle Action ---
          actions: [
            IconButton(
              icon: Icon(
                icon,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: () {
                themeProvider.toggleTheme();
              },
            ),
            const SizedBox(width: 8),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
