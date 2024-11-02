import 'dart:convert';

import 'package:newapp/model/artciral_model.dart';
import 'package:http/http.dart' as http;

class ArticlesNews {
  List<ArtciralModel> news=[];
  Future<void> getNews()async{
    String url="https://newsapi.org/v2/top-headlines?country=us&apiKey=d021f088d10b4965a98884006860a015";
   // ignore: unused_local_variable
   var response=await http.get(Uri.parse(url));
   var jsondata=jsonDecode(response.body);
   if(jsondata['status'] == "ok"){
    jsondata['articles'].forEach((element){
      if(element['description'] !=null && element['urlToImage'] !=null && element['title'] !=null){
        ArtciralModel artciralModel=ArtciralModel(
          title: element['title'],
          description: element['description'],
          url: element['url'],
          imageToUrl: element['urlToImage'],
        );
        news.add(artciralModel);
        
      }
    });
   }
  }
}

class categortNew{
    List<ArtciralModel> news=[];
  Future<void> getNews(String category)async{
    String url="https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=d021f088d10b4965a98884006860a015";
   // ignore: unused_local_variable
   var response=await http.get(Uri.parse(url));
   var jsondata=jsonDecode(response.body);
   print("jsondata========================$jsondata");
   if(jsondata['status']== "ok"){
    jsondata['articles'].forEach((element){
      if(element['description'] !=null && element['urlToImage'] !=null ){
        ArtciralModel artciralModel=ArtciralModel(
          title: element['title'],
          description: element['description'],
          url: element['url'],
          imageToUrl: element['urlToImage'],
        );
        news.add(artciralModel);
      }
    });
   }
  }
}