import 'package:flutter/material.dart';

import '../../view/webview_view.dart';

class WebViewScreen extends StatelessWidget {
  String url;

   WebViewScreen({super.key,required this.url});
  @override
  Widget build(BuildContext context) {
    return WebViewScreenView(url:url ,);
  }

}