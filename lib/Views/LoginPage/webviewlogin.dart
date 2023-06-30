

import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:instero/Views/BottomBarScreens/bottom_bar.dart';





import 'package:shared_preferences/shared_preferences.dart';



class InstagramLoginPage extends StatefulWidget {
  
  const InstagramLoginPage({super.key});
  

  @override
  State<InstagramLoginPage> createState() => _InstagramLoginPageState();
}

class _InstagramLoginPageState extends State<InstagramLoginPage> {

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

          

          
          
          
          
         


      late PullToRefreshController pullToRefreshController;
      String url = "";
      double progress = 0;
      final urlController = TextEditingController();
      @override
      void initState() {
        super.initState();
       
            
       
        
        
        //cookieManager.deleteAllCookies();
        pullToRefreshController = PullToRefreshController(
          options: PullToRefreshOptions(
            color: Colors.blue,
          ),
          onRefresh: () async {
            if (Platform.isAndroid) {
              webViewController?.reload();
            } else if (Platform.isIOS) {
              webViewController?.loadUrl(
                  urlRequest: URLRequest(url: await webViewController?.getUrl()));
            }
          },
        );
      }
      void destroyWebView(){
        webViewController!.clearCache();
        webViewController!.loadUrl(urlRequest: URLRequest(url: Uri.parse("about:blank")));
      
        

      }

      @override
      void dispose() {
        urlController.dispose();
        //cookieManager.deleteAllCookies();
        
        super.dispose();
        
      }
      
       // cookie list 
      
      
      
     
      
      
      Future<void> setCookiess() async {
        SharedPreferences prefs =await SharedPreferences.getInstance();
        cookieManager.getCookies(url: Uri.parse("https://www.instagram.com")).then((value){
          for (var element in value) { 
            if(element.name == "sessionid"){
              prefs.setString("sessionid", element.value);
            }
            if(element.name == "csrftoken"){
              prefs.setString("csrftoken", element.value);
            }
            if(element.name == "ds_user_id"){
              prefs.setString("ds_user_id", element.value);
            }
            if(element.name == "rur"){
              prefs.setString("rur", element.value);
            }
            if(element.name == "mid"){
              prefs.setString("mid", element.value);
            } 
            if(element.name == "datr"){
              prefs.setString("datr", element.value);
            }
            if(element.name == "shbid"){
              prefs.setString("shbid", element.value);
            }
            if(element.name == "shbts"){
              prefs.setString("shbts", element.value);
            }
            if(element.name == "dpr"){
              prefs.setString("dpr", element.value);
            }
            if(element.name == "ig_did"){
              prefs.setString("ig_nrcb", element.value);
            }
            if(element.name == "ig_nrcb"){
              prefs.setString("ig_nrcb", element.value);
            }
            

          }
          
 
        });
          
          
      }
       
        
       
          
  
      
        


    
       
      
      // ! Exprades date - final expiresDate = DateTime.now().add(Duration(days: 3)).millisecondsSinceEpoch; 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          
          body: SafeArea(
              child: 
                Stack(
                  children: [
                    InAppWebView(
                      
                      key: webViewKey,
                      initialUrlRequest: URLRequest(url: Uri.parse("https://www.instagram.com/accounts/login/")),
                      
                      
                      
                      initialOptions: options,
                      

                      pullToRefreshController: pullToRefreshController,
                      onWebViewCreated: (controller) async {
                        webViewController = controller;
 
                      },
                      
                      onLoadStart: (controller, url) async {
                        
                        setState(() {
                          this.url = url.toString();  
                          urlController.text = this.url;    
                        });
                        
                        if(url.toString().endsWith("https://www.instagram.com/")){     
                            
                          setCookiess();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomBar()));
                          
                          
                          
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => YapildiPage()));
                        }
                      },
                     
                      androidOnPermissionRequest: (controller, origin, resources) async {
                        return PermissionRequestResponse(
                            resources: resources,
                            action: PermissionRequestResponseAction.GRANT);
                      },
                      
                      onLoadStop: (controller, url) async {
                        pullToRefreshController.endRefreshing();
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                
                      },
                      onLoadError: (controller, url, code, message) {
                        pullToRefreshController.endRefreshing();
                      },
                      onProgressChanged: (controller, progress) {
                        if (progress == 100) {
                          pullToRefreshController.endRefreshing();
                        }
                        setState(() {
                          this.progress = progress / 100;
                          urlController.text = url;
                        });
                      },
                      onUpdateVisitedHistory: (controller, url, androidIsReload) {
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                      },
                       
                    ),
                    progress < 1.0
                        ? LinearProgressIndicator(value: progress)
                        : Container(),
                  ],
                ),
               
          ),
    );
  }
}
