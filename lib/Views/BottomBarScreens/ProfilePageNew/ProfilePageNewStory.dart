import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart';
import 'package:instero/Views/BottomBarScreens/ProfilePageNew/ProfieNewPage.dart';
import 'package:instero/models/UserPKstoriesModel.dart';
import 'package:instero/revenue/PayWall.dart';
import 'package:instero/revenue/constants.dart';
import 'package:instero/revenue/singletons_data.dart';
import 'package:ndialog/ndialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:story_view/story_view.dart';


class ProfilePageStoryPage extends StatefulWidget {
  final String userid;
  const ProfilePageStoryPage({super.key, required this.userid});

  @override
  State<ProfilePageStoryPage> createState() => _ProfilePageStoryPageState();
}

class _ProfilePageStoryPageState extends State<ProfilePageStoryPage> {
 

   var statuscodee;
   
  
   

   late Future<UserStory> UserStoryAlbum; 
   var username;
  Future<UserStory> fetchUserStory() async {
    var i_d = "";
              CookieManager.instance().getCookies(url: Uri.parse("https://www.instagram.com")).then((value) {
                value.forEach((element) {
                  if (element.name == "x-ig-app-id") {
                    i_d = element.value;
                  }
                });
                print("----------------asdasd----------asd---------asd----------asd-");
                print(i_d);
              });
    SharedPreferences prefs = await SharedPreferences.getInstance();
              var dsUserId = prefs.getString("ds_user_id");
              var sessionid = prefs.getString("sessionid");
              var csrftoken = prefs.getString("csrftoken");
              var url = Uri.parse('https://www.instagram.com/api/v1/feed/user/${widget.userid}/story/');

              var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$dsUserId; ',
              'user-agent':"Instagram 64.0.0.14.96 Android",// "Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id': "936619743392459", //794590088308990 -2055074604688395
            });
           
            print(response.statusCode);
            print(response.body);
            Map<dynamic, dynamic> dataget = {};
             statuscodee = response.statusCode;
            
            var jsonResponse = json.decode(response.body);
            jsonResponse.forEach((key, value) {
              dataget[key] = value;
              if(key == "items"){
                value.forEach((key, value) {
                  dataget[key] = value;
                  if(key == "user"){
                    value.forEach((key, value) {
                      dataget[key] = value;
                      if(key == "username"){
                        username = value;
                      }
                    });
                  }
                });
              }
            });
            
            
               
         



            return UserStory.fromJson(jsonDecode(response.body));
  }
 bool _isLoading = false;

  Future<void> checkPro() async {
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    if (customerInfo.entitlements.all[entitlementID] != null &&
        customerInfo.entitlements.all[entitlementID]!.isActive == true) {
          var data;
          data = await Purchases.appUserID;
          
          print("PRO");
      setState(() {
         appData.isPro = true;
         appData.appUserID = data;
         print("asdasdasd$data");
         
      });
    } 
    else {
      setState(() {
         appData.isPro = false;
      });
    }
  }


 
  
  void perfomMagic() async {
    setState(() {
      _isLoading = true;
    });

    CustomerInfo customerInfo = await Purchases.getCustomerInfo();

    if (customerInfo.entitlements.all[entitlementID] != null &&
        customerInfo.entitlements.all[entitlementID]!.isActive == true) {
          print("PRO");

       
         
      

      setState(()  {
        _isLoading = false;
         appData.isPro = true;
         
      });
    } else {
      Offerings offerings = await Purchases.getOfferings();
      appData.isPro = false;
   
      try {
        offerings = await Purchases.getOfferings();
      } on PlatformException catch (e) {
        await showDialog(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(title: e.message != null ? Text(e.message!) : null));
      }

      setState(() {
        _isLoading = false;
      });

      if (offerings.current == null) {
        // offerings are empty, show a message to your user
      } else {
        // current offering is available, show paywall
        await showModalBottomSheet(
          useRootNavigator: true,
          isDismissible: true,
          isScrollControlled: true,
          backgroundColor: Color.fromARGB(255, 37, 37, 37),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
              return Paywall(
                offering: offerings.current!,
              );
            });
          },
        );
      }
    }
  }
  

Future downloadFile(String url) async {
   
    var status = await Permission.storage.request();
      if (status.isGranted) {
        final baseStorage = await getExternalStorageDirectory();
        
        await FlutterDownloader.enqueue(

        url: url,
        savedDir: baseStorage!.path,
        fileName: "$username ${DateTime.now()}",
        saveInPublicStorage: true,
        showNotification: true, // show download progress in status bar (for Android)
        openFileFromNotification: true, // click on notification to open downloaded file (for Android)      

        );
        toastfuncbitti();
        
        
      }
        

  }
  void toastfuncbitti(){
   
    Fluttertoast.showToast(
      msg: "İndirildi",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0
    );
    
  }
  
 final ReceivePort _port = ReceivePort();
 RewardedAd? _rewardedAd;
    bool _isRewardedAdReady = false;
 void _loadRewardedAd() {
      RewardedAd.load(
        adUnitId:"ca-app-pub-1946382695104497/4071552500", // "ca-app-pub-1946382695104497/4071552500",
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            Fluttertoast.showToast(
                msg: "Reklam Yüklendi",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Color.fromARGB(255, 41, 41, 41),
                textColor: Colors.white,
                fontSize: 16.0);
            print('Ad loaded.');
            // Keep a reference to the ad so you can show it later.
            this._rewardedAd = ad;
            _isRewardedAdReady = true;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('Ad failed to load: $error');
            _isRewardedAdReady = false;
          },
        ),
      );
    }
    late SharedPreferences prefs;
  late int counter ;
  late int maxLimit;
    
 @override
  void initState() {
    // TODO: implement initState
    UserStoryAlbum = fetchUserStory();
    print("*********asdas*as*da*sd*asd*as*dsa*d*as*das*d*");
    
    print("*********asdas*as*da*sd*asd*as*dsa*d*as*das*d*");

    
    print("*********asdas*as*da*sd*asd*as*dsa*d*as*das*d*");
    
    print("*********asdas*as*da*sd*asd*as*dsa*d*as*das*d*");
    checkPro();
     IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
   _port.listen((dynamic data) {
    String id = data[0];
    DownloadTaskStatus status = data[1];
    int progress = data[2];

    if(status == DownloadTaskStatus.complete){ // buraya
      print("indirme tamamlandı");
      
      
    }
    else if(status == DownloadTaskStatus.failed){
      print("indirme başarısız");
    }
    else if(status == DownloadTaskStatus.paused){
      
      print("indirme duraklatıldı");
    }
    else if(status == DownloadTaskStatus.running){
      print("indirme devam ediyor");
    }
    else if(status == DownloadTaskStatus.undefined){
      print("indirme tanımsız");
    }
    else if(status == DownloadTaskStatus.canceled){
      print("indirme iptal edildi");
    }
    else if(status == DownloadTaskStatus.enqueued){
      print("indirme sıraya alındı");
    }
    else{
      print("indirme durumu tanımsız");
    }

    setState((){ });
  });
  

  FlutterDownloader.registerCallback(downloadCallback);




   SharedPreferences.getInstance().then((prefs) {
      setState(() {
        this.prefs = prefs;
        maxLimit = prefs.getInt('maxLimit') ?? 3;
        counter = prefs.getInt("counter") ?? 0;
        Timer.periodic(Duration(hours: 24), (timer) {
      setState(() {
        counter = 0;
      });
    });
      });
    });
     
  

    super.initState();
  }
  @pragma('vm:entry-point')
  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  final storyController = StoryController();
  final StoryController controller = StoryController();
  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    
    storyController.dispose();
    controller.dispose();
    super.dispose();
  }



 
     












  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:  FutureBuilder(
          future: UserStoryAlbum,
          builder: (BuildContext context, AsyncSnapshot<UserStory> snapshot){
         
          if(snapshot.data?.reel != null){
            return Stack(
              children: [
                StoryView(
              storyItems: [
               
                for (var i = 0; i < snapshot.data!.reel!.items!.length; i++)
                  snapshot.data!.reel!.items![i].mediaType == 1 ?
                  StoryItem.pageImage(
                    url: snapshot.data!.reel!.items![i].imageVersions2!.candidates![0].url!,
                    controller: storyController,
                    
                    imageFit: BoxFit.contain,
                    duration: Duration(seconds: 10),
                  )
                     
                      :
                  StoryItem.pageVideo(
                    snapshot.data!.reel!.items![i].videoVersions![0].url!, 
                    controller: controller,
                    duration: Duration(seconds: snapshot.data!.reel!.items![i].videoDuration!.toInt()),
                   
                    imageFit: BoxFit.cover,
                    
                    )
                  
              ],
              controller: storyController,
              onStoryShow: (s) {
                print("Showing a story");
              },
              onComplete: () {
                print("Completed a cycle");
                
                Navigator.pop(context);
              },
              progressPosition: ProgressPosition.top,
              repeat: false,
              onVerticalSwipeComplete: (p0) {
                print("--------Vertical swipe");
                Navigator.pop(context);
              
              },
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePageNew(id: snapshot.data!.reel!.user!.pk!)));
                storyController.pause();
                controller.pause();

              },
              child: Container(
                width: 80.w,
                height: 10.w,
                margin: EdgeInsets.only(top: 60, left: 10),
                alignment: Alignment.topLeft,
                
                child: Row(
                  children: [
                    Container(
                 
                  
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(snapshot.data!.reel!.user!.profilePicUrl!),
                  ),
                ),
                Container(
                 
              
                  child: Text(snapshot.data!.reel!.user!.username!, style: TextStyle(color: Colors.white, fontSize: 20),),
                )
                       
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 60, right: 10),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.close, color: Colors.white, size: 30,)),
            ),
             // make download button
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    if(appData.isPro == true){
                      for (var i = 0; i < snapshot.data!.reel!.items!.length; i++)
                    snapshot.data!.reel!.items![i].mediaType == 1 ?
                    downloadFile(snapshot.data!.reel!.items![i].imageVersions2!.candidates![0].url!)
                    :
                    downloadFile(snapshot.data!.reel!.items![i].videoVersions![0].url!);
                    }
                    else{
                      if(counter <= maxLimit){
                         _loadRewardedAd();
                      DialogBackground(
                                  blur: 5,
                                  dialog: Stack(
                                    children: [
                                      AlertDialog(
                                    shape:  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    
                                    icon: Icon(Icons.download_done,color: Colors.white,),
                                    
                                    actionsAlignment: MainAxisAlignment.center,

                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    title: Text("Instegro",style: TextStyle(color: Colors.white),),
                                    content: Text("Hikayeyi indirmek istiyorsan reklam izle",textAlign: TextAlign.center ,style: TextStyle(color: Colors.white),),
                                    actions: <Widget>[

                                      // ! proya geç
                                     


                                      // ! reklam
                                      Container(
                                        width: 35.w,
                                        height: 13.w,
                                        
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                           gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: <Color>[
                                              Color.fromARGB(255, 231, 36, 205),
                                              Color.fromARGB(255, 238, 123, 213),
                                              Color.fromARGB(255, 230, 10, 138),
                                              Color.fromARGB(255, 51, 22, 42),
                                            ],
                                          ),
                                          
                                        ),
                                        child: TextButton(child: Text("İzle",style: TextStyle(color: Colors.white),), 
                                        onPressed: () {
                                          storyController.pause();
                                                    controller.pause();
                                        
                                         
                                           if (_rewardedAd != null) {
                                              
                                                     _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
                                                    onAdShowedFullScreenContent: (RewardedAd ad) =>
                                                        print('$ad onAdShowedFullScreenContent.'),
                                                    onAdDismissedFullScreenContent: (RewardedAd ad) {
                                                      print('$ad onAdDismissedFullScreenContent.');
                                                      ad.dispose();
                                                      _loadRewardedAd();
                                                    },
                                                    onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
                                                      print('$ad onAdFailedToShowFullScreenContent: $error');
                                                      ad.dispose();
                                                      _loadRewardedAd();
                                                    },
                                                  );
                                                  _rewardedAd!.show(onUserEarnedReward: (ad,reward) {
                                                    
                                                  
                                                    counter++;
                                                    prefs.setInt("counter", counter);
                                                    print("***********************************");
                                                    print(counter);
                                                     for (var i = 0; i < snapshot.data!.reel!.items!.length; i++)
                                                    snapshot.data!.reel!.items![i].mediaType == 1 ?
                                                    downloadFile(snapshot.data!.reel!.items![i].imageVersions2!.candidates![0].url!)
                                                    :
                                                    downloadFile(snapshot.data!.reel!.items![i].videoVersions![0].url!);
                                                   
                                                      
                                                      
                                                      Navigator.pop(context);
                                                    print("***********************************");
                                                    
                                                    
                                                    
                                                   
                                                    
                                                  });
                                             
                                                  _rewardedAd = null;
                                                } else {
                                                  print('Ad is not ready.');
                                                }
                                          print("reklamı izle");
                                          }
                                        ),
                                      ),
                                       InkWell(
                                          onTap: (){
                                            perfomMagic();
                                          },
                                         child: Shimmer.fromColors(
                                            baseColor: Colors.green,
                                            highlightColor: Colors.white,
                                            period: const Duration(milliseconds: 800),
                                            
                                           child: Container(
                                            width: 35.w,
                                            height: 13.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.green.withOpacity(0.1),
                                             
                                              
                                            ),
                                            child: Center(child: Text("PRO'YA GEÇ",style: TextStyle(color: Colors.white),)),
                                                                               
                                                                               ),
                                         ),
                                       ),
                                      
                                    ],
                                  ),
                                  Positioned(
                                    top: 33.h,
                                    left: 80.w,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 10.w,
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.red.withOpacity(1),
                                        ),
                                        child: Icon(Icons.close,color: Colors.white,),
                                      ),
                                    ),
                                  )
                                    ],
                                  )
                                ).show(context);
                      }
                      else{
                         DialogBackground(
                                  blur: 5,
                                  dialog: Stack(
                                    children: [
                                      AlertDialog(
                                    shape:  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    
                                    icon: Icon(Icons.download_done,color: Colors.white,),
                                    
                                    actionsAlignment: MainAxisAlignment.center,

                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    title: Text("Instegro",style: TextStyle(color: Colors.white),),
                                    content: Text("Günlük hikaye indirme sınırna ulaştın,Hikayeleri hemen indirmek istiyorsan Pro'ya geç",textAlign: TextAlign.center ,style: TextStyle(color: Colors.white),),
                                    actions: <Widget>[

                                      // ! proya geç
                                     


                                      // ! reklam
                                      
                                       InkWell(
                                          onTap: (){
                                            perfomMagic();
                                          },
                                         child: Shimmer.fromColors(
                                            baseColor: Colors.green,
                                            highlightColor: Colors.white,
                                            period: const Duration(milliseconds: 800),
                                            
                                           child: Container(
                                            width: 35.w,
                                            height: 13.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.green.withOpacity(0.1),
                                             
                                              
                                            ),
                                            child: Center(child: Text("PRO'YA GEÇ",style: TextStyle(color: Colors.white),)),
                                                                               
                                                                               ),
                                         ),
                                       ),
                                      
                                    ],
                                  ),
                                  Positioned(
                                    top: 33.h,
                                    left: 80.w,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 10.w,
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.red.withOpacity(1),
                                        ),
                                        child: Icon(Icons.close,color: Colors.white,),
                                      ),
                                    ),
                                  )
                                    ],
                                  )
                                ).show(context);
                      }
                     
                    }
                   
                    /*
                     
                    */
                  },
                  child: Container(
                    width: 15.w,
                    height: 15.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      
                    ),
                  
                  margin: EdgeInsets.only(bottom: 60, right: 20),
                  child: Icon(
                    Icons.download_rounded,
                    color: Colors.white,
                    size: 45,
                  
                  )
                            ),
                ),
              ),


            
            
              ],
            );
          }
          else if(statuscodee == 400){
            return Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 60, right: 10),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.close, color: Colors.white, size: 30,)),
            ),
                  Text("Yeniden giriş yap", style: TextStyle(color: Colors.white, fontSize: 20),),
                  
                ],
              )),

            );

          }
          else{
            return Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 60, right: 10),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.close, color: Colors.white, size: 30,)),
            ),
                  CircularProgressIndicator(),
                  
                ],
              )),
            );
          }
          }
          
          ),
    );
  }
}

