import 'package:core_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation/navigation.dart' as nav;
import 'package:starter_app/app/view/cubits/cubit/theme_handler_cubit.dart';
import 'package:starter_app/localizations/custom_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<ThemeHandlerCubit>()..initialise(),
      child: BlocBuilder<ThemeHandlerCubit, ThemeHandlerState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: AppTheme.use(
              switch (state) {
                ThemeLight() => Brightness.light,
                ThemeDark() => Brightness.dark,
              },
              ThemeSettings(
                useMaterial3: true,
                zoomBlogFonts: false,
                themeMode: switch (state) {
                  ThemeLight() => ThemeMode.light,
                  ThemeDark() => ThemeMode.dark,
                },
              ),
            ),
            localizationsDelegates: const [
              CustomLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: CustomLocalizations.supportedLocales,
            routeInformationParser: nav.routeInformationParser,
            routeInformationProvider: nav.routeInformationProvider,
            routerDelegate: nav.routerDelegate,
          );
        },
      ),
    );
  }
}
