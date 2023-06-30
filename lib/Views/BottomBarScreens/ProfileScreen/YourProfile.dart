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
import 'package:instero/Views/BottomBarScreens/ProfileScreen/ProfilePP.dart';
import 'package:instero/ads/ad_helper.dart';
import 'package:instero/models/FriendStatusModel.dart';
import 'package:instero/models/UserGonderileriModel.dart';
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


class YourPage extends StatefulWidget {
  final String id;
  const YourPage({super.key, required this.id});

  @override
  State<YourPage> createState() => _YourPageState();
}

class _YourPageState extends State<YourPage> {
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
              'user-agent': "Instagram 64.0.0.14.96 Android",//"Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id':"936619743392459", //794590088308990 -2055074604688395
              

              
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
              
              'x-ig-app-id': "936619743392459", //794590088308990 -2055074604688395
              

              
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
              'user-agent': "Instagram 64.0.0.14.96 Android",//"Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id': "936619743392459", //794590088308990 -2055074604688395
              

              
            });
          
            print(response.statusCode);
             Map<dynamic, dynamic> dataget = {}; // yeri değişebilir !
                        
                        
                        var jsonResponse = jsonDecode(response.body);
                        jsonResponse.forEach((key, value) {
                          dataget[key] = value;
                          
                        });
                        if(dataget["following"] == true){
                          takip = true;
                           if(benimid == widget.id){
                            benmiyim = true;
                            bakabilirsin = true;
                          }
                          bakabilirsin = true;
                        }
                        else if(dataget["is_private"] == true){
                          if(dataget["following"] == true){
                            bakabilirsin = true;
                             if(benimid == widget.id){
                            benmiyim = true;
                            bakabilirsin = true;
                          }
                          }
                          else{
                            bakabilirsin = false;
                             if(benimid == widget.id){
                            benmiyim = true;
                            bakabilirsin = true;
                          }
                          }
                        }
                        else if(dataget["is_private"] == false){
                          bakabilirsin = true;
                           if(benimid == widget.id){
                            benmiyim = true;
                            bakabilirsin = true;
                          }
                        }
                        else{
                          if(benimid == widget.id){
                            benmiyim = true;
                            bakabilirsin = true;
                          }
                          takip = false;
                          bakabilirsin = false;
                        }

                        
                       
            return FriendStatus.fromJson(jsonDecode(response.body));
          } 


var takip;
var bakabilirsin;
var benmiyim;


 late Future<FriendStatus> FriendStatusAlbum;
 late Future<UserInfo> UserInfoAlbum;
 late Future<UserGonderileri> userGonderileriAlbum;
  
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
 

  // TODO: Implement _loadRewardedAd()
  
  

  
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
    

  }
  var sayfadancikisyapildi = false;
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
        backgroundColor: const Color(0xFF080E1A),
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
                             
                              child: Text("Profilin",style: GoogleFonts.roboto(
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
                          borderRadius: BorderRadius.circular(10) ,
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
                                
                                Container( // TODO BAK
                                  width: 100.w,
                                  height: Adaptive.w(65), // 27
                                  
                                  //color :const Color.fromARGB(255, 41, 36, 66),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: screenWidth,
                                        height: Adaptive.w(35),
                                        
                                        child: Padding(
                                          padding: const EdgeInsets.only( top : 0.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                                child: Container( // !! PP 
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xff7c94b6),
                                                  image: DecorationImage(
                                                    image: NetworkImage(snapshot.data.user.hdProfilePicUrlInfo.url),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius: BorderRadius.all( Radius.circular(50.0)),
                                                  border: Border.all(
                                                    color: Color(0xFFA1AEC2),
                                                    width: 3.0,
                                                  ),
                                                ),
                                                ),
                                              ),
                                              Padding(
                                               padding: const EdgeInsets.only(bottom : 25.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                                
                                                Text(snapshot.data!.user.mediaCount.toString(),style: GoogleFonts.roboto(
                                                      textStyle : const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                                        ),),
                                                Text("gönderi",style: GoogleFonts.roboto(
                                                      textStyle : const TextStyle(fontSize: 20,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                                        ),),
                                            ],
                                          ),
                                              ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom : 25.0),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Text(snapshot.data!.user.followerCount.toString(),style: GoogleFonts.roboto(
                                                      textStyle : const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                                        ),),
                                              Text("takipçi",style: GoogleFonts.roboto(
                                                      textStyle : const TextStyle(fontSize: 20,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                                        ),),

                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom : 25.0),
                                                    child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(snapshot.data!.user.followingCount.toString(),style: GoogleFonts.roboto(
                                                      textStyle : const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                                        ),),
                                              Text("takip",style: GoogleFonts.roboto(
                                                      textStyle : const TextStyle(fontSize: 20,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                                        ),),
                                              
                                            ],
                                          ),
                                                  ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          width: Adaptive.w(35),
                                          height: Adaptive.w(9),
                                          
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              
                                              InkWell(
                                                onTap: (){
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
                                                  
                                                 

                                                },
                                                child: Container(
                                                  width: 30.w,
                                                  height: 5.h,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF0C0F19),
                                                    borderRadius: BorderRadius.all( Radius.circular(9.0)),
                                                    border: Border.all(
                                                      color: Colors.green,
                                                      width:2.0,
                                                    ),
                                                  
                                                  ),
                                                  child: Center( // !! profil resmi indirme butonu
                                                    child: Shimmer.fromColors(
                                                      baseColor: Colors.white,
                                                      highlightColor: Colors.green,
                                                      period: const Duration(seconds: 4),
                                                      child: Text("Profil Resmini İndir",style: GoogleFonts.roboto(
                                                        textStyle: const TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w500)
                                                      ),),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              
                                            ],
                                          ),
                                        
                                        ),
                                      ),
                                      Container(
                                        width: Adaptive.w(65),
                                        height: Adaptive.w(1),
                                        
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.7),
                                          borderRadius: BorderRadius.all( Radius.circular(9.0)),
                                         
                                        
                                        ),
                                      )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 35.w,
                                            height: 19.w,
                                            
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom : 20.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                       Flexible(
                                                        child: Text(snapshot.data.user.fullName,style: GoogleFonts.roboto(
                                                          textStyle: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500)
                                                        ),
                                                        overflow: TextOverflow.ellipsis,
                                                        ),
                                                       ),
                                                       Flexible(
                                                        child: Text("@"+snapshot.data.user.username,style: GoogleFonts.roboto(
                                                          textStyle: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500)
                                                        ),
                                                        overflow: TextOverflow.ellipsis,
                                                        ),
                                                       ),
                                                      
                                                         
                                                  ],
                                                ),
                                            ),

                                          ),
                                          benmiyim  == true ?
                                          Padding(
                                            padding: const EdgeInsets.only(left : 20.0),
                                            child: Container(
                                              width: 55.w,
                                              height: 19.w,
                                              child: InkWell(
                                                                          onTap: (){
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
                                
                                      /*
                                      if(AllMedia.length == 0){
                                        return;
                                      }
                                      else{
                                        toastfunc();
                                        for(var i = 0; i < AllMedia.length ; i++){
                                        downloadFile(AllMedia[i]);
                                      }
                                      }
                                      */
                                                                          },
                                                                           child: Container(
                                       width: Adaptive.w(28),
                                      height: Adaptive.w(12),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF0C0F19),
                                        borderRadius: const BorderRadius.all(Radius.circular(6)),
                                        border: Border.all(color: const Color(0xFF954191))
                                      ),
                                      child: Center(
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.white,
                                          highlightColor: Colors.green,
                                          period: const Duration(seconds: 4),
                                          child: Text("Tüm Medyayı İndir",style: GoogleFonts.roboto(
                                                  textStyle : const TextStyle(fontSize:12,color: Colors.white,fontWeight: FontWeight.w400,letterSpacing: 1.0)
                                                    ),),
                                        ),
                                      ),
                                                                     ),
                                                                         ),
                                            ),
                                          )
                                          :
                                          Container(
                                            width: 65.w,
                                            height: 19.w,
                                            child: Row( //!!! butonlar
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                 takip == true ? 
                                             Container(
                                     width: Adaptive.w(28),
                                      height: Adaptive.w(12),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF0C0F19),
                                        borderRadius: const BorderRadius.all(Radius.circular(6)),
                                        border: Border.all(color: const Color(0xFF2CBAFF))
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                        SvgPicture.asset(
                                          'assets/images/svgicons/takipetlogo.svg',
                                          width: 10,
                                          height: 10,
                                        ),
                                        Text("Takip Ediyorsun",style: GoogleFonts.roboto(
                                            textStyle : const TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w400,letterSpacing: 1.0)
                                              ),),
                                      ]),
                                                                        )
                                                                      :
                                                                      InkWell(
                                                                        onTap: (){},
                                                                        child: Container(
                                      width: Adaptive.w(28),
                                      height: Adaptive.w(12),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF0C0F19),
                                        borderRadius: const BorderRadius.all(Radius.circular(6)),
                                        border: Border.all(color: const Color(0xFF2CBAFF))
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                        SvgPicture.asset(
                                          'assets/images/svgicons/takipetlogo.svg'
                                        ),
                                        Text("Takip Et",style: GoogleFonts.roboto(
                                            textStyle : const TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w400,letterSpacing: 1.0)
                                              ),),
                                      ]),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        onTap: (){
                                      if(AllMedia.length == 0){
                                        return;
                                      }
                                      else{
                                        toastfunc();
                                        for(var i = 0; i < AllMedia.length ; i++){
                                        downloadFile(AllMedia[i]);
                                      }
                                      }
                                                                        },
                                                                         child: Container(
                                       width: Adaptive.w(28),
                                      height: Adaptive.w(12),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF0C0F19),
                                        borderRadius: const BorderRadius.all(Radius.circular(6)),
                                        border: Border.all(color: const Color(0xFF954191))
                                      ),
                                      child: Center(
                                        child: Text("Tüm Medyayı İndir",style: GoogleFonts.roboto(
                                              textStyle : const TextStyle(fontSize:12,color: Colors.white,fontWeight: FontWeight.w400,letterSpacing: 1.0)
                                                ),),
                                      ),
                                                                   ),
                                                                       ),
                                                                       SizedBox(width: 4,),
                                      
                                      
                                    
                                  
                                      
                                              ],
                                            ),
                                          )


                                        ],
                                      ),
                                      
                                    ],
                                  )

                                 
                                ),
                                Container(  // !!!
                                  width: screenWidth,
                                  height: Adaptive.h(12),
                                  color: const Color(0xFF1A1335),
                                  child: Center(
                                    child: Text("Hikaye izleme özelliği yakında gelecek",style: GoogleFonts.roboto(
                                          textStyle : const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                            ),),
                                  ),
                                  
                                ),
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
                                                              
                                                            }
                                                            else if(snapshot.data!.items[index].mediaType == 8){
                                                              for(int i = 0; i < snapshot.data!.items[index].carouselMedia.length; i++){
                                                                if(snapshot.data!.items[index].carouselMedia[i].mediaType == 2){
                                                                  downloadFile(snapshot.data!.items[index].carouselMedia[i].videoVersions[0].url);
                                                              
                                                                }
                                                                else if(snapshot.data!.items[index].carouselMedia[i].mediaType == 1){
                                                                 
                                                                  downloadFile(snapshot.data!.items[index].carouselMedia[i].imageVersions2.candidates[0].url);
                                                                 
                                                                }
                                                              }
                                                            }
                                                            else{
                                                              downloadFile(snapshot.data!.items[index].imageVersions2.candidates[0].url);
                                                              
                                                            
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
                                                              
                                                            }
                                                            else if(snapshot.data!.items[index].mediaType == 8){
                                                              for(int i = 0; i < snapshot.data!.items[index].carouselMedia.length; i++){
                                                                if(snapshot.data!.items[index].carouselMedia[i].mediaType == 2){
                                                                  downloadFile(snapshot.data!.items[index].carouselMedia[i].videoVersions[0].url);
                                                              
                                                                }
                                                                else if(snapshot.data!.items[index].carouselMedia[i].mediaType == 1){
                                                                 
                                                                  downloadFile(snapshot.data!.items[index].carouselMedia[i].imageVersions2.candidates[0].url);
                                                                 
                                                                }
                                                              }
                                                            }
                                                            else{
                                                              downloadFile(snapshot.data!.items[index].imageVersions2.candidates[0].url);
                                                              
                                                            
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
                         Center(
                           child: Padding(
                             padding: const EdgeInsets.only(top : 250.0),
                             child: Container(
                              width: screenWidth,
                              height: screenHeight * 0.2,
    
    
                              child: SvgPicture.asset(
                                'assets/images/svgicons/lockkilit.svg',
                                width: 100,
                                height: 100,
                                color: Colors.grey,
                              
                              ),
                             ),
                           ),
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