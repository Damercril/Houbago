import 'package:flutter/material.dart';
import 'package:houbago_2/navigation/app_routes.dart';
import 'package:houbago_2/theme/houbago_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToPin();
  }

  Future<void> _navigateToPin() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.pin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_shipping,
              size: 100,
              color: HoubagoTheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Houbago',
              style: HoubagoTheme.displayLarge.copyWith(
                color: HoubagoTheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Votre application de gestion de transport',
              style: HoubagoTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
