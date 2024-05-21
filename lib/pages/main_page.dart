import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertemplate/pages/screens/Home/Home.dart';
import 'package:fluttertemplate/pages/splash/splash.dart';
import 'package:fluttertemplate/utils/constants.dart';

class MainPage extends StatefulWidget {
  final int? selectedIndex;

  const MainPage({Key? key, this.selectedIndex}) : super(key: key);

  @override

  State<MainPage> createState() => _MainPageState(selectedIndex: this.selectedIndex);
}

class _MainPageState extends State<MainPage> {
  int? selectedIndex;
  _MainPageState({this.selectedIndex});


  List pages = [
    Home(),
    Splash(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(selectedIndex != null){
      currentIndex = selectedIndex!;
    }

    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: displayWidth * .05, top: displayWidth * .05, left: displayWidth * .05, right: displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
            color: tColors.cardColorDark,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(50)),
        child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  if(selectedIndex != null){
                    selectedIndex = index;
                  }
                  HapticFeedback.lightImpact();
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth * .32
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? displayWidth * .12 : 0,
                      width:  index == currentIndex ? displayWidth * .32 : 0,
                      decoration: BoxDecoration(
                          color : index == currentIndex
                              ? tColors.backgroundDark.withOpacity(0.5)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth * .31
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex ? displayWidth * .13 : 0,
                            ),
                            AnimatedOpacity(
                                opacity: index == currentIndex ? 1 : 0,
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: Text(index == currentIndex
                                    ? '${listOfStrings[index]}'
                                    : '' ,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                  ),

                                )
                            )
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex ? displayWidth * .03 : 20,
                            ),
                            Icon(
                              listOfIcons[index],
                              size: displayWidth * .076,
                              color: index == currentIndex
                                  ? Colors.white
                                  : Colors.grey,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  List<String> listOfStrings = [
    'Home',
    'Store',
    'Career',
    'Profile',
  ];

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.shopping_basket_rounded,
    Icons.history,
    Icons.person_rounded,
  ];
}
