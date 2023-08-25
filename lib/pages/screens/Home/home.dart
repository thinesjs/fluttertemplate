import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:fluttertemplate/controllers/gpt_controller.dart';
import 'package:fluttertemplate/utils/constants.dart';
import '../../../widgets/divider.dart';
import '../../../widgets/text_field.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isButtonDisabled = false;

  var locationController = TextEditingController();

  _getAddFromLatLng(double lat, double lng) async {
    try{
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      Placemark place = placemarks[0];

      return place.subLocality;
    }catch(e){
      print(e);
    }


  }

  _getRes() async {
    String location = locationController.text.trim();

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.latitude.toString() + " ," + position.longitude.toString());

    String locality = await _getAddFromLatLng(position.latitude, position.longitude);

    print("searching in location, $locality");

    setState(() {
      _isButtonDisabled = true;
    });
    Get.find<GptController>().getGptResponse(locality).then((value) {
      if(value.isSuccess){
        setState(() {
          _isButtonDisabled = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(tPadding.tDefaultPadding),
        child: Column(
          children: [
            const SpaceDivider(),
            // CustomTextField(
            //   icon: "assets/icons/email-icon.svg",
            //   hint: "Your Location",
            //   txtController: locationController,
            //   password: false,
            // ),
            // const SpaceDivider(),
            GestureDetector(
              onTap: () {
                _isButtonDisabled ? null : _getRes();
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white : Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: _isButtonDisabled ?
                  LoadingAnimationWidget.staggeredDotsWave(
                    color: isDark ? Colors.black87 : Colors.white,
                    size: 21,
                  )
                      : Text(
                    "Test API",
                    style: TextStyle(
                      color: isDark ? Colors.black87 : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ) ,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
