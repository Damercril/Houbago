import 'package:flutter/material.dart';
import 'package:houbago_2/navigation/app_routes.dart';
import 'package:houbago_2/theme/houbago_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Houbago',
      theme: ThemeData(
        primaryColor: HoubagoTheme.primary,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: TextTheme(
          displayLarge: HoubagoTheme.displayLarge,
          displayMedium: HoubagoTheme.displayMedium,
          displaySmall: HoubagoTheme.displaySmall,
          titleLarge: HoubagoTheme.titleLarge,
          titleMedium: HoubagoTheme.titleMedium,
          titleSmall: HoubagoTheme.titleSmall,
          bodyLarge: HoubagoTheme.bodyLarge,
          bodyMedium: HoubagoTheme.bodyMedium,
          bodySmall: HoubagoTheme.bodySmall,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: HoubagoTheme.primary,
          primary: HoubagoTheme.primary,
        ),
      ),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}