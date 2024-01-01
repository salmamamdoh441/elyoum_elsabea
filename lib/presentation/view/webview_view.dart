import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreenView extends StatefulWidget {
  final String url;
  const WebViewScreenView({super.key,
    required this.url,
  });

  @override
  State<WebViewScreenView> createState() => _WebViewScreenViewState();
}

class _WebViewScreenViewState extends State<WebViewScreenView> {
  final controller = WebViewController();



  @override
  void initState() {
    controller.loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: WebViewWidget(
          controller: controller,
        ));
  }
}
