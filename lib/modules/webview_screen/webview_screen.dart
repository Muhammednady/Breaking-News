import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewSCreen extends StatelessWidget {
  final String? Url;
   WebViewSCreen({required this.Url});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse the article'),
        centerTitle: true,
      ),
      body: WebView(initialUrl:Url,),
    );
  }
}


