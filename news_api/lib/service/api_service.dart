import 'dart:convert';

import 'package:http/http.dart';

import '../model/article.dart';

class ApiService{
  final endpoint="https://newsapi.org/v2/everything?q=tesla&from=2022-06-28&sortBy=publishedAt&apiKey=8b32863cdd69489abc9ee9efbed60d3a";
  Future<List<Article>> getArticle() async{
    Response response = await get(Uri.parse(endpoint));
    if(response.statusCode==200){
      Map<String,dynamic> json=jsonDecode(response.body);
      List<dynamic> body=json['articles'];
      List<Article> articles=body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    }else{
      throw("Data has error");
    }
  }
}