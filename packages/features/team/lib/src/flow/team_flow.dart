import 'package:flutter/widgets.dart';
import 'package:team/src/view/pages/team_page.dart';

class TeamFlow extends StatefulWidget {
  const TeamFlow({super.key});

  @override
  State<TeamFlow> createState() => _TeamFlowState();
}

class _TeamFlowState extends State<TeamFlow> {
  @override
  Widget build(BuildContext context) {
    return const TeamPage();
  }
}
