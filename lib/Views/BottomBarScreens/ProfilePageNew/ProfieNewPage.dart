import 'dart:convert';
import 'dart:isolate';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart';
import 'package:instero/Views/BottomBarScreens/ProfilePageNew/PostLikersPage.dart';

import 'package:instero/Views/BottomBarScreens/ProfilePageNew/Comments.dart';
import 'package:instero/Views/BottomBarScreens/ProfilePageNew/ProfilePageNewStory.dart';
import 'package:instero/Views/BottomBarScreens/ProfileScreen/ProfilePP.dart';
import 'package:instero/ads/ad_helper.dart';
import 'package:instero/models/FriendStatusModel.dart';
import 'package:instero/models/UserGonderileriModel.dart';
import 'package:instero/models/UserIDstory.dart';
import 'package:instero/models/UserInfo.dart';
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
import 'package:video_player/video_player.dart';


class ProfilePageNew extends StatefulWidget {
  final String id;
  const ProfilePageNew({super.key, required this.id});

  @override
  State<ProfilePageNew> createState() => _ProfilePageNewState();
}

class _ProfilePageNewState extends State<ProfilePageNew> {
 List AllMedia = [];
 int sayac = 0;
 late String fulneym ;
  late String username;
  late String profilepic ;
//late VideoPlayerController _controller
late VideoPlayerController _controller;
final List<VideoPlayerController> _controllers = [];
final List<VideoPlayerController> _controllersforcarousel = [];
final denekikimedia = [];
List kendiindexim = [];
var benmi;
 Future<UserInfo> getRequestforprofilepPrivate(String id) async {
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
              
            var url = Uri.parse('https://www.instagram.com/api/v1/users/$id/info');
            
            var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$dsUserId; ',
              'user-agent':"Instagram 64.0.0.14.96 Android",// "Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id': "936619743392459", //794590088308990 -2055074604688395
              

              
            });
           
            print(response.statusCode);
             Map<dynamic, dynamic> dataget = {}; // yeri değişebilir !
            
            
             var jsonResponse = jsonDecode(response.body);
            jsonResponse.forEach((key, value) {
              dataget[key] = value;
              if(key == "user"){
                if(value["username"] != null){
                  username = value["username"];
                  
                }
                if(value["full_name"] != null){
                  fulneym = value["full_name"];
                  
                }
                if(value["profile_pic_url"] != null){
                  profilepic = value["profile_pic_url"];
                  
                }
                if(value["pk"] != null){
                  benmi = value["pk"];
                  
                }
              }
            });
            
            
             
            
           
            
            
            return UserInfo.fromJson(jsonDecode(response.body));
          } 



          Future<UserGonderileri> getUserGonderileriPrivate(String id) async {
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
            
            var url = Uri.parse('https://i.instagram.com/api/v1/feed/user/$id/');
            
            var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$dsUserId; ',
              'user-agent':"Instagram 64.0.0.14.96 Android",// "Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id':"936619743392459", //794590088308990 -2055074604688395
              

              
            });
         
            print(response.statusCode);
            Map<dynamic, dynamic> dataget = {}; // yeri değişebilir !
                        
                        
                        var jsonResponse = jsonDecode(response.body);
                        jsonResponse.forEach((key, value) {
                          dataget[key] = value;
                          
                        });

                        if(dataget["items"] != null ){
                          for(var i = 0; i < dataget["items"].length; i++){
                         if(dataget["items"][i]["media_type"] == 2){
                           AllMedia.add(dataget["items"][i]["video_versions"][0]["url"]);
                         }
                         else if(dataget["items"][i]["media_type"] == 8){
                           for (var j = 0; j < dataget["items"][i]["carousel_media"].length; j++) {
                             if(dataget["items"][i]["carousel_media"][j]["media_type"] == 2){
                               AllMedia.add(dataget["items"][i]["carousel_media"][j]["video_versions"][0]["url"]);
                             }
                           }
                         }
                         else{
                            AllMedia.add(dataget["items"][i]["image_versions2"]["candidates"][0]["url"]);
                         }
                       

                       }
                           for (var i = 0; i < dataget["items"].length; i++) {

                          if(dataget["items"][i]["carousel_media"] == null && dataget["items"][i]["media_type"] == 2){
                            denekikimedia.add(2);
                            _controller = VideoPlayerController.network(dataget["items"][i]["video_versions"][0]["url"]);
                            _controllers.add(_controller);
                            
                          }
                          else if(dataget["items"][i]["carousel_media"] != null && dataget["items"][i]["media_type"] == 8){
                           
                            for (var j = 0; j < dataget["items"][i]["carousel_media"].length; j++) {
                              if(dataget["items"][i]["carousel_media"][j]["media_type"] == 2){
                                _controller = VideoPlayerController.network(dataget["items"][i]["carousel_media"][j]["video_versions"][0]["url"]);
                                _controllersforcarousel.add(VideoPlayerController.network(dataget["items"][i]["carousel_media"][j]["video_versions"][0]["url"]));
                              }
                              // 

                              
                            }
                          }
                        kendiindexim.add(i);

                          
                        
                        }
                        }
                       
                       
            return UserGonderileri.fromJson(jsonDecode(response.body));
          } 
          var benimid;
          Future<FriendStatus> getFriendStatus() async {
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
              benimid = dsUserId;
            var url = Uri.parse('https://i.instagram.com/api/v1/friendships/show/${widget.id}/');
            
            var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$dsUserId; ',
              'user-agent':"Instagram 64.0.0.14.96 Android",// "Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id': "936619743392459", //794590088308990 -2055074604688395
              

              
            });
           
            print(response.statusCode);
             Map<dynamic, dynamic> dataget = {}; // yeri değişebilir !
                        
                        
                        var jsonResponse = jsonDecode(response.body);
                        jsonResponse.forEach((key, value) {
                          dataget[key] = value;
                          
                        });
                       if( dataget["is_private"] == false || dataget["following"] == true){
                         bakabilirsin = true;
                       }
                       
                       else{
                         bakabilirsin = false;
                       }
                       if(dataget["followed_by"] == true){
                         senitakip = true;
                       }
                       else{
                         senitakip = false;
                       }
                       

                        
                       
            return FriendStatus.fromJson(jsonDecode(response.body));
          } 

          bool ?storyvarmi;
          bool ?senitakip;


          Future<UserIdStory> getCheckStory() async {
            
             SharedPreferences prefs = await SharedPreferences.getInstance();
              var dsUserId = prefs.getString("ds_user_id");
              var sessionid = prefs.getString("sessionid");
              var csrftoken = prefs.getString("csrftoken");
              benimid = dsUserId;
            var url = Uri.parse('https://i.instagram.com/api/v1/feed/user/${widget.id}/story/');
            
            var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$dsUserId; ',
              'user-agent':"Instagram 64.0.0.14.96 Android",// "Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id': "936619743392459", //794590088308990 -2055074604688395
              

              
            });
           
            print(response.statusCode);
             Map<dynamic, dynamic> dataget = {}; // yeri değişebilir !
                        
                        
                        var jsonResponse = jsonDecode(response.body);
                        jsonResponse.forEach((key, value) {
                          dataget[key] = value;
                          
                        });

                        if(dataget["reel"] == null){
                          storyvarmi = false;
                        }
                        else{
                          storyvarmi = true;
                        }
                       
                        
                       
            return UserIdStory.fromJson(jsonDecode(response.body));
          } 


var takip;
var bakabilirsin;
var benmiyim;


 late Future<FriendStatus> FriendStatusAlbum;
 late Future<UserInfo> UserInfoAlbum;
 late Future<UserGonderileri> userGonderileriAlbum;
 late Future<UserIdStory> userIdStoryAlbum;

    

  
  // http post request
  // !! ALTAN CIKAN SEY TOAST

  void toastfunc(){
    
    Fluttertoast.showToast(
      msg: "İndirme Başladı",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0
    );
    
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

  
  // ! İNDİRME İŞLEMLERİ
  Future downloadFile(String url) async {
    var status = await Permission.storage.request();
      if (status.isGranted) {
        final baseStorage = await getExternalStorageDirectory();
         Fluttertoast.showToast(
          msg: "İndirme Başladı",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
        );
        await FlutterDownloader.enqueue(
          

        url: url,
        savedDir: baseStorage!.path,
        fileName: "$username ${DateTime.now()}",
        saveInPublicStorage: true,
        showNotification: true, // show download progress in status bar (for Android)
        openFileFromNotification: true, // click on notification to open downloaded file (for Android)      

        );
        if(status.isGranted){
          toastfuncbitti();
        }
        
      }
        

  }
 
   final ReceivePort _port = ReceivePort();

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
  

   

  @override
  void initState() {
    
    super.initState();
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



    FriendStatusAlbum = getFriendStatus();
    UserInfoAlbum = getRequestforprofilepPrivate(widget.id);
    
    userGonderileriAlbum = getUserGonderileriPrivate(widget.id);
    userIdStoryAlbum = getCheckStory();
    

  }
  var sayfadancikisyapildi = false;



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


  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    
    
   _rewardedAd?.dispose();
  
   
    sayfadancikisyapildi = true;
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }




  @override
  Widget build(BuildContext context) {
      var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:  Color(0xFF080C2C),
        body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                  padding: const EdgeInsets.only(top : 10.0),
                  child: Container(
                    width: Adaptive.w(100),
                    height: Adaptive.h(7),
                    
                   
                    child: Stack(
                      children : [
                        Container(
                        
                          width: Adaptive.w(100),
                    height: Adaptive.h(7),
                    
                          child: Padding(
                            padding: const EdgeInsets.only(top :10.0,bottom: 10),
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            
                            Container(
                             
                              child: Text("Profil",style: GoogleFonts.roboto(
                                    textStyle : const TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                              ),),
                            )
                       
                    
                      ],
                      ),
                          ),
                        ),
                      Container(
                        width: Adaptive.w(20),
                        height: Adaptive.w(15),
                        
                       //
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10,),
                              SvgPicture.asset(
                                'assets/images/svgicons/geriarrow.svg',
                                width: Adaptive.w(8),
                                color: Colors.white,
                              ),
                            ],
                          ),
                        
                        ),
                      )
                      
                      ]
                    ),
                  ),
                ),
                  FutureBuilder(
                    future: FriendStatusAlbum,
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                         return bakabilirsin == true || benmiyim == true  ? 
                         Container(
                    width: screenWidth,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        FutureBuilder(
                          future: UserInfoAlbum,
                          builder: (BuildContext context, AsyncSnapshot snapshot){
                            if(snapshot.hasData){
                              return Column(
                              children: [
                                SizedBox(height: 10,),
                               Container(
                                  width: screenWidth,
                                  height: Adaptive.w(60),
                                 
                                  child: Center(
                                    child: Container(
                                      margin: EdgeInsets.only( left: 20, right: 20),
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 39, 44, 87),
                                        borderRadius: BorderRadius.circular(30), 
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 5 , left: 10, right: 10),
                                            width: double.infinity,
                                            height: Adaptive.w(11),
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(255, 53, 58, 97).withOpacity(0),
                                              borderRadius: BorderRadius.circular(30), 
                                            ),
                                            child: 
                                            Row(
                                              children: [
                                               
                                                Expanded(
                                                  flex: 3,
                                                  child: 
                                                   Stack(
                                                  children: [
                                                    Container(
                                                    margin: EdgeInsets.only(top: 10 , left: 8, right: 8),
                                                                                       
                                                                                            height: Adaptive.w(11),
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color.fromARGB(255, 53, 58, 97),
                                                                                              borderRadius: BorderRadius.circular(30), 
                                                                                            ),
                                                                                            child: Center(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Text(
                                                                                                  snapshot.data!.user.followerCount.toString() ,overflow: TextOverflow.ellipsis,
                                                                                                  style: GoogleFonts.roboto(
                                                                                                    textStyle : const TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.w700,letterSpacing: .0)
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                  ),
                                                  Positioned(
                                                    left: 0,
                                                    top: 11,
                                                 
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      width: Adaptive.w(8),
                                                      height: Adaptive.w(8),
                                                      decoration: BoxDecoration(
                                                        color: Color.fromARGB(255, 53, 58, 97),
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: Colors.red, width: 2)
                                                      ),
                                                      child: Center(
                                                        child: SvgPicture.asset(
                                                          'assets/images/svgicons/takpici.svg',
                                                          width: Adaptive.w(4),
                                                          color: Colors.white,
                                                        ),
                                                      
                                                      )
                                                      
                                                    ),
                                                  )
                                                    
                                                  ],
                                                )
                                                  
                                                ),


                                                 Expanded(
                                                  flex: 4,
                                                   child: Container(
                                                    margin: EdgeInsets.only(top: 10 , left: 10, right: 10),
                                                                                             
                                                                                             height: Adaptive.w(11),
                                                                                             decoration: BoxDecoration(
                                                                                               color: Color.fromARGB(255, 53, 58, 97),
                                                                                               borderRadius: BorderRadius.circular(30), 
                                                                                             ),
                                                                                             child: Center(
                                                                                               child: Padding(
                                                                                                 padding: const EdgeInsets.all(2.0),
                                                                                                 child: SingleChildScrollView(
                                                                                                    scrollDirection: Axis.horizontal,
                                                                                                   child: Text(
                                                                                                     "@" + snapshot.data.user.username.toString(),
                                                                                                     style: GoogleFonts.roboto(
                                                                                                       textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                                                                                     ),
                                                                                                     overflow: TextOverflow.ellipsis,
                                                                                                   ),
                                                                                                 )
                                                                                               ),
                                                                                             ),
                                                                                                 ),
                                                 ),


                                                 Expanded(
                                                  flex: 3,
                                                   child: Stack(
                                                    children: [
                                                      Container(
                                                    margin: EdgeInsets.only(top: 10 , left: 8, right: 8),
                                                                                         
                                                                                             height: Adaptive.w(11),
                                                                                             decoration: BoxDecoration(
                                                                                               color: Color.fromARGB(255, 53, 58, 97),
                                                                                               borderRadius: BorderRadius.circular(30), 
                                                                                             ),
                                                                                             child: Center(
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Text(
                                                                                                  snapshot.data!.user.followingCount.toString() ,overflow: TextOverflow.ellipsis,
                                                                                                  style: GoogleFonts.roboto(
                                                                                                    textStyle : const TextStyle(fontSize: 15,color: Colors.greenAccent,fontWeight: FontWeight.w700,letterSpacing: .0)
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              
                                                                                             ),
                                                                                                 ),
                                                                                                 Positioned(
                                                    right: 0,
                                                    top: 11,
                                                 
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      width: Adaptive.w(8),
                                                      height: Adaptive.w(8),
                                                      decoration: BoxDecoration(
                                                        color: Color.fromARGB(255, 53, 58, 97),
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: Colors.greenAccent, width: 2)
                                                      ),
                                                      child: Center(
                                                        child: SvgPicture.asset(
                                                          'assets/images/svgicons/takip.svg',
                                                          width: Adaptive.w(4),
                                                          color: Colors.white,
                                                        ),
                                                      
                                                      )
                                                      
                                                    ),
                                                  )
                                                    ],)
                                                 )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 15 , left: 10, right: 10),
                                            height: Adaptive.w(26),
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(255, 53, 58, 97),
                                              borderRadius: BorderRadius.circular(30), 
                                            ),
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onLongPress: () {
                                                     _loadRewardedAd();
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
                                                    
                                                    
                                                   
                                                      
                                                      
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePP(profiepp: snapshot.data.user.hdProfilePicUrlInfo.url,)));
                                                    

                                                  
                                                    
                                                    
                                                    
                                                   
                                                    
                                                  });
                                             
                                                  _rewardedAd = null;
                                                } else {
                                                  print('Ad is not ready.');
                                                }
                                                  },
                                                  onTap: () {
                                                    if(storyvarmi == true){
                                                      if(appData.isPro == true){
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePageStoryPage(userid: snapshot.data.user.pk))); 

                                                    }
                                                    else{
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
                                    content: Text("Hikayeleri izlemek istiyorsan reklamı izle",textAlign: TextAlign.center ,style: TextStyle(color: Colors.white),),
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
                                                    
                                                     Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePageStoryPage(userid: snapshot.data.user.pk))); 
                                                   
                                                      
                                                      
                                                      
                                                    print("***********************************");
                                                    
                                                    
                                                    
                                                   
                                                    
                                                  });
                                             
                                                  _rewardedAd = null;
                                                } else {
                                                  print('Ad is not ready.');
                                                }
                                          
                                         
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

                                                    }
                                                    
                                                  },
                                                  child: Container( // ! Story izleme kısmı
                                                    
                                                    width: Adaptive.w(22),
                                                    height: Adaptive.w(22),
                                                    margin: EdgeInsets.only( left: 10, right: 10),
                                                    decoration: BoxDecoration(
                                                      // make instagram story gradient
                                                      gradient: LinearGradient(
                                                        begin: Alignment.topRight,
                                                        end: Alignment.bottomLeft,
                                                        colors: [
                                                         Color.fromARGB(255, 176, 30, 233),
                                                         Colors.purpleAccent,
                                                         Colors.redAccent,
                                                         Colors.amberAccent,
                                                         Colors.yellow
                                                         
                                                        ],
                                                      ),
                                                      //color: Colors.red,//Color.fromARGB(255, 53, 58, 97),
                                                      borderRadius: BorderRadius.circular(70), 
                                                     // border : storyvarmi == true ? Border.all(color: Color.fromARGB(255, 173, 33, 155), width: 4)  :Border.all(color: Color.fromARGB(255, 34, 36, 61), width: 4) // ! stori varsa buraya border eklenir
                                                      
                                                    ),
                                                
                                                    child: storyvarmi == true ? Center(
                                                      child: Container(
                                                        margin: EdgeInsets.all(3),
                                                        width: Adaptive.w(22),
                                                        height: Adaptive.w(22),
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                            image: NetworkImage(snapshot.data.user.hdProfilePicUrlInfo.url),
                                                            fit: BoxFit.cover
                                                          )
                                                        ),
                                                      ),
                                                    ):
                                                    Center(
                                                      child: Container(
                                                        
                                                        
                                                        width: Adaptive.w(22),
                                                        height: Adaptive.w(22),
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                            image: NetworkImage(snapshot.data.user.hdProfilePicUrlInfo.url),
                                                            fit: BoxFit.cover
                                                          )
                                                        ),
                                                      ),
                                                    ),
                                                    
                                                  
                                                  ),
                                                ),
                                                 Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: (){
                                                            DialogBackground(
                                                                blur: 5,
                                                                dialog: AlertDialog(
                                                                  actionsAlignment: MainAxisAlignment.center,
                                                                  shape:  RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                
                                                                icon: Icon(Icons.close,color:Colors.red,),
                                                                  backgroundColor: Colors.black.withOpacity(0.5),
                                                                  title: Text("Instegro",style: TextStyle(color: Colors.white),),
                                                                  content: Text("Bu özellik henüz aktif değil",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                                                                  actions: <Widget>[
                                                                    InkWell(
                                                                      onTap: () => Navigator.pop(context),
                                                                      borderRadius: BorderRadius.circular(20),
                                                                      child: Container(
                                                                        width: 25.w,
                                                                        height: 13.w,
                                                                        decoration: BoxDecoration(
                                                                          color: Colors.red,
                                                                          borderRadius: BorderRadius.circular(20),
                                                                        ),
                                                                        child: Shimmer.fromColors(
                                                                          baseColor: Colors.white,
                                                                          highlightColor: Colors.red,
                                                                          child: TextButton(child: Text("Çıkış",style: TextStyle(color: Colors.white),), onPressed: () => Navigator.pop(context))
                                                                          )
                                                                        ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ).show(context); 
                                                          },
                                                          child: Container(
                                                                                                          margin: EdgeInsets.only( left: 10, right: 10, top: 10, bottom: 10),
                                                                                                          width: Adaptive.w(24),
                                                                                                          height: Adaptive.w(14),
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color.fromARGB(255, 34, 36, 61),
                                                                                                            borderRadius: BorderRadius.circular(20), 
                                                                                                            border: Border.all(color: Colors.red.withOpacity(0.6), width: 2) // ! stori varsa buraya border eklenir
                                                                                                          ),
                                                                                                          child: Center(
                                                                                                            child: Shimmer.fromColors(
                                                                                                              baseColor: Colors.white,
                                                                                                              highlightColor: Colors.red[600] as Color,
                                                                                                              child: Text(
                                                          "Markaj'la",textAlign: TextAlign.center,
                                                          style: GoogleFonts.roboto(
                                                            textStyle : const TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                                          ),
                                                                                                    
                                                                                                        ),
                                                                                                            ),
                                                                                                          ),
                                                                                                         ),
                                                        ),
                                                 InkWell(
                                                   onTap: () {
                                                     if(AllMedia.length != 0){
                                                       if(appData.isPro == true){
                                                        toastfunc();
                                                                for(var i = 0; i < AllMedia.length ; i++){
                                                                downloadFile(AllMedia[i]);
                                                              }
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
                                    
                                    icon: Icon(Icons.download,color: Colors.white,),
                                    actionsAlignment: MainAxisAlignment.center,

                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    title: Text("Instegro",style: TextStyle(color: Colors.white),),
                                    content: Text("Tüm medyayı indirmek istiyorsan PRO'ya geç",textAlign: TextAlign.center ,style: TextStyle(color: Colors.white),),
                                    actions: <Widget>[

                                      // ! proya geç
                                     


                                      // ! reklam
                                      
                                       Shimmer.fromColors(
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
                                          child: TextButton(child: Text("Proya Geç",style: TextStyle(color: Colors.white),),
                                          onPressed: () {
                                            perfomMagic();
                                           
                                          },),
                                                                             
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
                                                     else{
                                                        DialogBackground(
                                                                  blur: 5,
                                                                  dialog: AlertDialog(
                                                                    actionsAlignment: MainAxisAlignment.center,
                                                                    shape:  RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(20),
                                                                    ),
                                                                  
                                                                  icon: Icon(Icons.close,color:Colors.red,),
                                                                    backgroundColor: Colors.black.withOpacity(0.5),
                                                                    title: Text("Instegro",style: TextStyle(color: Colors.white),),
                                                                    content: Text("Kullanıcnın medyası yok",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                                                                    actions: <Widget>[
                                                                      InkWell(
                                                                        onTap: () => Navigator.pop(context),
                                                                        borderRadius: BorderRadius.circular(20),
                                                                        child: Container(
                                                                          width: 25.w,
                                                                          height: 13.w,
                                                                          decoration: BoxDecoration(
                                                                            color: Colors.red,
                                                                            borderRadius: BorderRadius.circular(20),
                                                                          ),
                                                                          child: Shimmer.fromColors(
                                                                            baseColor: Colors.white,
                                                                            highlightColor: Colors.red,
                                                                            child: TextButton(child: Text("Çıkış",style: TextStyle(color: Colors.white),), onPressed: () => Navigator.pop(context))
                                                                            )
                                                                          ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ).show(context); 
                                                     }
                                                   },
                                                   child: Container(
                                                    margin: EdgeInsets.only( left: 10, right: 10, top: 10, bottom: 10),
                                                    width: Adaptive.w(24),
                                                    height: Adaptive.w(14),
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(255, 34, 36, 61),
                                                      borderRadius: BorderRadius.circular(20), 
                                                      border: Border.all(color: Colors.blueAccent, width: 2)
                                                    ),
                                                    child: Center(
                                                      child: Shimmer.fromColors(
                                                        baseColor: Colors.white,
                                                        highlightColor: Colors.blueAccent as Color,
                                                 
                                                        child: Text(
                                                          'Tüm Medyayı indir',textAlign: TextAlign.center,
                                                          style: GoogleFonts.roboto(
                                                            textStyle : const TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                   ),
                                                 ),
                                                      ],
                                                    ),
                                                    Container(
                                                  
                                                  width: Adaptive.w(34),
                                                  height: Adaptive.w(7),
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(255, 34, 36, 61),
                                                    borderRadius: BorderRadius.circular(20), 
                                                    border: senitakip == true ?  Border.all(color: Colors.greenAccent.withOpacity(0.6), width: 2) : Border.all(color: Colors.red.withOpacity(0.6), width: 2)
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      senitakip == true ? 'Seni takip ediyor' : "Seni takip etmiyor",textAlign: TextAlign.center,
                                                      style: GoogleFonts.roboto(
                                                        textStyle : const TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                                      ),
                                                    ),
                                                  ),
                                                  ),
                                                  ],
                                                 )
                                                
                                              ],
                                            ),
                                           
                                          
                                          ),
                                          Container( // ! profil resmini indir -  takip et  - medya sayısı
                                            margin: EdgeInsets.only(top: 10 , left: 10, right: 10, bottom: 10),
                                            height: Adaptive.w(13),
                                            decoration: BoxDecoration(
                                              //color: Color.fromARGB(255, 53, 58, 97),
                                              borderRadius: BorderRadius.circular(30), 
                                            ),
                                            child: Row(
                                              children: [
                                               
                                                Expanded(
                                                  flex: 3,
                                                  child: 
                                                   InkWell(
                                                    onTap: () {
                                                      if(appData.isPro == true){
                                                    downloadFile(snapshot.data!.user.hdProfilePicUrlInfo.url);


                                                  }
                                                  else{
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
                                    content: Text("Fotoğrafı indirmek istiyorsan reklamı izle",textAlign: TextAlign.center ,style: TextStyle(color: Colors.white),),
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
                                                    
                                                    downloadFile(snapshot.data!.user.hdProfilePicUrlInfo.url);
                                                   
                                                      
                                                      
                                                      Navigator.pop(context);
                                                    print("***********************************");
                                                    
                                                    
                                                    
                                                   
                                                    
                                                  });
                                             
                                                  _rewardedAd = null;
                                                } else {
                                                  print('Ad is not ready.');
                                                }
                                          
                                          /*

                                          Navigator.pop(context);
                                         
                                          _rewardedAd?.show(
                                             
                                            onUserEarnedReward: (ad,reward) {     
                                              downloadFile(snapshot.data.user.hdProfilePicUrlInfo.url);
                                                  Fluttertoast.showToast(
                                                    msg: "Profil fotoğrafı indiriliyor",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.black,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0
                                                  );                       
                                            },                 
                                          );
                                          print("reklamı izle");
                                          */
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
                                                    },
                                                     child: Stack(
                                                                                                     
                                                                                                     children: [
                                                      Container(
                                                      margin: EdgeInsets.only(top: 10 , left: 8, right: 8),
                                                                                         
                                                                                              height: Adaptive.w(11),
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color.fromARGB(255, 34, 36, 61),
                                                                                                borderRadius: BorderRadius.circular(30), 
                                                                                              ),
                                                                                              child: Center(
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.only(left : 20.0),
                                                                                                  child: Text(
                                                                                                    "İndir" ,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                                                                                                    style: GoogleFonts.roboto(
                                                                                                      textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                                     ),
                                                                                                     Positioned(
                                                      left: 0,
                                                      top: 12,
                                                                                                    
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        width: Adaptive.w(10),
                                                        height: Adaptive.w(10),
                                                        decoration: BoxDecoration(
                                                          color: Color.fromARGB(255, 53, 58, 97),
                                                          shape: BoxShape.circle,
                                                          border: Border.all(color: Color.fromARGB(255, 34, 36, 61), width: 2)
                                                        ),
                                                        child: CircleAvatar(
                                                          radius: 100,
                                                          backgroundImage: NetworkImage(snapshot.data!.user.profilePicUrl),
                                                        ),
                                                        
                                                      ),
                                                                                                     )
                                                      
                                                                                                     ],
                                                                                                   ),
                                                   )
                                                  
                                                ),


                                                 Expanded(
                                                  flex: 4,
                                                   child: 
                                                    bakabilirsin == true ?
                                                    Container(
                                                    margin: EdgeInsets.only(top: 10 , left: 10, right: 10),
                                                                                             
                                                                                             height: Adaptive.w(11),
                                                                                             decoration: BoxDecoration(
                                                                                               color: Color.fromARGB(255, 34, 36, 61),
                                                                                               borderRadius: BorderRadius.circular(30), 
                                                                                             ),
                                                                                             child: Center(
                                                                                               child: Padding(
                                                                                                 padding: const EdgeInsets.all(2.0),
                                                                                                 child: SingleChildScrollView(
                                                                                                    scrollDirection: Axis.horizontal,
                                                                                                   child: Text(
                                                                                                     "Takip ediyorsun",
                                                                                                     style: GoogleFonts.roboto(
                                                                                                       textStyle : const TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                                                                                     ),
                                                                                                     overflow: TextOverflow.ellipsis,
                                                                                                   ),
                                                                                                 )
                                                                                               ),
                                                                                             ),
                                                                                                 )
                                                    :
                                                     Container(
                                                    margin: EdgeInsets.only(top: 10 , left: 10, right: 10),
                                                                                             
                                                                                             height: Adaptive.w(11),
                                                                                             decoration: BoxDecoration(
                                                                                               color: Color.fromARGB(255, 34, 36, 61),
                                                                                               borderRadius: BorderRadius.circular(30), 
                                                                                             ),
                                                                                             child: Center(
                                                                                               child: Padding(
                                                                                                 padding: const EdgeInsets.all(2.0),
                                                                                                 child: SingleChildScrollView(
                                                                                                    scrollDirection: Axis.horizontal,
                                                                                                   child: Text(
                                                                                                     "Takip Et",
                                                                                                     style: GoogleFonts.roboto(
                                                                                                       textStyle : const TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                                                                                     ),
                                                                                                     overflow: TextOverflow.ellipsis,
                                                                                                   ),
                                                                                                 )
                                                                                               ),
                                                                                             ),
                                                                                                 )
                                                 ),


                                                 Expanded(
                                                  flex: 3,
                                                   child: Stack(
                                                    children: [
                                                      Container(
                                                    margin: EdgeInsets.only(top: 10 , left: 8, right: 8),
                                                                                         
                                                                                             height: Adaptive.w(11),
                                                                                             decoration: BoxDecoration(
                                                                                               color: Color.fromARGB(255, 53, 58, 97),
                                                                                               borderRadius: BorderRadius.circular(30), 
                                                                                             ),
                                                                                             child: Center(
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsets.only(right :19.0),
                                                                                                child: Text(
                                                                                                  "Medya" ,overflow: TextOverflow.ellipsis,
                                                                                                  style: GoogleFonts.roboto(
                                                                                                    textStyle : const TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              
                                                                                             ),
                                                                                                 ),
                                                                                                 Positioned(
                                                    right: 0,
                                                    top: 12,
                                                 
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      width: Adaptive.w(10),
                                                      height: Adaptive.w(10),
                                                      decoration: BoxDecoration(
                                                        color: Color.fromARGB(255, 34, 36, 61),
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: Color.fromARGB(255, 53, 58, 97), width: 2)
                                                      ),
                                                      child: Center(
                                                        child: SingleChildScrollView(
                                                          scrollDirection: Axis.horizontal,
                                                          child: Text(
                                                            snapshot.data!.user.mediaCount.toString() ,overflow: TextOverflow.ellipsis,
                                                            style: GoogleFonts.roboto(
                                                              textStyle : const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                                            ),
                                                          
                                                        ),
                                                        )
                                                      
                                                      )
                                                      
                                                    ),
                                                  )
                                                    ],)
                                                 )
                                              ],
                                            ),
                                           
                                          
                                          )
                                        ],
                                      ),
                                    )
                                  ),
                                  
                                
                                ),
                                

                                SizedBox(height: 10,),
                                Container(  // !!!
                                  width: screenWidth,
                                  height: Adaptive.w(23),
                                 
                                  child: Center(
                                    child: Container(
                                      margin: EdgeInsets.only( left: 20, right: 20),
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 39, 44, 87),
                                        borderRadius: BorderRadius.circular(30), 
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: SingleChildScrollView(
                                             scrollDirection: Axis.horizontal,
                                            child: Text(
                                              "Öne Çıkarılanlar Yakında...",
                                              style: GoogleFonts.roboto(
                                                textStyle : const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ),
                                      ),
                                    )
                                  ),
                                  
                                ),
                                SizedBox(height: 10,),
                                Container(
                          width: screenWidth,
                          
                          
                          child: FutureBuilder<UserGonderileri>(
                            future: userGonderileriAlbum,
                            builder: (BuildContext context, AsyncSnapshot snapshot){
                              if(snapshot.hasData){
                                return  ListView.builder(
                                  shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.numResults,
                            itemBuilder: (context, index) {
                             
                              return Padding(
                                padding: const EdgeInsets.only(bottom : 8.0),
                                child: Container(
                                  width: screenWidth,
                                  height: screenHeight * 1, // !postların sizei
                                  
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left : 20.0,top: 10),
                                            child: Container(
                                              width: 36,
                                              height: 36,
                                              decoration: BoxDecoration(
                                                border : Border.all(color: Colors.white),
                                                borderRadius: BorderRadius.circular(50)
                                              ),
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(profilepic),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left : 10.0,top: 15),
                                            child: Column(
                                              children: [
                                                Text(fulneym,style: GoogleFonts.roboto( // ? kullanıcı adı - fullname
                                                  textStyle : const TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: 0.0)
                                                    ),),
                                                    Text("@$username",style: GoogleFonts.roboto( // ? kullanıcı adı - username
                                                  textStyle : const TextStyle(fontSize: 14,color: Color(0xFFCED8FF),fontWeight: FontWeight.w700,letterSpacing: 0.0)
                                                    ),),
                                              ],
                                            ),
                                          )
                                        
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          
                                          children : [
                                            Container(
                                              margin: const EdgeInsets.only(bottom: 40),
                                            width: screenWidth,
                                            height: Adaptive.w(100 * 1.03),
                                            
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(26),
                                              border: Border.all(color: const Color(0xFF8B89E9),width: 2)
                                            ),
                                            child : snapshot.data!.items[index].mediaType == 1 ?
                                                    Container(      // !!! FOTO
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(26),
                                                        image: DecorationImage(
                                                          image: NetworkImage(snapshot.data!.items[index].imageVersions2.candidates[0].url),
                                                          fit: BoxFit.cover
                                                        )
                                                      ),
                                                      
                                                    )
                                           : 
    
                                            snapshot.data!.items[index].mediaType == 8 ? 
    
                                            Container(     // !!! CAROUSEL SLİDER 
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(26),
                                                color: Colors.black
                                              ),
                                              child: CarouselSlider.builder(
                                                itemCount: snapshot.data!.items[index].carouselMedia.length,
                                                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                                                  return snapshot.data!.items[index].carouselMedia[itemIndex].mediaType == 1 ?
                                                   Container( 
                                                    decoration: BoxDecoration(
                                                      
                                                      borderRadius: BorderRadius.circular(26),
                                                      image: DecorationImage(
                                                        image: NetworkImage(snapshot.data!.items[index].carouselMedia[itemIndex].imageVersions2.candidates[0].url),
                                                        fit: BoxFit.cover
                                                      )
                                                    ),
                                                  )
                                                  : 
                                                  
                                                  _controllersforcarousel.length > 0 ?
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(26),
                                                      color: Colors.black
                                                    ),
                                                    child: Chewie(
                                                      controller: ChewieController(
                                                        videoPlayerController: VideoPlayerController.network(snapshot.data!.items[index].carouselMedia[itemIndex].videoVersions[0].url),

                                                      
                                                        
                                                        aspectRatio: 3 / 2,
                                                        autoPlay: false,
                                                        looping: false,
                                                        autoInitialize: false, // ! TODO TRUE
                                                        allowFullScreen: false,

                                                        errorBuilder: (context, errorMessage) {
                                                          return Center(
                                                            child: Text(
                                                              errorMessage,
                                                              style: const TextStyle(color: Colors.white),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  
                                                  )
                                                  :
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(26),
                                                      
                                                    ),
                                                    child: const Center(
                                                      child: CircularProgressIndicator(),
                                                    ),
                                                  );
    
                                                  
                                                },
                                                options: CarouselOptions(
                                                  height: screenHeight * 0.5,
                                                  viewportFraction: 1,
                                                  //pauseAutoPlayOnTouch: true,
                                                  autoPlayCurve: Curves.fastOutSlowIn,
                                                  enlargeCenterPage: true,
                                                  scrollDirection: Axis.horizontal,
                                                ),
                                              
                                              )
                                            ) 
                                            :
                                             _controllers.length > 0 ?  Container(           // !!! VIDEO
                                              //alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(26),
                                                color: Colors.black
                                              ),
                                              child: AspectRatio(
                                                aspectRatio: screenWidth / screenHeight,
                                                child: Chewie(
                                                  controller: ChewieController(
                                                    videoPlayerController: VideoPlayerController.network(
                                                      snapshot.data!.items[index].videoVersions[0].url

                                                      )

                                                      ,
                                                    aspectRatio: screenWidth / screenHeight,
                                                    autoPlay: false,
                                                    looping: false,
                                                    allowFullScreen: false,
                                                    autoInitialize: false,
                                                    
                                                    
                                                  ),
                                                ),
                                                
                                              
                                              )
                                              
                                            ) 
                                            :
                                            const Text("Video")
                                             
                                            ),
                                            
                                          Container(
                                            child: Positioned(
                                              top: Adaptive.w(96),
                                              left: Adaptive.w(15),
                                              width: Adaptive.w(70),
                                              child: Container(
                                                
                                                
                                                width: screenWidth * 0.65,
                                                height: screenHeight * 0.07,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(22),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black.withOpacity(0.25),
                                                      spreadRadius: 3,
                                                      blurRadius: 4,
                                                      offset: const Offset(0, 4), // changes position of shadow
                                                    ),
                                                  ],
                                                
                                                ),
                                                    
          
          
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    snapshot.data!.items[index].likeCount == 0 ?
                                                    Container(
                                                      width: screenWidth * 0.21,
                                                      height: screenHeight * 0.07,
                                                      
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          SvgPicture.asset(
                                                        'assets/images/svgicons/profilkalpicon.svg',
                                                        width: 20,
                                                        height: 20,
                                                        color: Colors.red,
                                                      
                                                      ),
                                                      SizedBox(width: screenWidth * 0.03,),
                                                      Text(snapshot.data!.items[index].likeCount.toString(),style: GoogleFonts.roboto(
                                                        textStyle : const TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w700,letterSpacing: 0.0)
                                                          ),),
                                                        ],
                                                      ),
                                                    )
                                                    :
                                                    Material(
                                                      color: Colors.transparent,
                                                      borderRadius:  BorderRadius.circular(22),
                                                      child: InkWell(
                                                        borderRadius: BorderRadius.circular(22),
                                                        splashColor: Colors.red,
                                                        onTap: () {
                                                         
                                                          Navigator.push(context, MaterialPageRoute(builder: (context) => LikersPage(mediaid: snapshot.data!.items[index].id,)));
                                                        },
                                                        child: Container(
                                                          
                                                          width: screenWidth * 0.21,
                                                          height: screenHeight * 0.07,
                                                          decoration:  BoxDecoration(
                                                            
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              SvgPicture.asset(
                                                            'assets/images/svgicons/profilkalpicon.svg',
                                                            width: 20,
                                                            height: 20,
                                                            color: Colors.red,
                                                          
                                                          ),
                                                          SizedBox(width: screenWidth * 0.03,),
                                                          Text(snapshot.data!.items[index].likeCount.toString(),style: GoogleFonts.roboto(
                                                            textStyle : const TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w700,letterSpacing: 0.0)
                                                              ),),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    // !----------------------------------------------!
                                                        snapshot.data!.items[index].commentCount == 0 ? 
                                                        Container(
                                                          width: screenWidth * 0.2,
                                                          height: screenHeight * 0.07,
                                                          
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                               SvgPicture.asset(
                                                              'assets/images/svgicons/profilyorumicon.svg',
                                                              width: 20,
                                                              height: 20,
                                                             color: Colors.blueAccent,
                                                                                                            
                                                             ),
                                                             SizedBox(width: screenWidth * 0.03,),
                                                             Text(snapshot.data!.items[index].commentCount.toString(),style: GoogleFonts.roboto(
                                                      textStyle : const TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w700,letterSpacing: 0.0)
                                                          ),),
                                                            ],
                                                          ),
                                                        )
                                                       
                                                           :
                                                        Material(
                                                          color: Colors.transparent,
                                                          borderRadius:  BorderRadius.circular(22),
                                                          child: InkWell(
                                                            borderRadius: BorderRadius.circular(22),
                                                            splashColor: Colors.blueAccent,
                                                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CommentsPage(mediaid: snapshot.data!.items[index].id,))),
                                                            child: Container(
                                                              width: screenWidth * 0.2,
                                                              height: screenHeight * 0.07,
                                                              
                                                              child : Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  SvgPicture.asset(
                                                              'assets/images/svgicons/profilyorumicon.svg',
                                                              width: 20,
                                                              height: 20,
                                                             color: Colors.blueAccent,
                                                                                                            
                                                             ),
                                                             SizedBox(width: screenWidth * 0.03,),
                                                                  Text(snapshot.data!.items[index].commentCount.toString(),style: GoogleFonts.roboto(
                                                                  textStyle : const TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w700,letterSpacing: 0.0)
                                                            ),),
                                                                ],
                                                              )
                                                            ),
                                                          ),
                                                        ),
                                                    // !----------------------------------------------!
                                                      Material(
                                                        color: Colors.transparent,
                                                        borderRadius:  BorderRadius.circular(22),
                                                        child: InkWell(
                                                          borderRadius: BorderRadius.circular(22),
                                                          splashColor: Colors.purple,
                                                          onTap: () {
                                                            
                                                            if(appData.isPro == true){
                                                               if(snapshot.data!.items[index].mediaType == 2){
                                                              downloadFile(snapshot.data!.items[index].videoVersions[0].url);
                                                              toastfunc();
                                                            }
                                                            else if(snapshot.data!.items[index].mediaType == 8){
                                                              for(int i = 0; i < snapshot.data!.items[index].carouselMedia.length; i++){
                                                                if(snapshot.data!.items[index].carouselMedia[i].mediaType == 2){
                                                                  downloadFile(snapshot.data!.items[index].carouselMedia[i].videoVersions[0].url);
                                                                toastfunc();
                                                                }
                                                                else if(snapshot.data!.items[index].carouselMedia[i].mediaType == 1){
                                                                 
                                                                  downloadFile(snapshot.data!.items[index].carouselMedia[i].imageVersions2.candidates[0].url);
                                                                  toastfunc();
                                                                }
                                                              }
                                                            }
                                                            else{
                                                              downloadFile(snapshot.data!.items[index].imageVersions2.candidates[0].url);
                                                              toastfunc();
                                                            
                                                            }

                                                            }
                                                            else{
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
                                    content: Text("Fotoğrafı indirmek istiyorsan reklamı izle",textAlign: TextAlign.center ,style: TextStyle(color: Colors.white),),
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
                                                    if(snapshot.data!.items[index].mediaType == 2){
                                                              downloadFile(snapshot.data!.items[index].videoVersions[0].url);
                                                              toastfunc();
                                                            }
                                                            else if(snapshot.data!.items[index].mediaType == 8){
                                                              for(int i = 0; i < snapshot.data!.items[index].carouselMedia.length; i++){
                                                                if(snapshot.data!.items[index].carouselMedia[i].mediaType == 2){
                                                                  downloadFile(snapshot.data!.items[index].carouselMedia[i].videoVersions[0].url);
                                                                toastfunc();
                                                                }
                                                                else if(snapshot.data!.items[index].carouselMedia[i].mediaType == 1){
                                                                 
                                                                  downloadFile(snapshot.data!.items[index].carouselMedia[i].imageVersions2.candidates[0].url);
                                                                  toastfunc();
                                                                }
                                                              }
                                                            }
                                                            else{
                                                              downloadFile(snapshot.data!.items[index].imageVersions2.candidates[0].url);
                                                              toastfunc();
                                                            
                                                            }
                                                     

                                                    
                                                   
                                                      
                                                      
                                                      Navigator.pop(context);
                                                    print("***********************************");
                                                    
                                                    
                                                    
                                                   
                                                    
                                                  });
                                             
                                                  _rewardedAd = null;
                                                } else {
                                                  print('Ad is not ready.');
                                                }










                                          /*
                                          Navigator.pop(context);
                                         
                                          _rewardedAd?.show(
                                             
                                            onUserEarnedReward: (ad,reward) {     
                                              if(snapshot.data!.items[index].mediaType == 2){
                                                              downloadFile(snapshot.data!.items[index].videoVersions[0].url);
                                                              toastfunc();
                                                            }
                                                            else if(snapshot.data!.items[index].mediaType == 8){
                                                              for(int i = 0; i < snapshot.data!.items[index].carouselMedia.length; i++){
                                                                if(snapshot.data!.items[index].carouselMedia[i].mediaType == 2){
                                                                  downloadFile(snapshot.data!.items[index].carouselMedia[i].videoVersions[0].url);
                                                                toastfunc();
                                                                }
                                                                else if(snapshot.data!.items[index].carouselMedia[i].mediaType == 1){
                                                                 
                                                                  downloadFile(snapshot.data!.items[index].carouselMedia[i].imageVersions2.candidates[0].url);
                                                                  toastfunc();
                                                                }
                                                              }
                                                            }
                                                            else{
                                                              downloadFile(snapshot.data!.items[index].imageVersions2.candidates[0].url);
                                                              toastfunc();
                                                            
                                                            }
                                            },             
                                          );
                                          */
                                                  print("reklamı izle");
                                                  }
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
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
                                                    child: Center(
                                                      child: Text("Proya Geç",style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                                                                                        
                                                                                        ),
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
                                                           
                                                          },
                                                          child: Container(
                                                            width: screenWidth * 0.2,
                                                            height: screenHeight * 0.07,

                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                  SvgPicture.asset(
                                                            'assets/images/svgicons/profilindiricon.svg',
                                                            width: 20,
                                                            height: 20,
                                                            color: Colors.purple,
                                                                                                          
                                                                 ),
                                                                 const SizedBox(width: 5,),
                                                                Text("İndir",style: GoogleFonts.roboto(
                                                            textStyle : const TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w700,letterSpacing: 0.0)
                                                              ),),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                          ] 
                                        ),
                                      ),
                                      Padding(  // ! açıklama kısmı <-----------------------------
                                        padding: const EdgeInsets.only(left : 8.0,right: 8.0),
                                        child: Container(
                                          width: screenWidth,
                                          height: screenHeight * 0.1,
                                          
                                          child: snapshot.data!.items[index].caption== null ? Container(alignment: Alignment.center, child: 
                                          Text("Açıklama yok",style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 20),color: const Color(0xFF909CC3),fontWeight : FontWeight.w700,),),)
                                           : 
                                          SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Text(snapshot.data!.items[index].caption!.text,style: GoogleFonts.roboto(
                                              textStyle : const TextStyle(fontSize: 15,color: Color(0xFF909CC3),fontWeight: FontWeight.w700,letterSpacing: 0.0)
                                                ),),
                                          ),
                                        ),
                                      ),
                                      Padding( // ! yorumlar kısmı 
                                        padding: const EdgeInsets.only(top : 0 ,left : 8.0,right: 8.0),
                                        child: Container(
                                          width: screenWidth,
                                          height: screenHeight * 0.10,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(26),
                                            border: Border.all(color: Colors.grey.withOpacity(0.5),width: 2),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.25),
                                                spreadRadius: 3,
                                                blurRadius: 4,
                                                offset: const Offset(0, 4), // changes position of shadow
                                              ),
                                            ],
                                          
                                          ),
                                          
                                          child: snapshot.data!.items[index].commentCount == 0 ? Container(alignment: Alignment.center, child: Text("Yorum yok",style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 20),color: const Color(0xFF909CC3),fontWeight : FontWeight.w700,),),) :
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentsPage(mediaid: snapshot.data!.items[index].id,)));
                                             // Navigator.push(context, MaterialPageRoute(builder: (context) => CommentsPage(mediaid: snapshot.data!.items[index].id,)));
                                            },
                                            child: Center(
                                              child: Text("Yorumları Görüntüle",style: GoogleFonts.roboto(
                                              textStyle : const TextStyle(fontSize: 22,color: Color(0xFF909CC3),fontWeight: FontWeight.w700,letterSpacing: 0.0)
                                                ),),
                                            ),
                                          ),
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              );
                            
                            },
                          );
                              }
                              else{
                                return const Center(child: CircularProgressIndicator());
                              }
                            },
                          ),
                        )
                              ],
                            );
    
                            }
                            else{
                              return const Center(child: CircularProgressIndicator());
                            }
                           
                           
                            
                          },
                          
                        ),
                        
                      ],
                    ),
                  )
                         :
                         Container(

 
                         );
                      }
                      else if(snapshot.hasError){
                        return const Text("Gizli hesap");
                      }
                      return const CircularProgressIndicator();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}