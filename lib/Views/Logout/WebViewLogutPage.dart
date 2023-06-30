import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:instero/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebViewLogut extends StatefulWidget {
  const WebViewLogut({super.key});

  @override
  State<WebViewLogut> createState() => _WebViewLogutState();
}

class _WebViewLogutState extends State<WebViewLogut> {

  final GlobalKey webViewKey = GlobalKey();
      CookieManager cookieManager = CookieManager.instance();
      InAppWebViewController? webViewController;
      InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            useShouldOverrideUrlLoading: true,
            mediaPlaybackRequiresUserGesture: false,
            
          ),
          android: AndroidInAppWebViewOptions(
            useHybridComposition: true,
          ),
          ios: IOSInAppWebViewOptions(
            allowsInlineMediaPlayback: false,
          ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: InAppWebView(
          
          key: webViewKey,
          initialUrlRequest: URLRequest(url: Uri.parse("https://www.instagram.com/accounts/logout/")),
          initialOptions: options,
          onWebViewCreated: (InAppWebViewController controller) {
            webViewController = controller;
          },
          onLoadStart: (InAppWebViewController controller, Uri? url) async {
            print("started $url");
           
          },
          onLoadStop: (InAppWebViewController controller, Uri? url) async {
            SharedPreferences prefs =await SharedPreferences.getInstance();
              print("logout");
              await cookieManager.deleteAllCookies();
              await prefs.clear();
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyApp()));
            
            print("stopped $url");
          },
          onProgressChanged: (InAppWebViewController controller, int progress) {
            print("progress $progress");
          },
        ),
      
      ),
    );
  }
}