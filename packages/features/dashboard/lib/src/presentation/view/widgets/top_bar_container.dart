import 'package:core_theme/app_theme.dart';
import 'package:dashboard/src/presentation/view/widgets/top_bar_action_button.dart';
import 'package:flutter/material.dart';

class TopBarContainer extends StatelessWidget {
  const TopBarContainer({
    required this.searchBarWidgets,
    required this.bottomActions,
    super.key,
  });

  final List<Widget> searchBarWidgets;
  final List<TopBarActionButton> bottomActions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        shape: AppBarShape(),
      ),
      height: 250,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 60,
              left: 16,
              right: 16,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: searchBarWidgets,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: bottomActions,
          ),
        ],
      ),
    );
  }
}
