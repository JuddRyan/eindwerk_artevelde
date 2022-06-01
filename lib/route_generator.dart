import 'package:eindwerk_lite/components/bottom_navigation.dart';
import 'package:eindwerk_lite/screens/home_screen.dart';
import 'package:eindwerk_lite/screens/login_screen.dart';
import 'package:eindwerk_lite/screens/register_screen.dart';
import 'package:eindwerk_lite/screens/profile_screen.dart';
import 'package:eindwerk_lite/screens/workout_screen.dart';
import 'package:flutter/material.dart';

// https://dev.to/geekpius/how-to-use-on-generate-route-in-flutter-4kml

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/register':
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case '/profile':
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case '/workout':
        return MaterialPageRoute(builder: (context) => const WorkoutScreen());
      // case '/profile':
      //   return MaterialPageRoute(
      //     builder: (context) => SecondPage(
      //       title: args.toString(),
      //     ),
      //   );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    const String errorTitle = 'Error';
    const String errorMessage = 'This page does not exist';

    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(errorTitle),
          ),
          body: const Center(
            child: Text(errorMessage),
          ),
          bottomNavigationBar: const BottomNavigation(),
        );
      },
    );
  }
}
