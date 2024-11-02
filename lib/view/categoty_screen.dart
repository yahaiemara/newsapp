import 'package:flutter/material.dart';
import 'package:newapp/helper/news.dart';
import 'package:newapp/model/artciral_model.dart';
import 'package:newapp/view/home.dart';

class CategotyScreen extends StatefulWidget {
   final String category;
  bool _isloading = true;
   CategotyScreen({super.key, required this.category});

  @override
  State<CategotyScreen> createState() => _CategotyScreenState();
}

class _CategotyScreenState extends State<CategotyScreen> {
  List<ArtciralModel> articles = [];
  bool _isloading = true;
    void initState() {
    super.initState();
   
    getCategoryNews();
  }
  getCategoryNews()async{
    categortNew newsclass = categortNew();
    await newsclass.getNews(widget.category);
    articles = newsclass.news;
    setState(() {
      _isloading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/spacenews.png",
          height: 80,
          width: 200,
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10,top: 10),
                      height: 1000,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return ArtcileTile(
                              urlImage: articles[index].imageToUrl!,
                              title: articles[index].title!,
                              description: articles[index].description!,
                              url: articles[index].url!,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}