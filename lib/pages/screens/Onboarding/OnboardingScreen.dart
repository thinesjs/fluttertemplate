import 'package:flutter/material.dart';
import 'package:fluttertemplate/routes/routes.dart';
import 'package:fluttertemplate/utils/constants.dart';
import 'package:fluttertemplate/widgets/divider.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(tPadding.tDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Image(image: AssetImage('assets/images/logo.png')),
              const SpaceDivider(),
              const Center(
                child: Text("ValorTracker",
                style: TextStyle(
                  fontSize: tSizes.titleSize,
                  fontWeight: FontWeight.bold
                ),),
              ),
              const SpaceDivider(),
              const Center(
                child: Text("A companion stats tracker for Valorant!",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal
                  ),),
              ),
              const Center(
                child: Text("Sign in with your Riot Games account to get started!",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal
                  ),),
              ),
              Expanded(child: Container()),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getLogin());
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.white : Colors.black87,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Login with Riot Games",
                          style: TextStyle(
                            color: isDark ? Colors.black87 : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  WidgetDivider(),
                  const Align(
                    alignment: Alignment.center,
                    child: Text("ValorTracker is not affiliated and is not endorsed by Riot Games in any way. Riot Games, Valorant, and all associated properties are trademarks or registered trademarks of Riot Games, Inc.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.normal
                      ),),
                  ),

                ],
              ),

            ],
          ),
        ),

      ),

    );
  }
}