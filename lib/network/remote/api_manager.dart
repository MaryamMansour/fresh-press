import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/shared/components/constants.dart';
class ApiManager{

  static Future<SourceResponse> getSources(String category) async{
    Uri URL = Uri.https(BASE_URL,"/v2/top-headlines/sources",
    {"apiKey":"97147b36e17e474f968057211e10bca8",
    "category":category});
    Response response= await http.get(URL);
    var jsonResponse=jsonDecode(response.body);
    SourceResponse sourceResponse=SourceResponse.fromJson(jsonResponse);
    return sourceResponse;

  }
  
  
  static  Future<NewsResponse> getNewsData(String srcId)async{
    Uri URL=Uri.https(BASE_URL,"/v2/everything",
    {"apiKey":ApiKey,"sources":srcId});
    Response response= await http.get(URL);
    var jsonResponse=jsonDecode(response.body);
    NewsResponse newsResponse=NewsResponse.fromJson(jsonResponse);
    return newsResponse;


  }
}