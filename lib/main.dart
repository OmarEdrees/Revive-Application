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
    url: "https://nohufnlmralktlyxwymg.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5vaHVmbmxtcmFsa3RseXh3eW1nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDIyODg1OTAsImV4cCI6MjA1Nzg2NDU5MH0.pgHXaLh00i7J6pAMUoS7pYNBVYM7VvaFRwrGBWI_cGM",
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
