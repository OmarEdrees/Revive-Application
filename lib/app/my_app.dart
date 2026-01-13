import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/app/cubit/language_cubit.dart';
import 'package:revive/core/app_route/app_routes.dart';
import 'package:revive/core/app_route/route_names.dart';

// final navigatorKey = GlobalKey<NavigatorState>();

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => LanguageCubit()..syncWithLocale(context),
//       child: MaterialApp(

//         navigatorKey: navigatorKey,
//         debugShowCheckedModeBanner: false,
//         builder: DevicePreview.appBuilder,
//         locale: DevicePreview.locale(context),
//         useInheritedMediaQuery: true,
//         routes: AppRoutes.routes,
//         initialRoute: RouteNames.splashScreen,

//       ),
//     );
//   }
// }

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LanguageCubit()..syncWithLocale(context),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,

        // DevicePreview
        builder: DevicePreview.appBuilder,
        useInheritedMediaQuery: true,

        // easy_localization
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,

        // routing
        routes: AppRoutes.routes,
        initialRoute: RouteNames.splashScreen,
      ),
    );
  }
}
