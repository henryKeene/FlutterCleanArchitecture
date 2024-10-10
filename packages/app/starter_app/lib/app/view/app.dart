import 'package:core_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:lego_architecture_demo_mason/l10n/l10n.dart';
import 'package:navigation/navigation.dart' as nav;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.use(
        Brightness.light,
        const ThemeSettings(
          useMaterial3: true,
          zoomBlogFonts: false,
          themeMode: ThemeMode.light,
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routeInformationParser: nav.routeInformationParser,
      routeInformationProvider: nav.routeInformationProvider,
      routerDelegate: nav.routerDelegate,
    );
  }
}
