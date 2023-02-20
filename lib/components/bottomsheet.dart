import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technews/components/components.dart';
import 'package:technews/utils/colors.dart';
import 'package:technews/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';
void showMyBottomSheet(BuildContext context,String title,description, imageurl, url){
  showBottomSheet(
    backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),topRight: Radius.circular(20)
        )
      ),
      elevation: 20,
      context: context, builder: (context){
      return Mybottomsheet(
        url:url,imageurl:imageurl,description:description,title: title,
      );
  }
  );
}
class Mybottomsheet extends StatelessWidget {
  final String title,imageurl,description,url;
  const Mybottomsheet({Key? key, required this.title, required this.imageurl, required this.description, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children:<Widget> [
        BottomSheetImage (imageurl:imageurl,title:title),
          Container(
            padding: EdgeInsets.all(10),
            child: Font(text: description, size: 16, color: AppColors.white),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Read Full Article",
                    recognizer: TapGestureRecognizer()..onTap=(){
                     launchURL(url);
                    },
                    style: GoogleFonts.balooBhai2(color: Colors.blue.shade500)
                  )
                ]
              ),
            ),
          )
        ],
      ),
    );
  }

   launchURL(String url) async{
    if(await launch(url)){
      await canLaunch(url);
    }
    else{
      throw 'Could not launch $url';
    }
   }
}

