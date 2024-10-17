import 'package:core_theme/src/domain/di/di_init.dart';
import 'package:core_theme/src/presentation/cubit/cubit/theme_cubit.dart';
import 'package:core_theme/src/presentation/views/pages/theme_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeShowcaseFlow extends StatefulWidget {
  const ThemeShowcaseFlow({super.key});

  @override
  State<ThemeShowcaseFlow> createState() => _ThemeShowcaseFlowState();
}

class _ThemeShowcaseFlowState extends State<ThemeShowcaseFlow> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ThemeCubit>(),
      child: const ThemePage(),
    );
  }
}
