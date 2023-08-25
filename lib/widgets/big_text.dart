import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  FontWeight fw;
  BigText({Key? key, this.color = Colors.blue, required this.text, this.size=24,this.overFlow=TextOverflow.ellipsis, this.fw=FontWeight.w400}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: GoogleFonts.lato(
        color: color,
        fontSize: size,
        fontWeight: fw
      ),
    );
  }
}
