import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:weather_app/core/connectivity/network_info.dart';
import 'package:weather_app/features/home/presentation/pages/home_page.dart';
import 'package:weather_app/features/others/presentation/pages/internet_connection/internet_connection_page.dart';
import 'package:weather_app/injector_container.dart';

part "name_routes.dart";

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final PackageInfo packageInfo = sl<PackageInfo>();
final NetworkInfo networkInfo = sl<NetworkInfo>();

final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);

final GoRouter router = GoRouter(navigatorKey: rootNavigatorKey, initialLocation: Routes.home, routes: <RouteBase>[
  GoRoute(
    path: Routes.home,
    name: Routes.home,
    parentNavigatorKey: rootNavigatorKey,
    builder: (_, __) => const HomePage(),
  ),
  GoRoute(
    path: Routes.noInternet,
    name: Routes.noInternet,
    parentNavigatorKey: rootNavigatorKey,
    builder: (_, __) => const InternetConnectionPage(),
  ),
]);
