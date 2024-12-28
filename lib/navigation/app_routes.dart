import 'package:flutter/material.dart';
import 'package:houbago_2/navigation/page_transition.dart';
import 'package:houbago_2/screens/account/account_screen.dart';
import 'package:houbago_2/screens/home/home_screen.dart';
import 'package:houbago_2/screens/pin/pin_screen.dart';
import 'package:houbago_2/screens/registration/register_car_screen.dart';
import 'package:houbago_2/screens/registration/register_moto_screen.dart';
import 'package:houbago_2/screens/splash/splash_screen.dart';
import 'package:houbago_2/screens/teams/car_team_screen.dart';
import 'package:houbago_2/screens/teams/moto_team_screen.dart';
import 'package:houbago_2/screens/teams/teams_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String pin = '/pin';
  static const String home = '/home';
  static const String registerMoto = '/register-moto';
  static const String registerCar = '/register-car';
  static const String teams = '/teams';
  static const String motoTeam = '/teams/moto';
  static const String carTeam = '/teams/car';
  static const String account = '/account';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return NoAnimationMaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case pin:
        return NoAnimationMaterialPageRoute(
          builder: (_) => const PinScreen(),
          settings: settings,
        );
      case home:
        return NoAnimationMaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case registerMoto:
        return NoAnimationMaterialPageRoute(
          builder: (_) => const RegisterMotoScreen(),
          settings: settings,
        );
      case registerCar:
        return NoAnimationMaterialPageRoute(
          builder: (_) => const RegisterCarScreen(),
          settings: settings,
        );
      case teams:
        return NoAnimationMaterialPageRoute(
          builder: (_) => const TeamsScreen(),
          settings: settings,
        );
      case motoTeam:
        return NoAnimationMaterialPageRoute(
          builder: (_) => const MotoTeamScreen(),
          settings: settings,
        );
      case carTeam:
        return NoAnimationMaterialPageRoute(
          builder: (_) => const CarTeamScreen(),
          settings: settings,
        );
      case account:
        return NoAnimationMaterialPageRoute(
          builder: (_) => const AccountScreen(),
          settings: settings,
        );
      default:
        return NoAnimationMaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
