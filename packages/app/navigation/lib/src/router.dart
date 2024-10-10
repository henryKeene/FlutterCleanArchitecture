import 'package:contact/contact.dart';
import 'package:core_authentication/core_authentication.dart';
import 'package:core_logging/logging.dart';
import 'package:core_theme/app_theme.dart';
import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:login_signup/login_signup.dart';
import 'package:navigation/src/customer_navigation_observer.dart';
import 'package:navigation/src/models/stream_to_listenable.dart';
import 'package:navigation/src/redirects/authentication_redirect.dart';
import 'package:navigation/src/view/bottom_nav_bar.dart';
import 'package:team/team.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  observers: [CustomNavigationObserver()],
  refreshListenable: GoRouterRefreshStream(
    GetIt.I<IFirebaseAuthService>().authStateChanges,
  ),
  redirect: (context, state) => AuthenticationRedirect().rootRedirect(),
  routes: [
    GoRoute(path: '/', redirect: (_, __) => '/home'),
    GoRoute(
      redirect: (context, state) => AuthenticationRedirect().loginRedirect(),
      path: '/login',
      pageBuilder: (context, state) => const MaterialPage(
        child: AuthenticationFlow(),
      ),
    ),
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
