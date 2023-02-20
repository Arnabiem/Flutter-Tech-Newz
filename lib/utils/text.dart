import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Font extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const Font({Key? key, required this.text, required this.size, required this.color}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,style:GoogleFonts.balooBhai2(color: color,fontSize: size)
    );
  }
}
class boldFont extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const boldFont({Key? key, required this.text, required this.size, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,style: GoogleFonts.balooBhai2(color: color,fontSize: size,fontWeight: FontWeight.bold),
    );
  }
}

