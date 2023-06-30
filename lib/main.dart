import 'dart:async';
import 'dart:io';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:instero/Views/BottomBarScreens/bottom_bar.dart';
import 'package:instero/Views/LoginPage/LoginPage.dart';
import 'package:instero/revenue/constants.dart';
import 'package:instero/revenue/singletons_data.dart';
import 'package:instero/revenue/store_config.dart';




import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:purchases_flutter/purchases_flutter.dart' as purchases;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


Future main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await FlutterDownloader.initialize(
    debug: true, // optional: set to false to disable printing logs to console (default: true)
    ignoreSsl: true // option: set to false to disable working with http links (default: false)
  );

  if (Platform.isAndroid) {
    
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);   
   
    StoreConfig(
      apiKey: googleApiKey,
      store: Store.googlePlay
    );

 

   
    
  }
  
   MobileAds.instance.initialize();
    runApp(
  AraHome()
 );
  
  
}

class AraHome extends StatelessWidget {
  const AraHome({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const MyApp(),
        );
      }
     
        
      );
    
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
      
       Future<void> initPlatformState() async {
  await purchases.Purchases.setDebugLogsEnabled(true);
  
  purchases.PurchasesConfiguration configuration = purchases.PurchasesConfiguration("goog_DbTWqgfHtDNsWJZHuixlboDhSsM");
  
  await purchases.Purchases.configure(configuration);
}

  

      
  
       Future<void> LoggedCheck() async {
         
          SharedPreferences.getInstance().then((prefs) {
            if(prefs.getString('csrftoken') != null){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomBar()));
            }
            else{
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            }
          });
       }
       
      

       



        @override
  void initState() {
    
    super.initState();

    Future.delayed(Duration(seconds:3)).then((value) {
      FlutterNativeSplash.remove();
    
    });




    initPlatformState();
    

    
 

    
       
   

    OneSignal.shared.setLogLevel( OSLogLevel.debug, OSLogLevel.none);
    OneSignal.shared.setAppId("baedf678-6fb7-40ac-acd9-8f4d90528339");
    LoggedCheck();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}