import 'package:dashboard/src/view/pages/dashboard_page.dart';
import 'package:flutter/widgets.dart';

class DashboardFlow extends StatefulWidget {
  const DashboardFlow({super.key});

  @override
  State<DashboardFlow> createState() => _DashboardFlowState();
}

class _DashboardFlowState extends State<DashboardFlow> {
  @override
  Widget build(BuildContext context) {
    return const DashboardPage();
  }
}
