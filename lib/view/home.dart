import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newapp/helper/data.dart';
import 'package:newapp/helper/news.dart';
import 'package:newapp/model/artciral_model.dart';
import 'package:newapp/model/category_model.dart';
import 'package:newapp/view/article_screen.dart';
import 'package:newapp/view/categoty_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> category = [];
  List<ArtciralModel> articles = [];
  bool _isloading = true;
  @override
  // ignore: override_on_non_overriding_member
  void initState() {
    super.initState();
    category = getcategory();
    getNews();
  }

  getNews() async {
    ArticlesNews newsclass = ArticlesNews();
    await newsclass.getNews();
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
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: category.length,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                                imageUrl: category[index].imageUrl!,
                                categoryName: category[index].categoryName!);
                          }),
                    ),
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
class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  const CategoryTile(
      {super.key, required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategotyScreen(category: categoryName,)));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: 120,
                  width: 140,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              height: 120,
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), color: Colors.black26),
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ArtcileTile extends StatelessWidget {
  final String description;
  final String title;
  final String urlImage;
  final String url;
  const ArtcileTile(
      {super.key,
      required this.description,
      required this.title,
      required this.urlImage,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleScreen(blogurl: url)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child:CachedNetworkImage(imageUrl: urlImage,)),
            Text(
              title,
              style: const TextStyle(color: Colors.black87, fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              description,
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
