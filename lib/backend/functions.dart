import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:technews/utils/key.dart';

import '../components/searchbar.dart';
Future<List> fetchnews() async{
  final response= await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey='+Key.key+'&q='+SearchBar.searchcontroller.text));
  Map result=jsonDecode(response.body);
  print("Api fetched");
  return (result['articles']);
}