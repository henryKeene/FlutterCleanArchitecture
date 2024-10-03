import 'package:app_logging/logging.dart';
import 'package:app_theme/app_theme.dart';
import 'package:contact/contact.dart';
import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/src/customer_navigation_observer.dart';
import 'package:navigation/src/view/bottom_nav_bar.dart';
import 'package:team/team.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  observers: [CustomNavigationObserver()],
  routes: [
    GoRoute(path: '/', redirect: (_, __) => '/home'),
    ShellRoute(
      builder: (context, state, child) => BottomNavBar(
        currentIndex: switch (state.topRoute?.path) {
          '/home' => 0,
          '/team' => 1,
          '/contact' => 2,
          _ => 0,
        },
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: DashboardFlow()),
        ),
        GoRoute(
          path: '/team',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: TeamFlow()),
        ),
        GoRoute(
          path: '/contact',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ContactFlow()),
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: 'logging',
              builder: (context, state) => const LoggingFlow(),
            ),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: 'theme',
              builder: (context, state) => const ThemeShowcaseFlow(),
            ),
          ],
        ),
      ],
    ),
  ],
);
