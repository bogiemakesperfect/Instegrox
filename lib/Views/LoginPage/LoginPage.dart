import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:instero/Views/LoginPage/webviewlogin.dart';
import 'package:instero/revenue/progec_sayda.dart';


import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/slide.dart';

import 'dart:async';

import '../LoginPage/model/slide_dots.dart';
import '../LoginPage/model/slide_item.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPage createState() => _LoginPage();
}


class _LoginPage extends State<LoginPage> {
  int _currentPage = 0;



  final PageController _pageController = PageController(
    initialPage: 0
  );
  void checklog(){
    SharedPreferences.getInstance().then((prefs) {
      
        prefs.clear();
      
    });
  }

  @override
  void initState() {
    super.initState();
   
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {

      if (_currentPage < 2) {
        _currentPage++;
      }
      else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    });

  }
 


  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    //_pageController.dispose();
  }

  _onPageChanged(int i) {
    setState(() {
      _currentPage = i;
    });
  }


  @override
  Widget build(BuildContext context) {
        var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
       
        color: const Color(0xFF041D2F),
        child: Column(
          children:<Widget> [
            
            Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,

              children: <Widget> [
                PageView.builder(
                  itemBuilder: (ctx, i) =>  SlideItem(i),
                  itemCount: slideList.length,
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: _onPageChanged,

                ),
               
              ],
            ),
            ),
            Stack(
                  children: <Widget> [
                    Container(
                      width: screenWidth ,
                      height: screenHeight * 0.06,
                     
                      margin: const EdgeInsets.only(bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget> [
                          for (int i = 0 ; i < slideList.length; i++)
                            if (i == _currentPage)
                              SlideDots(true)
                          else
                            SlideDots(false)

                        ],
                      ),
                    ),
                  ],
                ),

                
                      
                    

            Container(
                  width: screenWidth,
                  height: Adaptive.h(30),
                 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    
                    children: [ 
                      // TODO Çıkarılacak
                      
                      SizedBox(height: 10,),
                      Container(
                        width: Adaptive.w(85),
                        height: Adaptive.h(9),
                        decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFF041D2F), // Color(0xFF041D2F)
                                        blurRadius: 10.0, // soften the shadow
                                        spreadRadius: 3.0, //extend the shadow
                                        offset: Offset(
                                          1.0, // Move to right 5  horizontally
                                          5.0,
                                          
                                         // Move to bottom 5 Vertically
                                        ),
                                      )
                                    ],
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFF213149),
                                      Color(0xFF2F476A),
                                      
                                    ]
                                  )
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const InstagramLoginPage(),)); 
                                  },
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/svgicons/instagramlogoiki.svg',
                                          width: screenWidth * 0.1,
                                          height: screenWidth * 0.1,
                                        
                                        ),
                                        const SizedBox(width: 16,),
                                        Text("Instagram ",style: GoogleFonts.roboto(
                                              textStyle : const TextStyle(fontSize: 17,color: Color(0xFFEFF2FF),fontWeight: FontWeight.w900,letterSpacing: 1,decoration: TextDecoration.none)
                                            ),),
                                        Text("ile Giriş yap",style: GoogleFonts.roboto(
                                              textStyle : const TextStyle(fontSize: 17,color: Color(0xFFB4BAD2),fontWeight: FontWeight.w700,letterSpacing: 1,decoration: TextDecoration.none)
                                            ),)
                                      ],
                                    ),
                                ),
                      ),
                      Container(
                        width: Adaptive.w(85),
                        height: Adaptive.h(15),
                       
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                          children: [
                            Text("  Hesabın bizimle güvende, giriş işlemlerinde şifren gerekmiyor. Hiç bir bilgin bu uygulama üzerinde kayıt edilmiyor ve asla kayıt edilmeyecektir.Bu uygulamaya giriş yaparak Kullanım Şartları’nı ve Gizlilik Politikası’nı Kabul etmiş olursunuz.",style: GoogleFonts.roboto(
                                      textStyle : const TextStyle(fontSize: 12,color: Color(0xFFB4BAD2),fontWeight: FontWeight.w500,letterSpacing: 1,decoration: TextDecoration.none)
                                    ),),
                            
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
                
           
          ],
        ),
      )

    );

    
  }
}