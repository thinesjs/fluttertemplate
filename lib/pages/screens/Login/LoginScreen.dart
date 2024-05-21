import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertemplate/components/custom_alerts.dart';
import 'package:fluttertemplate/routes/routes.dart';
import 'package:fluttertemplate/widgets/divider.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:fluttertemplate/utils/constants.dart';
import 'package:fluttertemplate/widgets/text_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isButtonDisabled = false;

  var usernameController = TextEditingController();

  var passwordController = TextEditingController();

  void _login(){
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty)
    {
      showErrorAlert("Username is required!", title: "Hang tight!");
      _isButtonDisabled = false;
    }
    else if (password.isEmpty)
    {
      showErrorAlert("Password is required!", title: "Uh oh..");
      _isButtonDisabled = false;
    }
    else
    {
      setState(() {
        _isButtonDisabled = true;
      });

      if(username == "test" && password == "test"){
        showSuccessAlert(title: "Success", "You are now logged in!");
        setState(() {
          _isButtonDisabled = false;
        });
        Get.toNamed(RouteHelper.getHome());
      }else{
        showErrorAlert(title: "Server Error", "Try again later!");
        setState(() {
          _isButtonDisabled = false;
        });
      }
    }
  }

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
              GestureDetector(
                onTap: () {Get.back();},
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: isDark ? tColors.cardColorDarkLoading : Colors.grey[200],
                      shape: BoxShape.circle
                  ),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
              const SpaceDivider(),
              Container(
                child: const Text("Login with Riot Games",
                style: TextStyle(
                  fontSize: tSizes.titleSize,
                  fontWeight: FontWeight.bold
                ),),
              ),
              const SpaceDivider(),
              CustomTextField(
                  icon: "assets/icons/email-icon.svg",
                  hint: "Username",
                  txtController: usernameController,
                  password: false,
              ),
              CustomTextField(
                icon: "assets/icons/password_icon.svg",
                hint: "Password",
                txtController: passwordController,
                password: true,
              ),
              const SpaceDivider(),
              GestureDetector(
                onTap: () {
                  _isButtonDisabled ? null : _login();
                },
                child: Container(
                  padding: EdgeInsets.all(15),
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
                    "Login",
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

      ),

    );
  }
}


