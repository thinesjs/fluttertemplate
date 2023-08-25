import 'package:get/get.dart';

import '../pages/main_page.dart';

class RouteHelper {
  static const String initial = "/";



  // MAIN - AUTHENTICATION
  static const String login = "/login";
  static const String twoFA = "/2fa";
  // GETTER - AUTHENTICATION
  static String getLogin() => "$login";
  static String get2FA() => "$twoFA";

  // MAIN
  static const String welcome = "/welcome";
  static const String splash = "/splash";
  static const String home = "/home";
  static const String profile = "/profile";
  static const String wishlist = "/wishlist";
  static const String crosshair = "/crosshair";
  static const String career = "/career";
  static const String livematch = "/live-match";
  static const String viewmatch = "/view-match";
  static const String pregame = "/pre-game";
  static const String about = "/about";
  static const String bugreport = "/bug-report";
  static const String loadout = "/loadout";
  static const String purchasehistory = "/purchase-history";
  static const String party = "/party";

  static const String maintenance = "/maintenance";
  static const String forceupdate = "/force-update";
  // GETTER
  static String getWelcome() => welcome;
  static String getSplash() => splash;
  static String getHome() => home;
  static String getProfile() => profile;
  static String getWishlist() => wishlist;
  static String getCrosshair() => crosshair;
  static String getCareer() => career;
  static String getLiveMatch() => livematch;
  static String getMatch() => viewmatch;
  static String getPreGame() => pregame;
  static String getAbout() => about;
  static String getBugReport() => bugreport;
  static String getLoadout() => loadout;
  static String getPurchaseHistory() => purchasehistory;
  static String getParty() => party;

  static String getMaintenance() => maintenance;
  static String getForceUpdate() => forceupdate;


  static List<GetPage> routes = [

    // GetPage(name: splash, page: () => SplashScreen()),
    //
    // GetPage(name: welcome, page: () => Welcome()),
    //
    GetPage(name: home, page: () {
      return const MainPage();
    }, transition: null),

  ];
}