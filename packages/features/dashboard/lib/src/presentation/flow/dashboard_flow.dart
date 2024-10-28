import 'package:dashboard/src/domain/di/di_init.dart';
import 'package:dashboard/src/presentation/cubits/cubit/dashboard_cubit.dart';
import 'package:dashboard/src/presentation/view/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardFlow extends StatefulWidget {
  const DashboardFlow({super.key});

  @override
  State<DashboardFlow> createState() => _DashboardFlowState();
}

class _DashboardFlowState extends State<DashboardFlow> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (context) => getIt<DashboardCubit>()..loadDashboardData(),
      child: const DashboardPage(),
    );
  }
}
