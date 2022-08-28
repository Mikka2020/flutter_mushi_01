import 'dart:async';
import 'dart:io'; // Add this import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Add this import back

import 'src/navigation_controls.dart'; // Add this import
import 'src/web_view_stack.dart';

class OfficialWebpage extends StatefulWidget {
  const OfficialWebpage({Key? key}) : super(key: key);

  @override
  State<OfficialWebpage> createState() => _OfficialWebpageState();
}

class _OfficialWebpageState extends State<OfficialWebpage> {
  final controller = Completer<WebViewController>(); // Add this attribute
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
        backgroundColor: Colors.green,
        title: const Text('公式サイト'),
        actions: [
          NavigationControls(controller: controller),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        // ... to here.
      ),
      body: WebViewStack(controller: controller),
    );
  }
}
