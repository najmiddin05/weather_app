import "dart:developer";
import "dart:io";

import "package:dio/dio.dart";
import "package:dio/io.dart";
import "package:dio_retry_plus/dio_retry_plus.dart";
import "package:flutter/foundation.dart";
import "package:get_it/get_it.dart";
import "package:go_router/go_router.dart";
import "package:package_info_plus/package_info_plus.dart";
import "package:weather_app/core/connectivity/network_info.dart";
import "package:weather_app/features/home/data/repository/home_repository_impl.dart";
import "package:weather_app/features/home/domain/repository/home_repository.dart";
import "package:weather_app/features/home/presentation/bloc/weather_bloc.dart";

import "router/app_routes.dart";

final GetIt sl = GetIt.instance;

Future<void> init() async {
  /// Dio
  sl.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        contentType: "application/json",
        sendTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: <String, String>{},
      )
      ..httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final HttpClient client = HttpClient()
            ..badCertificateCallback = (X509Certificate cert, String host, __) {
              log("cert: ${cert.pem}");
              log("host: $host");
              // return cert.pem == certificate;
              return true;
            };
          return client;
        },
        validateCertificate: (X509Certificate? cert, String host, __) {
          log("cert: ${cert?.pem}");
          log("host: $host");
          if (cert == null) {
            return true;
          }
          // Clipboard.setData(ClipboardData(text: cert.pem));
          return true;
          // return cert.pem == certificate;
        },
      )
      ..interceptors.add(
        LogInterceptor(
          error: kDebugMode,
          request: kDebugMode,
          requestBody: kDebugMode,
          responseBody: kDebugMode,
          requestHeader: kDebugMode,
          responseHeader: kDebugMode,
          logPrint: (Object object) {
            if (kDebugMode) {
              log("dio: $object");
            }
          },
        ),
      ),
  );

  sl<Dio>().interceptors.addAll(
    <Interceptor>[
      chuck.getDioInterceptor(),
      RetryInterceptor(
        dio: sl<Dio>(),
        retries: 1,
        toNoInternetPageNavigator: () async {
          final RouteMatch lastMatch = router.routerDelegate.currentConfiguration.last;
          final RouteMatchList matchList = lastMatch is ImperativeRouteMatch ? lastMatch.matches : router.routerDelegate.currentConfiguration;
          final String location = matchList.uri.toString();
          if (location.contains(Routes.noInternet)) {
            return;
          }
          await router.pushNamed(Routes.noInternet);
        },
        logPrint: (String message) {
          if (kDebugMode) {
            log("dio: $message");
          }
        },
      ),
    ],
  );

  /// Core
  sl
    ..registerLazySingleton(
      () => InternetConnectionChecker.createInstance(
        checkInterval: const Duration(seconds: 3),
      ),
    )
    ..registerSingletonAsync<PackageInfo>(PackageInfo.fromPlatform)
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// features
  _authFeature();
}

void _authFeature() {
  sl

    /// repositories
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(dio: sl()))

    /// bloc
    ..registerFactory(() => WeatherBloc(repository: sl()));
}
