import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:revive/app/my_app.dart';
import 'package:revive/core/di/dependancy_injection.dart';
import 'package:revive/generated/codegen_loader.g.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Supabase.initialize(
    url: "https://qvgwigafkgaalpluxdmf.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF2Z3dpZ2Fma2dhYWxwbHV4ZG1mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg2MTg0NTUsImV4cCI6MjA4NDE5NDQ1NX0.AmAPM9GTaGGdQclYjlQru4BfLS9z0SS-W6jIkaoGEk0",
  );
  setupDI();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],

      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      assetLoader: const CodegenLoader(),
      //startLocale: const Locale('ar'),
      child: const MyApp(),
    ),
  );
}
