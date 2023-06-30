

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instero/Views/BottomBarScreens/IncelemePage/Analizler/EnBegenilenGonderilerinPage.dart';

import 'package:instero/Views/BottomBarScreens/IncelemePage/Analizler/EnCokYorAlanGonPage.dart';
import 'package:instero/Views/BottomBarScreens/IncelemePage/Analizler/EnEskiTakipcilerinPage.dart';



import 'package:page_transition/page_transition.dart';
import 'package:tab_container/tab_container.dart';

import 'Analizler/EnYeniTakipcilerinPage.dart';
import 'Analizler/GizliHayranlarınPage.dart';
import 'Analizler/TakibiBİrakanKullanicilarPage.dart';
import 'Analizler/TümKaybedilenTakipcilerinPage.dart';
import 'Etkileşimler/EnAzBegenenlerPage.dart';
import 'Etkileşimler/EnAzYorYapıpBegPage.dart';
import 'Etkileşimler/EnCokYorBegPage.dart';
import 'Etkileşimler/EnCokYorumYapanlar.dart';
import 'Etkileşimler/EnYakınArkadaslarimPage.dart';
import 'Etkileşimler/HicEtkilesimdeBulunmayanPage.dart';
import 'Etkileşimler/YakinZamandaFavKullPage.dart';

class Inceleme_Page extends StatefulWidget {
  const Inceleme_Page({Key? key}) : super(key: key);
  

  @override
  State<Inceleme_Page> createState() => _Inceleme_PageState();
}



class _Inceleme_PageState extends State<Inceleme_Page> {
  final String assetGeri = 'assets/images/svgicons/geriarrow.svg';
  final String assetForward = 'assets/images/svgicons/arrowforward.svg';
  



  
  



  
 
     
  @override
  Widget build(BuildContext context) {
final List<Row> IstatistiklerRows = <Row>[
    // İstatistikler
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("En Beğenilen Gönderilerin", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500),),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                      
                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]
    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("En Çok Yorum Alan Gönderilerin", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const EnCokYorumAlanGonderilerinPage()));

                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]
    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("En Eski Takipçilerin", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){},
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("En Yeni Takipçilerin", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){},
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("Tüm Kaybedilen Takipçilerin", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){},
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("Takibi Bırakan Kullanıcılar", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){},
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("Gizli Hayranların", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){},
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),

  ];




  // analizler list



  final List<Row> AnalizlerRows = <Row>[ 
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("En Beğenilen Gönderilerin", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const EnBegenilenGonderilerPage()));
                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]
    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("En Çok Yorum Alan Gönderilerin", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const EnCokYorumAlanGonderilerinPage()));
                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]
    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("En Eski Takipçilerin", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                       Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const EnEskiTakipcilerin()));
                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("En Yeni Takipçilerin", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                       Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const EnYeniTakipcilerin()));
                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("Tüm Kaybedilen Takipçilerin", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const TumKaybedilenTakipcilerinPage()));
                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("Takibi Bırakan Kullanıcılar", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const TakibiBirakanKullanicilarPage()));
                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("Gizli Hayranların", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                       Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const GizliHayranlarinPage()));
                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),

  ]; 




  // Etkilesimler




  final List<Row> EtkilesimlerRows = <Row>[
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("En Çok Yorum Yapanlar", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
              splashColor: const Color(0xFF830AE6),
              borderRadius: BorderRadius.circular(14),

              onTap: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const EnCokYorumPage()));
              },
                                    
              child: SvgPicture.asset(
              'assets/images/svgicons/arrowforward.svg',
              width: 20,
              height: 20,
              )
              ),
        ),
      ]
    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("En Çok Yorum Ve Beğeni Yapanlar", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const EnCokYorumveBegeniPage()));
                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]
    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("En Az Beğenenler", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const EnAzBegenenler()));
                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("En Az Yorum Yapıp Beğenenler", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const EnAzYorumYapipBegenenlerPage()));
                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("Hiç Etkileşimde Bulunmayanlar", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const HicEtkilesimdeBulunmayanPage()));
                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("En Yakın Arkadaşlarım", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                       Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const EnYakinArkadaslarimPage()));
                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),
    Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        
        const Padding(
          padding: EdgeInsets.only(left : 24.0),
          child: Text("Yakın Zamandaki Favori Kullanıcılarım", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(right : 24.0),
          child: InkWell(
                                    splashColor: const Color(0xFF830AE6),
                                    borderRadius: BorderRadius.circular(14),

                                    onTap: (){
                                       Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const YakinZamandaFavKullaniciPage()));
                                    },
                                    
                                    child: SvgPicture.asset(
                                      'assets/images/svgicons/arrowforward.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  ),
        ),
      ]

    ),

  ];
        var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack( 
      children:  [
       Padding(
         padding: const EdgeInsets.only( top : 0.0),
         child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF303454),
                Color(0xFF080C2C),
                
              ]
            )
          ),
          child: TabContainer(
             
            selectedTextStyle: Theme.of(context).textTheme.headline6!.copyWith(
              color: const Color.fromARGB(255, 226, 226, 226),
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            unselectedTextStyle: Theme.of(context).textTheme.headline6!.copyWith(
              color: const Color.fromARGB(255, 83, 86, 88),
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
            colors: const [
              Color.fromARGB(255, 8, 18, 39),
              Color.fromARGB(255, 8, 18, 39),
              Color.fromARGB(255, 8, 18, 39),
            ],
            tabs: const [
              'İstatistikler',
              'Analizler',
              'Etkileşimler',
            ],
            
            children: [
              Padding(
                padding: const EdgeInsets.only(top : 30.0),
                child: ListView.builder(itemBuilder: (context, index) {
                  
                  return Padding(
                    padding: const EdgeInsets.only(left : 16.0, right: 16,top: 4,bottom: 13),
                    child: Container(
                      width: screenWidth * 0.3,
                      height: screenWidth * 0.15,
                      decoration: BoxDecoration(
                        color: const Color(0xFF303454).withOpacity(0.97),
                        borderRadius: const BorderRadius.all(Radius.circular(8))
                      ),
                      child: IstatistiklerRows[index],
                    ),
                  );
                 },
                 itemCount: 7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top : 30.0),
                child: ListView.builder(itemBuilder: (context, index) {
                  
                  return Padding(
                    padding: const EdgeInsets.only(left : 16.0, right: 16,top: 4,bottom: 13),
                    child: Container(
                      width: screenWidth * 0.3,
                      height: screenWidth * 0.15,
                      decoration: BoxDecoration(
                        color: const Color(0xFF303454).withOpacity(0.97),
                        borderRadius: const BorderRadius.all(Radius.circular(8))
                      ),
                      child: AnalizlerRows[index],
                      
                    ),
                  );
                 },
                 itemCount: 7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top : 30.0),
                child: ListView.builder(itemBuilder: (context, index) {
                    
                    return Padding(
                      padding: const EdgeInsets.only(left : 16.0, right: 16,top: 4,bottom: 13),
                      child: Container(
                        width: screenWidth * 0.3,
                        height: screenWidth * 0.15,
                        decoration: BoxDecoration(
                          color: const Color(0xFF303454).withOpacity(0.97),
                          borderRadius: const BorderRadius.all(Radius.circular(8))
                        ),
                        child: EtkilesimlerRows[index],
                      ),
                    );
                   },
                   itemCount: 7,
                  ),
              ),
            ],
          ),
      ),
       ),
       // başlık
      /*  
      Container(
                  width: screenWidth,
                  height: screenHeight * 0.08,
                  color: Color(0xFF0C0F19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   
                    Row(
                      children: [
                        
                        
                        Text("DETAYLI İNCELEME",style: GoogleFonts.roboto(
                          textStyle : TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w900,letterSpacing: 5.0)
                            ),),

                      ],
                    ),

                  ],
                  ),
                  
                ),,
                */
      ]
    )
     
    ); 
    
  }
}