import 'package:fluttertemplate/pages/screens/Login/LoginScreen.dart';
import 'package:fluttertemplate/pages/screens/Onboarding/OnboardingScreen.dart';
import 'package:get/get.dart';

import '../pages/main_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String splash = "/splash";
  static const String onboarding = "/onboarding";
  static const String login = "/login";
  static const String home = "/home";


  static String getSplash() => splash;
  static String getOnboarding() => onboarding;
  static String getLogin() => login;
  static String getHome() => home;


  static List<GetPage> routes = [
    GetPage(name: onboarding, page: () {
      return const OnboardingScreen();
    }, transition: null),

    GetPage(name: login, page: () {
      return const Login();
    }, transition: null),

    GetPage(name: home, page: () {
      return const MainPage();
    }, transition: null),

  ];
}