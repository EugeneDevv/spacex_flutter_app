import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_flutter_app/core/utils/text_theme.dart';
import 'package:spacex_flutter_app/presentation/providers/language_provider.dart';
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
    return Consumer2<ThemeProvider, LanguageProvider>(
      builder: (context, themeProvider, languageProvider, child) {
        // Theme Toggle Icon
        final isDarkMode = themeProvider.themeMode == ThemeMode.dark;
        final themeIcon =
            isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined;

        // Current Language Code (e.g., 'EN' or 'FR')
        final currentLangCode =
            languageProvider.currentLocaleCode.toUpperCase();

        return AppBar(
          backgroundColor: Colors.transparent,
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
          // --- Action Buttons ---
          actions: [
            // 1. Language Toggle Action
            PopupMenuButton<String>(
              icon: Text(
                currentLangCode,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onSelected: (String languageCode) {
                // 'en' or 'fr'
                languageProvider.setLanguage(context, languageCode);
              },
              itemBuilder: (BuildContext context) {
                return languageProvider.languages.map((lang) {
                  return PopupMenuItem<String>(
                    value: lang.languageCode,
                    child: Text(lang.name),
                  );
                }).toList();
              },
            ),

            // 2. Theme Toggle Action
            IconButton(
              icon: Icon(
                themeIcon,
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
