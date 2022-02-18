import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViews extends StatefulWidget {
  String url;

  WebViews({required this.url});

  @override
  _WebViewsState createState() => _WebViewsState();
}

class _WebViewsState extends State<WebViews> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 20.w),
              alignment: Alignment.topRight,
              width: Get.width,
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  CupertinoIcons.xmark,
                  color: Colors.grey.shade900,
                  size: 24.0,
                ),
              ),
            ),
            Flexible(
              child: WebView(
                initialUrl: widget.url,
              ),
            )
          ],
        ),
      ),
    );
  }
}
