import 'package:flutter/material.dart';
import 'package:revive/app/my_app.dart';
import 'package:revive/core/di/dependancy_injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://nohufnlmralktlyxwymg.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5vaHVmbmxtcmFsa3RseXh3eW1nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDIyODg1OTAsImV4cCI6MjA1Nzg2NDU5MH0.pgHXaLh00i7J6pAMUoS7pYNBVYM7VvaFRwrGBWI_cGM",
  );
  setupDI();
  runApp(const MyApp());
}
