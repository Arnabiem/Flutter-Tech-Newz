import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technews/utils/colors.dart';
import 'package:technews/utils/text.dart';
import 'package:technews/pages/home.dart';
import 'package:technews/components/bottomsheet.dart';

class NewsBox extends StatelessWidget {
  final String imageurl,title,time,description,url;
  const NewsBox({Key? key, required this.imageurl, required this.title, required this.time, required this.description, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: (){
            showMyBottomSheet(context, title, description, imageurl, url);
          },
          child: Container(
            margin: EdgeInsets.only(left: 5,right: 5,top: 5),
            padding: EdgeInsets.all(20),
            width: w,
            color: AppColors.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageurl,
                  imageBuilder: (context,imageProvider) =>
                      Container(
                        height: 60,width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow
                        ),
                      ),
                      placeholder:(context,url) =>
                        CircularProgressIndicator(color:AppColors.primary),
                        errorWidget:(context,url,error)=>Icon(Icons.error),
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Font(
                        text: title,size: 17,color: AppColors.white,
                      ),
                      Font(
                        text: time,size: 13,color: AppColors.lightwhite,
                      )

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
