



import 'package:instero/Services/rating_service.dart';
import 'package:instero/Views/BottomBarScreens/Ayarlar/setttings_page_two.dart';

import 'package:instero/Views/BottomBarScreens/KullaniciArama/KullaniciAramaPage.dart';
import 'package:instero/Views/BottomBarScreens/NewIstatistiklerPages/NewIstatistik.dart';
import 'package:instero/Views/bilmedikimlerim/OzelliklerPage.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import 'ProfileScreen/Profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final String assetIkinci = 'assets/images/svgicons/bottombarikincilogo.svg';
  final String assetSpy = 'assets/images/svgicons/spy.svg';
  final String assetArama = 'assets/images/svgicons/aramaicon.svg';
  final String assetAyar = 'assets/images/svgicons/ayaricon.svg';
  final String assetCizgi = 'assets/images/svgicons/uccizgi.svg';
  int _selectedIndex = 0;
  
  static final List<Widget>_widgetOptions = <Widget>[
   const ProfileScreen(), // floataction buton orta tuş 0.
   Settings_Page_two(), // ayarlar tuşu 1. tuş
   const NewIstatistik(),//Inceleme_Page(),  // Inceleme sayfası 2.tuş
   const OzelliklerPage(), //OzelliklerPage(),//SpyPage(),  // ! bakılacak  Gizli hesapları görme 3 . tuş
   const KullaniciArama() // Kullanıcı arama 4. tuş
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
    
    
  }

  int _counter = 0;
      final RatingService _ratingService = RatingService();
      void _incrementCounter(context) async {
        setState(() {
          _counter++;
        });
   
        if(_counter == 5){
          _ratingService.showRating();
        }
      }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*
    AdvancedInAppReview()
      .setMinDaysBeforeRemind(1)
      .setMinDaysAfterInstall(1)
      .setMinLaunchTimes(1)
      .monitor();
      */
    //_incrementCounter(context);
    /*
    Timer(Duration(seconds: 3), () {
      _ratingService.isSecondTimeOpen().then((secondOpen) {
        if(secondOpen){
          _ratingService.showRating();
        }
      });
    });
    */
  }
  @override
  Widget build(BuildContext context) {
         var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(

      child: Scaffold(
        body: Container(
          height : screenHeight * 2,
          color: const Color(0xFF080E1A),
          child: Center(
            child: _widgetOptions[_selectedIndex],
          ),
        ),
    
       
      
      extendBody: true,
        // bottom appbar
        floatingActionButton : Container(
          decoration : BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Color(0xFFFA2A9F),
                Color(0xFF1F2FFD),
                Color(0xFF2CBAFF),            
                ],
                stops: [
                  0.1,
                  0.6,
                  0.9,
                ]
              ),
              boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2CBAFF).withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(1, 1), // changes position of shadow
                  ),
        
          ],
          ),
          width: screenWidth * 0.143,
          height: screenHeight * 0.143,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {
              _onItemTapped(0);
            },
            child: SvgPicture.asset(
              assetCizgi,
              height: screenWidth * 0.05,
              color: Colors.white,
            ),
            
          ),
        ),
        bottomNavigationBar: 
        

        
        Container(
          
        height: screenWidth * 0.182,
        
        
        
        child: bottomNavigationBar),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    
        //
      ),
    );
  }

  Widget get bottomNavigationBar {

    return ClipRRect(
    
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: BottomAppBar(
        
        color: Color.fromARGB(255, 23, 26, 54),
        notchMargin: 13,
        shape: const CircularNotchedRectangle(),
        elevation: 0,
        child: Container(
          width: Adaptive.w(100),
          
          child: bottomAppBarItems(
          )
          ),
      ),
    );

  }

  Row bottomAppBarItems() {
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            _onItemTapped(1);

          },
          
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 70,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(23.0),
              child: SvgPicture.asset(
                assetAyar,
                color:const Color(0xFFBAC5FF)
              ),
            ),
          ),
          
        ),
        InkWell(
           onTap: () {
              _onItemTapped(2);
            },
          borderRadius: BorderRadius.circular(50),
          child: Container(
            
            width: 70,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(23.0),
              child: SvgPicture.asset(
                assetIkinci,
                color: const Color(0xFFBAC5FF),
              ),
              
            ),
          ),
          
        ),
        const SizedBox(
          width: 50,
        ),
        InkWell(
           onTap: () {
            _onItemTapped(3);
          },
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 70,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(23.0),
              child: SvgPicture.asset(
                assetSpy,
                color: const Color(0xFFBAC5FF),
              ),
            ),
          ),
          
        ),
        InkWell(
           onTap: () {
            _onItemTapped(4);
          },
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 70,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(23.0),
              child: SvgPicture.asset(
                assetArama,
                color: const Color(0xFFBAC5FF),
              ),
            ),
          ),
          
        ),
      ],
    );
  }
}
