import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:instero/Views/BottomBarScreens/Ayarlar/SettingsPages/AboneliklerHakk%C4%B1nda.dart';
import 'package:instero/Views/BottomBarScreens/Ayarlar/SettingsPages/Ge%C3%A7mi%C5%9FiSilin.dart';
import 'package:instero/Views/BottomBarScreens/Ayarlar/SettingsPages/GeriBildirim.dart';
import 'package:instero/Views/BottomBarScreens/Ayarlar/SettingsPages/GizlilikPolitikas%C4%B1.dart';
import 'package:instero/Views/BottomBarScreens/Ayarlar/SettingsPages/Kullan%C4%B1mKo%C5%9Fullar%C4%B1.dart';
import 'package:instero/Views/BottomBarScreens/Ayarlar/SettingsPages/KullaniciAramaPagetwo.dart';
import 'package:instero/Views/BottomBarScreens/Ayarlar/SettingsPages/SorunBildir.dart';
import 'package:instero/Views/BottomBarScreens/ProfileScreen/Notifacations.dart';

import 'package:instero/Views/Logout/WebViewLogutPage.dart';
import 'package:instero/Views/prototippages/videtest.dart';
import 'package:instero/revenue/PayWall.dart';
import 'package:instero/revenue/constants.dart';
import 'package:instero/revenue/singletons_data.dart';
import 'package:ndialog/ndialog.dart';


import 'package:page_transition/page_transition.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class Settings_Page_two extends StatefulWidget {
  

  const Settings_Page_two({super.key});

  @override
  State<Settings_Page_two> createState() => _Settings_Page_twoState();
}

class _Settings_Page_twoState extends State<Settings_Page_two> {
  final String assetGeri = 'assets/images/svgicons/geriarrow.svg';

  final String assetIleri = 'assets/images/svgicons/ileriarrow.svg';

  final String assetBildirim = 'assets/images/svgicons/bildirimicon.svg';

  final String assetArama = 'assets/images/svgicons/aramaicon.svg';

  final String assetNasil = 'assets/images/svgicons/nasilcalisir.svg';

  final String assetGeriBildirim = 'assets/images/svgicons/bildirimver.svg';

  final String assetYildiz = 'assets/images/svgicons/yıldız.svg';

  final String assetMegafon = 'assets/images/svgicons/megafon.svg';

  final String assetGecmisSil = 'assets/images/svgicons/gecmissil.svg';

  final String assetGeriDonusum = 'assets/images/svgicons/geridonusum.svg';

  final String assetKullanimKosullari = 'assets/images/svgicons/kullanımkosulları.svg';

  final String assetGizlilikPolitikasi = 'assets/images/svgicons/gizlilikpolitikası.svg';

  final String assetAboneliklerInfo = 'assets/images/svgicons/abonelikler.svg';

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var csrf = prefs.getString('csrftoken');
  
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
  void _openAppReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {

      /// NOTE: use this SPARINGLY -> restricted by quota
      /// triggers the In-App Review prompt
      //inAppReview.requestReview();

      /// NOTE: NOT restricted by quota
      ///
      /// opens:
      /// - Google Play Store on Android,
      /// - App Store with a review screen on IOS & MacOS
      /// - Microsoft Store on Windows.
      ///
      /// Use this if you want to permanently provide a button or other
      /// call-to-action to let users leave a review
      ///
      /// appStoreId is only required on IOS and MacOS and can be found in
      /// App Store Connect under General > App Information > Apple ID.
      ///   exp: https://apps.apple.com/app/app-name/id1111111111
      ///     -> id: id1111111111
      ///
      /// microsoftStoreId is only required on Windows:
      ///   exp: https://www.microsoft.com/store/apps/<microsoftStoreId>
      inAppReview.openStoreListing(
        appStoreId: '...',
        microsoftStoreId: '...',
      );
    }
  }
  
  initState() {
    super.initState();
  
    checkPro();
  }

  _manageUser(String task, String newAppUserID) async {
    setState(() {
      _isLoading = true;
    });

    /*
      How to login and identify your users with the Purchases SDK.
            
      Read more about Identifying Users here: https://docs.revenuecat.com/docs/user-ids
    */

    try {
      if (task == "login") {
        await Purchases.logIn(newAppUserID);
      } else if (task == "logout") {
        await Purchases.logOut();
      } else if (task == "restore") {
        await Purchases.restorePurchases();
      }

      appData.appUserID = await Purchases.appUserID;
    } on PlatformException catch (e) {
      await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text("hata"),
              ));
    }

    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      
      body: Stack(
        children: [
          Container(
            width: Adaptive.w(100),
            height: Adaptive.h(100),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  
                Color(0xFF181C3C),
                Color(0xFF080C2C),
                ],
              )
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top : 30.0),
                  child: Container(
                    width: Adaptive.w(100),
                    height: Adaptive.h(6),
                   
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      
                      Row(
                      
                        children: [
                          SvgPicture.asset(
                           'assets/images/svgicons/ayaricon.svg',
                           width: Adaptive.w(8),
                           color: Colors.white,
                        ),
                        const SizedBox(width: 8,),
                        Text("Ayarlar",style: GoogleFonts.roboto(
                           textStyle : const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                             ),),
                        ],
                      )

                    ],
                    ),
                  ),
                ),
                appData.isPro == true ?
                Container()
                :
                Padding(
                  padding: const EdgeInsets.only(left: 24,right: 24,top: 24,bottom: 24),
                  child:CarouselSlider(
                    options: CarouselOptions(
                      
                      height: Adaptive.w(50),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayInterval: const Duration(seconds: 2),
                      
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      aspectRatio: 1.0,
                      initialPage: 0,
                      
                    ),
                    items :[
                      InkWell(
                        onTap: (){
                          perfomMagic();
                        },
                        child: Container( // ! asıl katman
                          width: Adaptive.w(90),
                          height: Adaptive.w(30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color.fromARGB(255, 243, 159, 63),width: 2),
                            
                            
                          
                          ),
                          child: Stack(
                            children: [
                              Container( // ! arkaplan
                                width: Adaptive.w(90),
                                height: Adaptive.w(50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/backgrounds/telefonlar.png'),
                                    fit: BoxFit.cover
                                  )
                                ),
                              ),
                              Container( //! üstündeki degrade
                                width: Adaptive.w(90),
                                height: Adaptive.w(50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                       const Color(0xFF0B1330).withOpacity(0.1),
                                       const Color(0xFF0B1330).withOpacity(0.9),
                                    const Color(0xFF0B1330).withOpacity(0.9),
                                      const Color(0xFF0B1330),
                                    ]
                                  )
                                ),
                              
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  
                                  width: Adaptive.w(70),
                                  height: Adaptive.w(50),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                       Text("Limitleri Kaldır",style: GoogleFonts.roboto(
                                  textStyle : const TextStyle(fontSize: 25,color: Color.fromARGB(255, 224, 108, 31),fontWeight: FontWeight.w800,letterSpacing: .0)
                                ),),
                                      const SizedBox(height: 3,),
                                    Text("Pro'ya Geçerek",style: GoogleFonts.roboto(
                                  textStyle : const TextStyle(fontSize: 17,color: Color(0xFF97AFDD),fontWeight: FontWeight.w800,letterSpacing: .0)
                                ),),
                                const SizedBox(height: 3,),
                                    Text("Tüm Özellikleri Özgürce Kullan",style: GoogleFonts.roboto(
                                  textStyle : const TextStyle(fontSize: 17,color: Color(0xFF97AFDD),fontWeight: FontWeight.w800,letterSpacing: .0)
                                ),),
                                SizedBox(height: 15,),
                                    InkWell(
                                      onTap: (){
                                      
                                      },
                                      child: Container(
                                        width : Adaptive.w(30),
                                        height: Adaptive.w(10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: const Color.fromARGB(255, 243, 159, 63).withOpacity(0.8),
                                                offset: const Offset(-6, 2),
                                                blurRadius: 10.0,
                                                spreadRadius: 3.0,
                                              ), 
                                          ],
                                          borderRadius: const BorderRadius.all(Radius.circular(48)),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                           Color.fromARGB(255, 243, 159, 63),
                                Color.fromARGB(255, 250, 138, 10),
                                            ]
                                          )
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Pro'ya geç",style: GoogleFonts.roboto(
                                  textStyle : const TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                ),),
                                const SizedBox(width: 6,),
                                            SvgPicture.asset(
                                              'assets/images/svgicons/beyazdişliileriarrow.svg',
                                              width: 14,
                                             
                                            )
                                          ],
                                        ),
                                      )
                                    )
                                  
                                  
                                    ],
                                  ),
                                  ),
                              )
                      
                            ],
                          ),
                        ),
                      ),


                      // ! 2
                      InkWell(
                        onTap: (){
                          perfomMagic();
                        },
                        child: Container(
                          width: Adaptive.w(90),
                          height: Adaptive.w(30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFFBEFF33),width: 2),
                            
                          
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: Adaptive.w(90),
                                height: Adaptive.w(50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/backgrounds/settingsprobackground.png'),
                                    fit: BoxFit.cover
                                  )
                                ),
                              
                              ),
                              Container(
                                width: Adaptive.w(90),
                                height: Adaptive.w(50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                       const Color(0xFF0B1330).withOpacity(0.1),
                                    const Color(0xFF0B1330).withOpacity(0.7),
                                      const Color(0xFF0B1330),
                                    ]
                                  )
                                ),
                              ),
                               Align(
                                alignment: Alignment.center,
                                child: Container(
                                  
                                  width: Adaptive.w(70),
                                  height: Adaptive.w(50),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Limitleri Kaldır",style: GoogleFonts.roboto(
                                textStyle : const TextStyle(fontSize: 25,color: Color(0xFF3CFF7E),fontWeight: FontWeight.w800,letterSpacing: .0)
                              ),),
                                      const SizedBox(height: 3,),
                                    Text("Pro'ya Geçerek",style: GoogleFonts.roboto(
                                  textStyle : const TextStyle(fontSize: 17,color: Color(0xFF97AFDD),fontWeight: FontWeight.w800,letterSpacing: .0)
                                ),),
                                const SizedBox(height: 3,),
                                    Text("Tüm Özellikleri Özgürce Kullan",style: GoogleFonts.roboto(
                                  textStyle : const TextStyle(fontSize: 17,color: Color(0xFF97AFDD),fontWeight: FontWeight.w800,letterSpacing: .0)
                                ),),
                                SizedBox(height: 15,),
                                    InkWell(
                                      onTap: (){
                                       
                                       
                                      },
                                      child: Container(
                                        width : Adaptive.w(30),
                                        height: Adaptive.w(10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(255, 73, 252, 82).withOpacity(0.8),
                                              offset: const Offset(-6, 2),
                                              blurRadius: 10.0,
                                              spreadRadius: 3.0,
                                            ), 
                                          ],
                                          borderRadius: const BorderRadius.all(Radius.circular(48)),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                          Color.fromARGB(255, 24, 226, 132),
                                            Color.fromARGB(255, 212, 253, 31),
                                            ]
                                          )
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Pro'ya geç",style: GoogleFonts.roboto(
                                  textStyle : const TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                ),),
                                const SizedBox(width: 6,),
                                            SvgPicture.asset(
                                              'assets/images/svgicons/beyazdişliileriarrow.svg',
                                              width: 14,
                                             
                                            )
                                          ],
                                        ),
                                      )
                                    )
                                  
                                  
                                    ],
                                  ),
                                  ),
                              )
                            ],
                          ),
                        ),
                      ),
                      
                      
                   
                    ]
                  ),
                  
                ),
                
                
                InkWell(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const NotificationPage()));
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenWidth * 0.15,
                    color: const Color(0xFF11131D).withOpacity(0.81),
                    child: ListTile(
                      
                      leading : Padding(
                        padding: const EdgeInsets.only(left : 10.0),
                        child: SvgPicture.asset(
                          assetBildirim,
                          color: const Color(0xFFACC5DB),
                          width: 25,
                          height: 25,
                        ),
                      ),
                      title:  Text("Bildirimler",style: GoogleFonts.roboto(
                                textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                  ),),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right : 10.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const NotificationPage()));
                            
                          },
                          child: SvgPicture.asset(
                            assetIleri,
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                  ),
                   InkWell(
                    onTap: (){
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const KullaniciAramaPageTwo()));
                    },
                     child: Container(
                                     width: screenWidth,
                                     height: screenWidth * 0.15,
                                     color: const Color(0xFF11131D).withOpacity(0.81),
                                     child: ListTile(
                      
                      leading : Padding(
                        padding: const EdgeInsets.only(left : 10.0),
                        child: SvgPicture.asset(
                          assetArama,
                          color: const Color(0xFFACC5DB),
                          width: 25,
                          height: 25,
                        ),
                      ),
                      title:  Text("Kullanıcı Ara",style: GoogleFonts.roboto(
                                textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                  ),),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right : 10.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const VideoTest() ));
                          },
                          child: SvgPicture.asset(
                            assetIleri,
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                   
                                     ),
                                   ),
                   ),
                const SizedBox(height: 24,),
                  Container(
                  width: screenWidth,
                  height: screenWidth * 0.15,
                  color: const Color(0xFF11131D).withOpacity(0.81),
                  child: ListTile(
                    
                    leading : Padding(
                      padding: const EdgeInsets.only(left : 10.0),
                      child: SvgPicture.asset(
                        assetNasil,
                        color: const Color(0xFFACC5DB),
                        width: 25,
                        height: 25,
                      ),
                    ),
                    title:  Text("Nasıl Çalışır ?",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                ),),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right : 10.0),
                      child: InkWell(
                        onTap: (){},
                        child: SvgPicture.asset(
                          assetIleri,
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ),

                  ),
                ),
                const SizedBox(height: 24,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const GeriBildirimPage()));
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenWidth * 0.15,
                    color: const Color(0xFF11131D).withOpacity(0.81),
                    child: ListTile(
                      
                      leading : Padding(
                        padding: const EdgeInsets.only(left : 10.0),
                        child: SvgPicture.asset(
                          assetGeriBildirim,
                          color: const Color(0xFFACC5DB),
                          width: 25,
                          height: 25,
                        ),
                      ),
                      title:  Text("Geri Bildirim Ver",style: GoogleFonts.roboto(
                                textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                  ),),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right : 10.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const GeriBildirimPage()));
                          },
                          child: SvgPicture.asset(
                            assetIleri,
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                
                    ),
                  ),
                ),
                Divider(color: Colors.black.withOpacity(0.6),height: 1,thickness: 1,),
                InkWell(
                  onTap: (){
                    _openAppReview();
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenWidth * 0.15,
                    color: const Color(0xFF11131D).withOpacity(0.81),
                    child: ListTile(
                      
                      leading : Padding(
                        padding: const EdgeInsets.only(left : 10.0),
                        child: SvgPicture.asset(
                          assetYildiz,
                          color: const Color(0xFFACC5DB),
                          width: 25,
                          height: 25,
                        ),
                      ),
                      title: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Uygulamayı Puanlar Mısın ?',
                                  style: GoogleFonts.roboto(
                                textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                  )  // non-emoji characters
                                ),
                                const TextSpan(
                                  text: ' 😊', // emoji characters
                                  style: TextStyle(
                                    fontFamily: 'EmojiOne',
                                  ),
                                ),
                              ],
                            ),
                          ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right : 10.0),
                        child: InkWell(
                          onTap: (){},
                          child: SvgPicture.asset(
                            assetIleri,
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                
                    ),
                  ),
                ),
                Divider(color: Colors.black.withOpacity(0.6),height: 1,thickness: 1,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const SorunBildirPage() ));
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenWidth * 0.15,
                    color: const Color(0xFF11131D).withOpacity(0.81),
                    child: ListTile(
                      
                      leading : Padding(
                        padding: const EdgeInsets.only(left : 10.0),
                        child: SvgPicture.asset(
                          assetMegafon,
                          color: const Color(0xFFACC5DB),
                          width: 25,
                          height: 25,
                        ),
                      ),
                      title:  Text("Sorun Bildir",style: GoogleFonts.roboto(
                                textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                  ),),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right : 10.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const SorunBildirPage()));
                          },
                          child: SvgPicture.asset(
                            assetIleri,
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                
                    ),
                  ),
                ),
                const SizedBox(height: 24,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const GecmisiSilPage()));
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenWidth * 0.15,
                    color: const Color(0xFF11131D).withOpacity(0.81),
                    child: ListTile(
                      
                      leading : Padding(
                        padding: const EdgeInsets.only(left : 10.0),
                        child: SvgPicture.asset(
                          assetGecmisSil,
                          color: const Color(0xFFACC5DB),
                          width: 25,
                          height: 25,
                        ),
                      ),
                      title:  Text("Geçmişi Sil",style: GoogleFonts.roboto(
                                textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                  ),),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right : 10.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const GecmisiSilPage() ));
                          },
                          child: SvgPicture.asset(
                            assetIleri,
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                
                    ),
                  ),
                ),
                Divider(color: Colors.black.withOpacity(0.6),height: 1,thickness: 1,),
                InkWell(
                  onTap: () {
                    if(appData.isPro == true){
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
                            content: Text("Geri yüklenilecek satın alım bulunamadı",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
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
                    else{
                      _manageUser("restore", appData.appUserID  );

                    }
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenWidth * 0.15,
                    color: const Color(0xFF11131D).withOpacity(0.81),
                    child: ListTile(
                      
                      leading : Padding(
                        padding: const EdgeInsets.only(left : 10.0),
                        child: SvgPicture.asset(
                          assetGeriDonusum,
                          color: const Color(0xFFACC5DB),
                          width: 25,
                          height: 25,
                        ),
                      ),
                      title:  Text("Satın Alınanları Geri Yükle",style: GoogleFonts.roboto(
                                textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                  ),),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right : 10.0),
                        child: InkWell(
                          onTap: (){},
                          child: SvgPicture.asset(
                            assetIleri,
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                
                    ),
                  ),
                ),
                const SizedBox(height: 24,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const KullanimKosullariPage()));
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenWidth * 0.15,
                    color: const Color(0xFF11131D).withOpacity(0.81),
                    child: ListTile(
                      
                      leading : Padding(
                        padding: const EdgeInsets.only(left : 10.0),
                        child: SvgPicture.asset(
                          assetKullanimKosullari,
                          color: const Color(0xFFACC5DB),
                          width: 25,
                          height: 25,
                        ),
                      ),
                      title:  Text("Kullanım Koşulları",style: GoogleFonts.roboto(
                                textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                  ),),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right : 10.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const KullanimKosullariPage()));
                          },
                          child: SvgPicture.asset(
                            assetIleri,
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                
                    ),
                  ),
                ),
                Divider(color: Colors.black.withOpacity(0.6),height: 1,thickness: 1,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const GizlilikPolitikasiPage()));
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenWidth * 0.15,
                    color: const Color(0xFF11131D).withOpacity(0.81),
                    child: ListTile(
                      
                      leading : Padding(
                        padding: const EdgeInsets.only(left : 10.0),
                        child: SvgPicture.asset(
                          assetGizlilikPolitikasi,
                          color: const Color(0xFFACC5DB),
                          width: 25,
                          height: 25,
                        ),
                      ),
                      title:  Text("Gizlilik Politikası",style: GoogleFonts.roboto(
                                textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                  ),),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right : 10.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const GizlilikPolitikasiPage(), ));
                          },
                          child: SvgPicture.asset(
                            assetIleri,
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                
                    ),
                  ),
                ),
                const SizedBox(height: 24,),
                 InkWell(
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const AboneliklerHakkindaPage(), ));
                  },
                   child: Container(
                    width: screenWidth,
                    height: screenWidth * 0.15,
                    color: const Color(0xFF11131D).withOpacity(0.81),
                    child: ListTile(
                      
                      leading : Padding(
                        padding: const EdgeInsets.only(left : 10.0),
                        child: SvgPicture.asset(
                          assetAboneliklerInfo,
                          color: const Color(0xFFACC5DB),
                          width: 25,
                          height: 25,
                        ),
                      ),
                      title:  Text("Abonelikler Hakkında",style: GoogleFonts.roboto(
                                textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                  ),),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right : 10.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const AboneliklerHakkindaPage(),));

                          },
                          child: SvgPicture.asset(
                            assetIleri,
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                 
                    ),
                                 ),
                 ),
                 Divider(color: Colors.black.withOpacity(0.6),height: 1,thickness: 1,),
                InkWell(
                  onTap: () async {
                   
                   SharedPreferences prefs = await SharedPreferences.getInstance();
                 prefs.remove('csrftoken');
                 Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: const WebViewLogut(),
                        ),
                    (route) => false,
                  );
                  
                 
                  

                  },
                  child: Container(
                    width: screenWidth,
                    height: screenWidth * 0.15,
                    color: const Color(0xFF11131D).withOpacity(0.81),
                    child: ListTile(
                      
                      leading : Padding(
                        padding: const EdgeInsets.only(left : 10.0),
                        child: SvgPicture.asset(
                          "assets/images/svgicons/logoutlogo.svg",
                          color: const Color(0xFFACC5DB),
                          width: 25,
                          height: 25,
                        ),
                      ),
                      title:  Text("Çıkış Yap",style: GoogleFonts.roboto(
                                textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                  ),),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right : 10.0),
                        child: SvgPicture.asset(
                          "assets/images/svgicons/geriarrow.svg",
                          width: 15,
                          height: 15,
                        ),
                      ),
                
                    ),
                  ),
                ),
                 const SizedBox(height: 24,),



              ],
            ),
          ),
          

        ],
      ),
    );
  }
}