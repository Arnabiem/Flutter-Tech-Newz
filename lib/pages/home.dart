import 'package:flutter/material.dart';
import 'package:technews/backend/functions.dart';
import 'package:technews/components/newsbox.dart';
import 'package:technews/utils/colors.dart';
import 'package:technews/utils/constants.dart';
import 'package:technews/utils/text.dart';
import '../components/searchbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news=fetchnews();
  }
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
backgroundColor: AppColors.black,
      appBar:AppBar(title: Text("TechNewz",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),centerTitle: true,backgroundColor: AppColors.black),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder<List>(
                future: fetchnews(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                        return NewsBox(
                          url: snapshot.data![index]['url'],
                          imageurl: snapshot.data![index]['urlToImage']!=null?snapshot.data![index]['urlToImage']:Constant.imgurl,
                           title: snapshot.data![index]['title'],
                          time: snapshot.data![index]['publishedAt'],
                          description: snapshot.data![index]['description'].toString(),
                        );
                      }
                    );
                  }
                  else if(snapshot.hasError){
                    return Text("${snapshot.error}");
                  }
                  return Center(
                    child: CircularProgressIndicator(color: AppColors.primary,),
                  );
                }

              )
            ),
          )
        ],
      ),
    );
  }
}
