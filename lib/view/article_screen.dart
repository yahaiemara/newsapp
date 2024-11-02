import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatefulWidget {
  final String blogurl;

   ArticleScreen({Key? key, required this.blogurl}) : super(key: key);
  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}
class _ArticleScreenState extends State<ArticleScreen> {
  bool _isloading=true;
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.blogurl));
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
      body:_isloading ?const Center(child: CircularProgressIndicator()) :WebViewWidget(
        controller: controller,
      ),
    );
  }
}