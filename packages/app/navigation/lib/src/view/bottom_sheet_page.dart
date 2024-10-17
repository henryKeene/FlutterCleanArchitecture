import 'package:flutter/material.dart';

class BottomSheetPage<T> extends Page<T> {
  const BottomSheetPage({required this.child, super.key});
  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) {
    return BottomSheetRoute<T>(
      settings: this,
      builder: (BuildContext context) => child,
    );
  }
}

class BottomSheetRoute<T> extends PageRoute<T> {
  BottomSheetRoute({
    required this.builder,
    super.settings,
  });
  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color? get barrierColor => Colors.black54;

  @override
  String? get barrierLabel => 'Dismiss';

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(0, 1);
    const end = Offset.zero;
    const curve = Curves.easeInOut;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
