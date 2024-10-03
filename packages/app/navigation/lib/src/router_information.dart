import 'package:flutter/material.dart';
import 'package:navigation/src/router.dart';

/// The router instance for the app.
RouteInformationProvider get routeInformationProvider =>
    router.routeInformationProvider;

/// The router instance for the app.
RouteInformationParser<Object> get routeInformationParser =>
    router.routeInformationParser;

/// The router instance for the app.
RouterDelegate<Object> get routerDelegate => router.routerDelegate;
