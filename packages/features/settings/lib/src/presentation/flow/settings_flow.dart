import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/src/domain/di/di_init.dart';
import 'package:settings/src/presentation/cubit/cubit/settings_cubit.dart';
import 'package:settings/src/presentation/view/pages/settings_page.dart';

class SettingsFlow extends StatefulWidget {
  const SettingsFlow({super.key});

  @override
  State<SettingsFlow> createState() => _SettingsFlowState();
}

class _SettingsFlowState extends State<SettingsFlow> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (context) => getIt<SettingsCubit>(),
      child: const SettingsPage(),
    );
  }
}
