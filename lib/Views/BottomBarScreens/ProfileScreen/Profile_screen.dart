
import 'dart:async';
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart';

import 'package:instero/Services/getuserStories.dart';

import 'package:instero/Views/BottomBarScreens/ProfileScreen/Notifacations.dart';
import 'package:instero/Views/BottomBarScreens/ProfileScreen/YourProfile.dart';
import 'package:instero/Views/BottomBarScreens/ProfileScreen/setttings_page.dart';
import 'package:instero/Views/BottomBarScreens/ProfileScreen/storyPage.dart';
import 'package:instero/Views/LoginPage/LoginPage.dart';

import 'package:instero/Views/Logout/WebViewLogutPage.dart';
import 'package:instero/Views/prototippages/POPupEr%C4%B1s%C4%B1m.dart';
import 'package:instero/ads/ad_helper.dart';

import 'package:instero/models/UserGonderileriModel.dart';
import 'package:instero/models/UserInfo.dart';
import 'package:instero/models/userStoriesModel.dart';
import 'package:instero/revenue/PayWall.dart';
import 'package:instero/revenue/constants.dart';
import 'package:instero/revenue/singletons_data.dart';
import 'package:ndialog/ndialog.dart';
import 'package:page_transition/page_transition.dart';
import 'package:purchases_flutter/models/offering_wrapper.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xrandom/xrandom.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {

  //late Future<UserInfo> futureAlbum;
  final String assetYukari = 'assets/images/svgicons/yukariarrow.svg';
  final String assetAssagi = 'assets/images/svgicons/assagiarrow.svg';
  final String assetHayalet = 'assets/images/svgicons/hayalet.svg';
  final String assetYukselis = 'assets/images/svgicons/yukselis.svg';
  final String assetForward = 'assets/images/svgicons/arrowforward.svg';
  final String assetSpy = 'assets/images/svgicons/spy.svg';
  final String assetYuvarlak = 'assets/images/svgicons/nextyuvarlak.svg';
  final String assetAyar = 'assets/images/svgicons/ayaricon.svg';


 

   late  Future<UserInfo>? futureAlbum; // ! 
   late  Future<UserStories>? storiesAlbum; // !
   late Future<UserGonderileri> gonderilerAlbum; // !
   var kontrol;
   Future<void> showpref() async {
        SharedPreferences local = await SharedPreferences.getInstance();
        print("**********************************");
        
        
   }
   bool hatali = false;
    Future<void> clealocal() async {
      SharedPreferences local = await SharedPreferences.getInstance();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      local.clear();
      prefs.clear();
    }
  
  //Map<dynamic, dynamic> data = {};
   //counter function
   var counterPro = 0;
   late bool reset ;
   void checket() async{
    SharedPreferences local = await SharedPreferences.getInstance();
    reset = local.getBool("reset") ?? false;
     
   }
   var mediacount;
   var videcount;
   var userid;
   // ! İSTEKLER 1 BAŞ
   Future<UserInfo> getRequest() async {
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
             SharedPreferences local = await SharedPreferences.getInstance();
             SharedPreferences forbottom = await SharedPreferences.getInstance();
             userid = local.getString("userid");
              var dsUserId = prefs.getString("ds_user_id");
              var sessionid = prefs.getString("sessionid");
              var csrftoken = prefs.getString("csrftoken");
            
            var url = Uri.parse('https://www.instagram.com/api/v1/users/$dsUserId/info');
            
            var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$dsUserId; ',
              'user-agent':"Instagram 64.0.0.14.96 Android",// "Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id':"936619743392459", //794590088308990 -2055074604688395
              

              
            });
            print("*************USERINFO*********************");
            print(response.body);
            print(response.statusCode);
             Map<dynamic, dynamic> dataget = {}; // yeri değişebilir !
            
            if (response.statusCode == 200) {
                var jsonResponse = jsonDecode(response.body);
                            jsonResponse.forEach((key, value) async {
                              dataget[key] = value;
                              
                            
                            });
                            if(dataget["user"]["full_name"] == null){
                                hatali = true;
                                }
                               
                            mediacount = dataget["user"]["media_count"]; // TODO SET STATE EKLENEBİLİR ÇIKIŞ YAYĞMA FİX
                                videcount = dataget["user"]["total_igtv_videos"] ?? 0;
                                local.setString("username", dataget["user"]["username"] ?? " ");
                                
                                
                                local.setString("fullName", dataget["user"]["full_name"] ?? " ");
                                local.setString("userid", dataget["user"]["pk"] ?? " ");
                                local.setString("profilePic", dataget["user"]["profile_pic_url"] ?? " ");
                                forbottom.setString("username", dataget["user"]["username"]);
                                forbottom.setString("fullName", dataget["user"]["full_name"] ?? " ");
                                forbottom.setString("userid", dataget["user"]["pk"] ?? " ");
                                forbottom.setString("profilePic", dataget["user"]["profile_pic_url"] ?? " ");
            }
            else{
              print("HATA!!!!!!!!!!!!!!!!!!!!!!");
                            hatali = true;
                                    
            }

                                

                   
                   /*
                   
                   */
           


            
           
            

              return UserInfo.fromJson(jsonDecode(response.body));
           
          } 

          // ! İSTEKLER 1 SON
          
          Future<UserStories> getStoriesForPrivate() async {
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
              SharedPreferences local = await SharedPreferences.getInstance();
              var ds_user_id = prefs.getString("ds_user_id");
              var sessionid = prefs.getString("sessionid");
              var csrftoken = prefs.getString("csrftoken");
            
            var url = Uri.parse('https://i.instagram.com/api/v1/feed/reels_tray/');
            
            var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$ds_user_id; ',
              'user-agent':"Instagram 64.0.0.14.96 Android",// "Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id':"936619743392459", //794590088308990 -2055074604688395
              

              
            });
            print("-----------USERS STORIES-----------------");
            print(response.body);
            print(response.statusCode);


             Map<dynamic, dynamic> dataget = {}; // yeri değişebilir !
            
            
             var jsonResponse = jsonDecode(response.body);
            jsonResponse.forEach((key, value) {
              dataget[key] = value;
              

              
              
            
            });
            if(response.statusCode != 200){
               hatali = true;
               setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewLogut()));
               });
              
            }
            
            
           
            
            
            return UserStories.fromJson(jsonDecode(response.body));
          } 
     
   
     
   int? kazanilantakipciler;
   int? kaybedilendakipciler;
   bool degis = false;
   bool upordown = true;
     // compare followerCount function
     Future<void> comparefollowerCount() async {
      if(futureAlbum != null){
        SharedPreferences local = await SharedPreferences.getInstance();
          var eski = local.getInt("followerCount")??0;
          
          futureAlbum!.then((value) => setState(() {
            if(value.user!.followerCount! > eski){
              upordown = true;
              kazanilantakipciler = (value.user!.followerCount! - eski);
              local.setInt("kazanilantakipcilerlocal", kazanilantakipciler!);
            }
            else{
              kazanilantakipciler = local.getInt("kazanilantakipcilerlocal");
            }
            //kazanilantakipciler = local.getInt("kazanilantakipcilerlocal");

            if(value.user!.followerCount! < eski){
              upordown = false;
              kaybedilendakipciler = eski - value.user!.followerCount!;
              local.setInt("kaybedilendakipcilerlocal", kaybedilendakipciler!);
            }
            else{
              kaybedilendakipciler = local.getInt("kaybedilendakipcilerlocal");
            }
           kaybedilendakipciler = local.getInt("kaybedilendakipcilerlocal");
            
     }
      ));
      }
      else{
        kazanilantakipciler = 0;
        kaybedilendakipciler = 0;
        
      }
      
          
      }



      var photolikecount;
      var videolikecount;
      Future<UserGonderileri> getUserGonderileriPrivate() async {
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
             SharedPreferences local = await SharedPreferences.getInstance();
              var dsUserId = prefs.getString("ds_user_id");
              var sessionid = prefs.getString("sessionid");
              var csrftoken = prefs.getString("csrftoken");
            
            var url = Uri.parse('https://i.instagram.com/api/v1/feed/user/$dsUserId/');
            
            var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$dsUserId; ',
              'user-agent':"Instagram 64.0.0.14.96 Android",// "Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id': "936619743392459", //794590088308990 -2055074604688395
              

              
            });
            print("*************Storiler FEED*********************");
            print(response.body );
            print("  A A A A  S $response.statusCode");
            /*

            if(response.statusCode == 404 || response.statusCode == 403 || response.statusCode == 400){
              print("2222222222222222222222222222222222222");
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WebViewLogut(),));
                              
                            
                            };
                            */
              Map<dynamic, dynamic> dataget = {};
              if(response.statusCode == 200){
                    var jsonResponse = jsonDecode(response.body);
                                            jsonResponse.forEach((key, value) async {
                                              dataget[key] = value;
                                              
                                            
                                            });
             
             
                if( dataget["items"] != null){
                  for(int i = 0; i < dataget["items"].length; i++){
                    if(dataget["items"][i]["media_type"] == 1){
                      photolikecount = dataget["items"][i]["like_count"];
                    }
                    else if(dataget["items"][i]["media_type"] == 2){
                      videolikecount = dataget["items"][i]["like_count"];
                    }
                    else if( dataget["items"][i]["media_type"] == 8){
                      photolikecount = dataget["items"][i]["like_count"];
                    

                    }
                  }
                }
                else{
                  photolikecount = 0;
                  videolikecount = 0;
                }
              }
              else{
                 print("HATA!!!!!!!!!!!!!!!!!!!!!!");
                          hatali = true;
                                  

              }
               

            


                                  return UserGonderileri.fromJson(jsonDecode(response.body));
                      
            
          } 

         
          
   var a;
   var storiesLimit;
   // ! ADS
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

    /*
    Future<void> _ShowRewardedAd() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
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
          
          print('$ad with reward $reward');
          storiesLimit = reward.amount;
          print("***********************************");
          
          print("storiesLimit: $storiesLimit");
          
          print("***********************************");
        });
        _rewardedAd = null;
      } else {
        print('Ad is not ready.');
      }
    } 
    */

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
  
 
  static var storyDownloadCounter;
   void changeStoryDownloadCounter()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     
    prefs.setInt("storyDownloadCounter", 3);
    storyDownloadCounter = prefs.getInt("storyDownloadCounter");

    
   }

  
   @override
  void initState() {
    super.initState();
     //_loadRewardedAd();
  /*
    if(hatali ==true){
      setState(() {
          SharedPreferences.getInstance().then((prefs) {
        // clear all
        prefs.clear();
      });
      SharedPreferences.getInstance().then((local) {
        // clear all
        local.clear();
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewLogut()));
      });
    
    }
*/
  checkPro();
      final xrandom = Xrandom();

      a = xrandom.nextInt(5);
  
    
  
    checket();
    showpref(); // log
    futureAlbum = getRequest(); // get request
    storiesAlbum = getStoriesForPrivate(); // get stories
    gonderilerAlbum = getUserGonderileriPrivate(); // get gonderiler
    comparefollowerCount(); // followersı compare eden fonksiyon
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _rewardedAd?.dispose();
    
  }
   List<int> tiklananlar =[];

  void iftouch(int index){
    setState(() {
      if(tiklananlar.contains(index)){
      tiklananlar.remove(index);
    }else{
      //tiklananlar.add(index);
    }
    });
    
  }
 
  

 
  @override
  Widget build(BuildContext context) {
   
    var screenWidth = MediaQuery.of(context).size.width;



    return  Scaffold(
      
      backgroundColor: const Color(0xFF1C2C34),// !!!! alt taraftaki şey
      body:FutureBuilder<UserInfo>(
        
        
        future: futureAlbum, // getuserInfo
        builder: (context, AsyncSnapshot<UserInfo> snapshot) {
          
          
         if(snapshot.data == null ){
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,)
          );
            
         }
         else if(snapshot.data!.status == "fail"){
            return Center(
              child: TextButton(
                onPressed: (){
                  setState(() {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebViewLogut()));
                  });
                }, 
                child: Text("Yüklenmezse yeniden giriş yap",style: TextStyle(color: Colors.white),)
              )
            );

         }
          
         else return snapshot.hasData ?  Container(
        width: Adaptive.w(100),
        height : Adaptive.h(100),
         
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            
            Container(
              width: 100.h,
              height: Adaptive.h(34),
              //color: Colors.green,
              
              child: Stack(
                children: [
                  Image.network(
                    snapshot.data!.user!.hdProfilePicVersions!.last.url!,  // ? ÜSTÜNE DEGRADE EKLENECEK
                    width : Adaptive.w(100),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: Adaptive.w(100),
                    height: Adaptive.h(34),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF0B0C1F).withOpacity(0.82),
                    const Color(0xFF141F35).withOpacity(0.82),
                    const Color(0xFF080E1A).withOpacity(0.97),
            
                  ]
                )
                    ),
                  ),
                  Container( // artıanim
                    alignment: Alignment.center,
                    child: Shimmer.fromColors(
                      baseColor: Colors.purple,
                      highlightColor: Colors.pink,
                      period: const Duration(seconds: 4),
                      child: Container(
                        width: Adaptive.w(70),
                        height: Adaptive.h(14),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/backgrounds/artıanim.png"),
                                
                          )
                        ),
                        
                      ),
                    ),
                    
                  ),
                  
                  
                  Padding( // app bar
                    padding: const EdgeInsets.only(top : 20.0,left: 17.0,right: 17), //TODO ÖNEMLİ
                    child: Container( // app bar container
                    
                width: Adaptive.w(100),
                height: Adaptive.h(7),
                child: Row(  // appbar
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left : 13.0,bottom: 5),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: Settings_Page()));
                        },
                        child: SvgPicture.asset(
                          'assets/images/svgicons/ayaricon.svg',
                          width: Adaptive.w(7.5),
                          color: const Color(0xFFABB9CD),
                        )

                      ),
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0,left: 0,bottom: 8),
                      child: Row(
                        children: [
                          appData.isPro == true ? Padding(
                            padding: EdgeInsets.only(right : 5.0),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                ColorizeAnimatedText(
                                  speed: const Duration(milliseconds: 6000),

                                  'PRO',
                                  textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                                  colors: [
                                    Colors.purple,
                                    Colors.blue,
                                    Colors.yellow,
                                    Colors.red,
                                  ],
                                ),
                              ],
                              isRepeatingAnimation: true,
                              repeatForever: true,

                              onTap: () {
                                print("Tap Event");
                              },
                            ),
                          ) : Text("",style: const TextStyle(color: Color(0xFFABB9CD),fontSize:  15 ,fontWeight: FontWeight.w600),),
                          
                          Text(snapshot.data!.user!.username!,style: const TextStyle(color: Color(0xFFABB9CD),fontSize:  15 ,fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ),
                    IconButton(onPressed: (){
                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const NotificationPage()));
                      
                    }, icon: const Icon(Icons.notifications_none_outlined,size: 30,color: Color(0xFFABB9CD),)),
                  ],
                ),
              )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left : 40.0,right: 60,top: 13,bottom: 20),
                    child: Row( // üçlü yer
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              Text(snapshot.data!.user!.followerCount.toString(),style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w800,letterSpacing: .0)),),
                              const SizedBox(height: 3,),
                              Text("Takipçi",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),),
                            ],
                          ),
                           Center(
                             child: Stack(
                              children: [
                                
                                Container(
                                  width: 31.w,
                                  height: 15.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xFF0C0E16),
                                    border: Border.all(color: Color(0xFF232941),width: 2)
                                  ),
                                ),
                                Positioned.fill(

                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Shimmer.fromColors(
                                      baseColor: Color(0xFF830AE6),
                                        highlightColor: Color(0xFFFF13E2),
                                      period: const Duration(seconds: 4),
                                      child: Container(
                                        width : 24.w,
                                        height: 12.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFFFF13E2),
                                            Color(0xFFB60DED),
                                            Color(0xFF6407FA),
                                            Color(0xFF830AE6),
                                          ]
                                        )   
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Padding(
                                    padding: const EdgeInsets.all(17.0),
                                    child: Container(
                                    
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xFF0C0E16),
                                      
                                    ),
                                    
                                ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => YourPage(id: snapshot.data!.user!.pk.toString())));
                                      },
                                      child: CircleAvatar(
                                        
                                        radius: 18,
                                        child: ClipOval(
                                            child: Image.network(
                                              snapshot.data!.user!.hdProfilePicVersions!.last.url!,
                                              
                                            ),
                                            ),
                                        ),
                                    ),
                                  ),
                                ),
                                
                              
                              ],

                             ),
                           ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(snapshot.data!.user!.followingCount.toString(),style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w800,letterSpacing: .0)),),
                              const SizedBox(height: 3,),

                              Text("Takip",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),),
                            ],
                          ),
                          
                        ],
                      ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                            width: Adaptive.w(100),

                            height: Adaptive.h(8),
                          
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left : 24.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          kazanilantakipciler == null ? const Text("0",style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w600),) 
                                          : 
                                          Text(snapshot.data!.user!.followerCount.toString(),style: const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w600),),
                                          //const Text("467",style: TextStyle(fontSize: 17,color: Colors.white),),
                                          const SizedBox(width: 4,),
                                          upordown == true ?
                                          appData.isPro == true ?
                                          Shimmer.fromColors(
                                            baseColor: Color(0xFF830AE6),
                                            highlightColor: Color(0xFFFF13E2),
                                            child: SvgPicture.asset(
                                              assetYukari,
                                              height: 2.h,
                                              color: Color.fromARGB(255, 243, 42, 199),
                                            ),
                                          ) :
                                           SvgPicture.asset(
                                            assetYukari,
                                            height: 2.h,
                                            color: const Color(0xFF00FA55),
                                          ):
                                          appData.isPro == true ?
                                          Shimmer.fromColors(
                                            baseColor: Color(0xFF830AE6),
                                            highlightColor: Color(0xFFFF13E2),
                                            child: SvgPicture.asset(
                                              'assets/images/svgicons/assagiarrow.svg',
                                              height: 2.h,
                                              color: Color.fromARGB(255, 243, 42, 199),
                                            ),
                                          ) :
                                          SvgPicture.asset(
                                            'assets/images/svgicons/assagiarrow.svg',
                                            height: 2.h,
                                            color: const Color(0xFFFF0000),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 2,),
                                      const Text("takip",style: TextStyle(fontSize: 15,color: Color(0xFFB4BAD2),fontWeight: FontWeight.w600 ),),
                                    ],
                                  ),
                                ),
                                snapshot.data!.user!.mediaCount == null ? const SizedBox() : Padding(
                                  padding: const EdgeInsets.only(left : 24.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(snapshot.data!.user!.mediaCount.toString(),style: const TextStyle(fontSize: 17,color: Colors.white ,fontWeight: FontWeight.w600 ),),
                                          const SizedBox(width: 4,),
                                          upordown == true ? 
                                          appData.isPro == true ?
                                          Shimmer.fromColors(
                                            baseColor: Color(0xFF830AE6),
                                            highlightColor: Color(0xFFFF13E2),
                                            child: SvgPicture.asset(
                                              assetYukari,
                                              height: 2.h,
                                              color: Color.fromARGB(255, 243, 42, 199),
                                            ),
                                          ) :
                                          SvgPicture.asset(
                                            assetYukari,
                                            height: 2.h,
                                            color: const Color(0xFF00FA55),
                                          ):
                                          appData.isPro == true ?
                                          Shimmer.fromColors(
                                            baseColor: Color(0xFF830AE6),
                                            highlightColor: Color(0xFFFF13E2),
                                            child: SvgPicture.asset(
                                              'assets/images/svgicons/assagiarrow.svg',
                                              height: 2.h,
                                              color: Color.fromARGB(255, 243, 42, 199),
                                            ),
                                          ) :
                                          
                                          
                                          SvgPicture.asset(
                                            'assets/images/svgicons/assagiarrow.svg',
                                            height: 2.h,
                                            color: const Color(0xFFFF0000),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 2,),
                                      const Text("paylaşım",style: TextStyle(fontSize: 15,color: Color(0xFFB4BAD2),fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),
                                // ! resim beğeni
                                FutureBuilder(
                                  future: gonderilerAlbum,
                                  builder: (BuildContext context, AsyncSnapshot<UserGonderileri> snapshot) {
                                    if(snapshot.hasData){
                                      return Row(
                                        children: [
                                           Padding(
                                  padding: const EdgeInsets.only(left : 24.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children:  [
                                          
                                          mediacount == 0 ? 
                                          const Text("0",style: TextStyle(fontSize: 17,color: Colors.white),)
                                          :
                                          Text((mediacount! / photolikecount).toString().substring(0,3), // TODO 3
                                          style: const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w600),),
                                        ],
                                      ),
                                      const SizedBox(height: 2,),
                                      const Text("fotoğraf başına beğeni",style: TextStyle(fontSize: 15,color: Color(0xFFB4BAD2),fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                  
                                ),
                                // ! video beğeni
                                
                                Padding(
                                  padding: const EdgeInsets.only(left : 24.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children:  [
                                          videcount == 0 ?
                                          const Text("0",style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w600),)
                                          :
                                          Text((videcount / videolikecount ).toString().substring(0,2) //! belki 2 yle böünebilir
                                          
                                          ,style: const TextStyle(fontSize: 17,color: Colors.white),),
                                        ],
                                      ),
                                      const SizedBox(height: 2,),
                                      const Text("video başına beğeni",style: TextStyle(fontSize: 15,color: Color(0xFFB4BAD2),fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                  
                                ),
                              
                                        ],
                                      );

                                    }
                                    else{
                                      return const SizedBox();
                                    }
                                    
                                  },
                                ),
                               
                                /*
                                Padding(
                                  padding: const EdgeInsets.only(left : 24.0,right: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: const [
                                          Text("25",style: TextStyle(fontSize: 17,color: Colors.white),),
                                        ],
                                      ),
                                      const SizedBox(height: 2,),
                                      const Text("video başına yorum",style: TextStyle(fontSize: 15,color: Color(0xFFB4BAD2)),),
                                    ],
                                  ),
                                  
                                )
                                */
        
                              ],
                            )
                          ),
                  )
                  
                ],
                
              ),      
            ),
            // second container
            Container(
              decoration: const BoxDecoration(
                //color: Colors.blue,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
            ),
            BoxShadow(
              color: Color(0xFF080E1A),
              offset: Offset(1,15),
              
              spreadRadius: 10.0,
              blurRadius: 5.0,
            ),
            
            
          ],
        ),
              width: 100.h,
              height: 19.h,
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                       Padding(
                    padding: const EdgeInsets.only(top : 10.0),
                    child: Container(
                      width: 100.h,
                      height: 5.h, 
                      
                      
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          SvgPicture.asset(
                            assetHayalet,
                            width : 5.w,
                            color: const Color(0xFFD3D1E5),
                          ),
                          const SizedBox(width: 4,),
                          
                          Shimmer.fromColors(
                            baseColor: const Color(0xFFD3D1E5),
                            highlightColor: const Color(0xFFD3D1E5).withOpacity(0.5),
                            period: const Duration(seconds: 4),
                            child: Text("Gizli Hikaye İzleme",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 13,color: Color(0xFFD3D1E5),fontWeight: FontWeight.w500,letterSpacing: .0)),))
                          
                        ],
                      ),
                    ),
                  ),



                      Align(
                        alignment: Alignment.centerRight,
                        
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
                                    
                                    icon:  SvgPicture.asset(
                                      assetHayalet,
                                      width : 5.w,
                                      color: Colors.white,
                                    ),
                                    actionsAlignment: MainAxisAlignment.center,

                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    title: Text("Instegro",style: TextStyle(color: Colors.white),),
                                    content: Text("Hikayeleri reklamsız izlemek istiyorsan PRO'ya geç",textAlign: TextAlign.center ,style: TextStyle(color: Colors.white),),
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
                                            child: Center(child: Text("PRO'YA GEÇ",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                                                                               
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
                          },
                          child: 
                          appData.isPro == true ?
                          Container():
                          Container(
                            margin: const EdgeInsets.only(top: 10,right: 20),
                                width: 4.h,
                                height: 4.h,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 45, 45, 46),
                                  shape: BoxShape.circle,
                                  border: Border.fromBorderSide(BorderSide(color: const Color(0xFFB60DED),width: 1)), 
                                ),
                                child: storiesLimit == null ?
                                Shimmer.fromColors(
                                  baseColor: Colors.white,
                                  highlightColor: Colors.white.withOpacity(0.5),
                                  child: Center(child: Text("0",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: .0)),textAlign: TextAlign.center,))):
                                Shimmer.fromColors(
                                  baseColor: Colors.white,
                                  highlightColor: Colors.pink.withOpacity(0.9),
                                  child: Center(child: Text(storiesLimit.toString(),style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: .0)),textAlign: TextAlign.center,))),
                              )
                        ),
                      )
                    ],
                  ),
                 
                  Container( // ! stories kısmı --
                    width: 100.w,
                    height: 12.h,
                    //color: Colors.green,
                    child: FutureBuilder<UserStories>(
                      future: storiesAlbum,
                      builder :(context,AsyncSnapshot<UserStories> snapshot) {
                        return snapshot.hasData ? 
                        
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.tray!.length,
                          itemBuilder: (context,index) {
                            return snapshot.data!.tray!.length < 0 ?
                            Container():
                            Padding(
                              padding: const EdgeInsets.only(left : 16.0,right: 16,top: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                   
                                    onTap: () {
                                      counterPro++;
                                       if(counterPro %10 == 0){
                                      Navigator.push(context,MaterialPageRoute(builder: (context) =>ProyaGecPageSurekli()));
                                    }
                                      if(appData.isPro == true){
                                        Navigator.push(context,MaterialPageRoute(builder: (context) =>StoryPage(userid: snapshot.data!.tray![index].user!.pk!)));
                                      }
                                      else{
                                        if(storiesLimit == 0 || storiesLimit == null ){
                                        _loadRewardedAd();
                                        
                                      DialogBackground(
                                  blur: 5,
                                  dialog: Stack(
                                    children: [
                                      AlertDialog(
                                    shape:  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    
                                    icon: SvgPicture.asset(
                                      assetHayalet,
                                      width : 5.w,
                                      color: Colors.white,
                                    ),
                                    
                                    actionsAlignment: MainAxisAlignment.center,

                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    title: Text("Instegro",style: TextStyle(color: Colors.white),),
                                    content: Text("Hikayeleri izlemek istiyorsan kredi kazan.",textAlign: TextAlign.center ,style: TextStyle(color: Colors.white),),
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
                                                    
                                                    print('$ad with reward $reward.amount');
                                                   
                                                      print("***********************************");
                                                       print("*********************************s**");
                                                        print("********************************a**");
                                                         print("*********************************asd*");
                                                          print("*********************************asd*");
                                                          setState(() {
                                                             if(storiesLimit == null){
                                                        storiesLimit = 0;
                                                      }
                                                        storiesLimit += 3;
                                                          });
                                                     
                                                      
                                                      print(" ****** a1111111111111111111sd1* 1*as1 d*1asd1 *a1sd 1*as11d11 1*1d 1*****storiesLimit: $storiesLimit");
                                                   
                                                      
                                                      
                                                      Navigator.pop(context);
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
                                            child: Center(child: Text("PRO'YA GEÇ",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
                                                                               
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
                                      else if(storiesLimit != 0 || storiesLimit != null ){
                                        
                                          
                                          setState(() {
                                             storiesLimit -= 1;
                                             print(" 1111233333333333334444444455555556666777  storiesLimit: $storiesLimit");
                                          });
                                          print(" 1111233333333333334444444455555556666777  AFTTTERR SET STATE  storiesLimit: $storiesLimit");
                                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  StoryPage(userid: snapshot.data!.tray![index].user!.pk!)));
                                        
                                        
                                      }
                                      else{
                                        print("hikaye izleme limiti doldu");
                                      }
                                      }


                                      
                                      
                                

                                  
                                    },
                                    
                                    child: Container(
                                      width: screenWidth * 0.14,
                                      height: screenWidth * 0.14,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: tiklananlar.contains(index) ?Colors.grey.withOpacity(0.5)  : const Color(0xFFB60DED),
                                          width: 2
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(snapshot.data!.tray![index].user!.profilePicUrl!),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4,),
                                  Text(snapshot.data!.tray![index].user!.username!,style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 13,color: Color(0xFFD3D1E5),fontWeight: FontWeight.w500,letterSpacing: .0)),)
                                ],
                              ),
                            );
                          }
                        )

                       
                        :
                        const Center(child: CircularProgressIndicator());
                        
                      },

                    ),
                  )
                ],
              ),
            ),
            
            // third container
            Container(
              width: Adaptive.w(100),
              height: Adaptive.h(100),
              //height: screenHeight * 1,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 21, 27, 32),
                    Color.fromARGB(255, 21, 26, 37),
                    Color(0xFF1C2C34),
                  ]
                )
              ),
              child : Cards(screenWidth)
            
            ),
        
          ],
        ),
      )



          : const Center(child: CircularProgressIndicator());
        },
      )
    );
    
  }

  Column Cards(double screenWidth) {
    return Column(
            children: [
                Card(
                  color: const Color(0xFF080E1A),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(14),
                  ),
                  margin: const EdgeInsets.only(top :8.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    splashColor: const Color(0xFF830AE6),

                    onTap: (){
                      
                    },
                    child: Container(
                      width: Adaptive.w(90),
                      height: Adaptive.h(10),
                      //width: screenWidth * 0.90,
                      //height: screenWidth * 0.17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              const SizedBox(width: 16),
                              Text("İstatistikler",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(top : 16.0),
                                child: SvgPicture.asset(
                                  assetYukselis,
                                  width: Adaptive.w(40),
                                  
                                ),
                              
                              ),
                              const SizedBox(width: 5,),
                              Padding(
                                padding: const EdgeInsets.only(right : 16.0),
                                child: InkWell(
                                  splashColor: const Color(0xFF830AE6),
                                  borderRadius: BorderRadius.circular(14),

                                  onTap: (){},
                                  child: SvgPicture.asset(
                                    assetForward,
                                    width: 19,
                                    height: 23,
                                  ),
                                ),
                              ),
                                
                          ],
                      ),
                    ),
                  ),
                ),
                //ikinci card
                Row(
                  children: [
                    Card(
                    
                  color: const Color(0xFF080E1A),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(14),
                  ),
                  margin: const EdgeInsets.only(top : 8.0,left: 21),
                  child: InkWell(
                    splashColor: const Color(0xFF830AE6),
                    borderRadius: BorderRadius.circular(14),
                    onTap: (){},
                    child: Container(
                      
                      width: screenWidth * 0.44,
                      height: screenWidth * 0.28,
                      child: Padding(
                        padding: const EdgeInsets.only(left : 16.0,top:16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kazanilantakipciler == null ?Text("0",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),)
                            :
                            Text("$kazanilantakipciler",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),),
                            //Text("0",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),),
                            const SizedBox(height: 8,),
                            Text("Kazanılan Takipçiler",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 14,color: Color(0xFFB4BAD2),letterSpacing: .0)),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width :8),
                Card(
                  color: const Color(0xFF080E1A),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(14),
                  ),
                  margin: const EdgeInsets.only(top : 8.0,right: 0),
                  child: InkWell(
                    splashColor:  Colors.red,
                  
                    borderRadius: BorderRadius.circular(14),
                    onTap: (){
                      
                    },
                    child: Container(
                      width: screenWidth * 0.44,
                      height: screenWidth * 0.28,
                      child: Padding(
                        padding: const EdgeInsets.only(left : 16.0,top:16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kaybedilendakipciler  == null ? Text("0",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),)
                            :
                            Text("$kaybedilendakipciler",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),),
                            //Text("0",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),),
                            const SizedBox(height: 8,),
                            Text("Kaybedilen Takipçiler",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 14,color: Color(0xFFB4BAD2),letterSpacing: .0)),),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                  ],
                ),
                Row(
                  children: [
                    Card(
                  color: const Color(0xFF080E1A),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(14),
                  ),
                  margin: const EdgeInsets.only(top : 8.0,left: 21),
                  child: InkWell(
                    splashColor: const Color(0xFF830AE6),
                    borderRadius: BorderRadius.circular(14),
                    onTap: (){
                      setState(() {
                        
                      });
                    },
                    child: Container(
                      width: screenWidth * 0.44,
                      height: screenWidth * 0.28,
                      child: Padding(
                        padding: const EdgeInsets.only(left : 16.0,top:16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(a.toString(),style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),),
                                //const SizedBox(width: 8,),
                                //const Text("5",style: TextStyle(color: Color(0xFFCBF9FF),fontSize: 17),),
                                const SizedBox(width: 2,),
                                SvgPicture.asset(
                                  assetYukari,
                                  width:1 ,
                                  height: 16,
                                )
                              ],
                            ),
                            const SizedBox(height: 8,),
                            Text("Yeni Profil Ziyaretçileri",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 14,color: Color(0xFFB4BAD2),letterSpacing: .0)),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width :8),
                Card(
                  color: const Color(0xFF080E1A),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(14),
                  ),
                  margin: const EdgeInsets.only(top : 8.0,right: 0),
                  child: InkWell(
                    splashColor:  Colors.red,
                    borderRadius: BorderRadius.circular(14),
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
                      width: screenWidth * 0.44,
                      height: screenWidth * 0.28,
                      child: Padding(
                        padding: const EdgeInsets.only(left : 16.0,top:16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("0",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),),
                            const SizedBox(height: 8,),
                            Text("Beni Engelleyenler",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 14,color: Color(0xFFB4BAD2),letterSpacing: .0)),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                
                  ],
                ),
                Card( // notifaction bar
                    
                  color: const Color(0xFF1B1D27),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF707590),width: 2),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  margin: const EdgeInsets.only(top : 16.0,left: 4),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
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
                    splashColor: const Color(0xFF830AE6),

                    child: Container(
                      width : Adaptive.w(90),
                      height: Adaptive.h(7),
                      //width: screenWidth * 0.9,
                      //height: screenWidth * 0.14,
                     
                      
                      child: Padding(
                        padding: const EdgeInsets.only(left : 3.0,right: 0,top: 5,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            SvgPicture.asset(
                              assetSpy,
                              width: Adaptive.w(3),
                              height: Adaptive.h(3),
                              
                              
                            ),
                            const SizedBox(width: 1,),
                            Text("2 Yeni Gizli Hayranın Var!",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 14,color: Color(0xFF707590),fontWeight: FontWeight.w800,letterSpacing: .0))),
                            
                            TextButton(onPressed: (){},
                             child:  Row(
                               children: [
                                 Text("Görüntüle",style: GoogleFonts.roboto(textStyle : const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w800)),),
                                 const SizedBox(width: 8,),
                                 SvgPicture.asset(
                                  assetYuvarlak,
                                  width: Adaptive.w(3),
                                  height: Adaptive.h(3),
                                 ),
                               ],
                             ),
                             ),
                             
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height : 8),
                Row( // diğer cards
                  children: [
                    Card(
                    
                  color: const Color(0xFF080E1A),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(14),
                  ),
                  margin: const EdgeInsets.only(top : 8.0,left: 21),
                  child: InkWell(
                   splashColor:  Colors.red,
                    borderRadius: BorderRadius.circular(14),
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
                      width: screenWidth * 0.44,
                      height: screenWidth * 0.28,
                      child: Padding(
                        padding: const EdgeInsets.only(left : 16.0,top:16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("?",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),),
                            const SizedBox(height: 8,),
                            Text("Geri Takip Etmeyenler",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 14,color: Color(0xFFB4BAD2),letterSpacing: .0)),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width :8),
                Card(
                  color: const Color(0xFF080E1A),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(14),
                  ),
                  margin: const EdgeInsets.only(top : 8.0,right: 0),
                  child: InkWell(
                    splashColor:  Colors.red,
                    borderRadius: BorderRadius.circular(14),
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
                      width: screenWidth * 0.44,
                      height: screenWidth * 0.28,
                      child: Padding(
                        padding: const EdgeInsets.only(left : 16.0,top:16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("4",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),),
                            const SizedBox(height: 8,),
                            Text("Takip etmediklerin",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 14,color: Color(0xFFB4BAD2),letterSpacing: .0)),),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                  ],
                ),
                
                Row( 
                  children: [
                    Card(
                  color: const Color(0xFF080E1A),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(14),
                  ),
                  margin: const EdgeInsets.only(top : 8.0,left: 21),
                  child: InkWell(
                    splashColor:  Colors.red,
                    borderRadius: BorderRadius.circular(14),
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
                      width: screenWidth * 0.44,
                      height: screenWidth * 0.28,
                      child: Padding(
                        padding: const EdgeInsets.only(left : 16.0,top:16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("?",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),),
                                //const SizedBox(width: 8,),
                                //const Text("14",style: TextStyle(color: Color(0xFFCBF9FF),fontSize: 17),),
                                //const SizedBox(width: 2,),
                                /*
                                SvgPicture.asset(
                                  assetYukari,
                                  width:1 ,
                                  height: 16,
                                )
                                */
                              ],
                            ),
                            const SizedBox(height: 8,),
                            Text("Silinen Etiketlendiğin Resimler",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 14,color: Color(0xFFB4BAD2),letterSpacing: .0)),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width :8),
                Card(
                  color: const Color(0xFF080E1A),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(14),
                  ),
                  margin: const EdgeInsets.only(top : 8.0,right: 0),
                  child: InkWell(
                    splashColor:  Colors.red,
                    borderRadius: BorderRadius.circular(14),
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
                      width: screenWidth * 0.44,
                      height: screenWidth * 0.28,
                      child: Padding(
                        padding: const EdgeInsets.only(left : 16.0,top:16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("0",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .0)),),
                            const SizedBox(height: 8,),
                            Text("Silinen Yorum ve\nBeğeniler",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 14,color: Color(0xFFB4BAD2),letterSpacing: .0)),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                
                  ],
                ),
                


          ],
          );
  }
}


