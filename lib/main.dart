import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/binding.dart';

import 'package:shop/core/localization/translation.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/localization/changelocal.dart';
import 'core/theme/dark_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await Supabase.initialize(
    url: 'https://byxehgwjtvvdlyhxzqjk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ5eGVoZ3dqdHZ2ZGx5aHh6cWprIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ4NDAxMDcsImV4cCI6MjAzMDQxNjEwN30.koyWMu3A3EIX09AiU5CbNZQhMQbVPZVjTxZP00_4fMA',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // final _themeAppMode = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: localeController.language,
      textDirection: TextDirection.ltr,
      debugShowCheckedModeBanner: false,
      // themeMode: _themeAppMode.mode.value ? ThemeMode.dark : ThemeMode.light,
      theme: getDarkThemeData(),
      darkTheme: getDarkThemeData(),
      initialBinding: MyBinding(),
      getPages: routes,
      // routes: routes,
    );
  }
}
