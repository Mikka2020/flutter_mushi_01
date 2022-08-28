import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OfficialWebpage extends StatefulWidget {
  const OfficialWebpage({Key? key}) : super(key: key);

  @override
  State<OfficialWebpage> createState() => _OfficialWebpageState();
}

class _OfficialWebpageState extends State<OfficialWebpage> {
  // Hybrid Composition
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('公式サイト'),
      ),
      body: const WebView(
        initialUrl: 'https://flutter.dev',
      ),
    );
  }
}
