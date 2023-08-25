import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertemplate/utils/constants.dart';
class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key, required this.icon, required this.hint, this.editable = true, required this.txtController, required this.password
  }) : super(key: key);

  final String icon, hint;
  bool editable;
  bool password;
  final TextEditingController txtController;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: isDark ? tColors.backgroundDark : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isDark ? Colors.white : Colors.black87,
          )
        ),
        child: Row(
          children: [
            SizedBox(width: 15,),
            SvgPicture.asset(icon,
                width: 21,
                color: isDark ? Colors.grey[200] : Colors.black87
            ),
            SizedBox(width: 20,),
            Expanded(
              child: TextField(
                controller: txtController,
                obscureText: password?true:false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: resetPress,
            //   child: SvgPicture.asset("assets/icons/reset_icon.svg",
            //       width: 21,
            //       color: Colors.black
            //   ),
            // ),
            SizedBox(width: 20,)
          ],
        ),
      ),
    );
  }
}