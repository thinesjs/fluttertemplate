import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:fluttertemplate/routes/routes.dart';
import 'package:fluttertemplate/utils/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'helpers/dependencies.dart' as dependencies;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dependencies.init();
  dependencies.init();

  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print('Location permissions are denied');
    }else if(permission == LocationPermission.deniedForever){
      print("'Location permissions are permanently denied");
    }else{
      print("GPS Location service is granted");
    }
  }else{
    print("GPS Location permission granted.");
  }

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        //scaffoldBackgroundColor: tColors.cardColorDark
      ),
      darkTheme: ThemeData(
          fontFamily: 'Poppins',
          brightness: Brightness.dark,
          scaffoldBackgroundColor: tColors.backgroundDark
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      //home: VerifyAlert(),
      initialRoute: RouteHelper.getHome(),
      getPages: RouteHelper.routes,
    );
  }
}