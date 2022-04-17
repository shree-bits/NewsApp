import 'dart:async';
import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
class NewsView extends StatefulWidget {

  String url;
  NewsView(this.url);
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late  String finalUrl;
  final Completer<EasyWebView> controller = Completer<EasyWebView>();
  static ValueKey key = const ValueKey('key_0');
  @override
  void initState() {
    if(widget.url.toString().contains("http://"))
    {
      finalUrl = widget.url.toString().replaceAll("http://", "https://");
    }
    else{
      finalUrl = widget.url;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ARNE NEWS"),
        centerTitle: true,
      ),
      body: Container(
        child: EasyWebView(
          src: finalUrl,
          isMarkdown: false,
          convertToWidgets: false,
          key: key,
        ),
      ),
    );
  }
}