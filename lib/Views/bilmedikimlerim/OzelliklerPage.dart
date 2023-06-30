import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:instero/Views/prototippages/POPupEr%C4%B1s%C4%B1m.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class OzelliklerPage extends StatefulWidget {
  const OzelliklerPage({super.key});

  @override
  State<OzelliklerPage> createState() => _OzelliklerPageState();
}

class _OzelliklerPageState extends State<OzelliklerPage> {
  
  
 
  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
   
  }

  String profilePic = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/A_black_image.jpg/1200px-A_black_image.jpg?20201103073518";
  String name = "yook";
  String username = "yok";

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();

      SharedPreferences.getInstance().then((local) {

     
       setState(() {
          profilePic = local.getString('profilePic') ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/A_black_image.jpg/1200px-A_black_image.jpg?20201103073518";
          name = local.getString('fullName') ?? "";
          username = local.getString('username') ?? "";
       
       });
         
    
      

    });
    
    
  }
  ScrollController scrollController = ScrollController();
    final String assetGeri = 'assets/images/svgicons/geriarrow.svg';
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: screenWidth,
              height: screenHeight * 1.1,
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
              child: Column(
                children: [
                  
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.08,
                    
                    child: Container(
                          width: Adaptive.w(100),
                    height: Adaptive.h(7),
                    
                          child: Padding(
                            padding: const EdgeInsets.only(top :10.0,bottom: 10),
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            
                            Container(
                             
                              child: Text("ÖZELLİKLER",style: GoogleFonts.roboto(
                                    textStyle : const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: 2.0)
                              ),),
                            )
                       
                    
                      ],
                      ),
                          ),
                        ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    padding: const EdgeInsets.only(left : 24,right:24),
                    width: screenWidth * 0.63,
                    height: screenHeight * 0.15,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(44)),
                      color: Color(0xFF0C0F19),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                     
                                                    Container(
                              width: Adaptive.w(15),
                              height: Adaptive.w(15),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(profilePic),
                                  fit: BoxFit.cover
                              ),
                              )
                              
                            ),
                            
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                  
                            Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.grey,
                              loop: 2,
                              child: Text(name,style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                ),),
                            ),
                            Text("@$username",style: GoogleFonts.roboto(
                            textStyle : const TextStyle(fontSize: 13,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                              ),)
                          ],
                        ),
                      
                      ],
                    ),
                  ),
                 
                  const SizedBox(height: 36,),
                  InkWell(
                    onTap: (){
                      print("object");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const  ProyaGecPageSurekli()));
                      
                    },
                    child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.11,
                      decoration: const BoxDecoration(
                        
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFFF77D1).withOpacity(0.16),
                                    spreadRadius: 7,
                                    blurRadius: 8,
                                    offset: const Offset(-3, 1), // changes position of shadow
                                  ),
                                ],
                               gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFD0098),
                                  Color(0xFFA22EFE),
                                ]
                               ),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
                              ),
                              child: Center(
                                child: Shimmer.fromColors(
                                  baseColor:Colors.purple ,
                                  highlightColor: Colors.white,
                                  
                                  child: SvgPicture.asset(
                                    'assets/images/svgicons/OzelliklerIconbir.svg',
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex : 8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF0C0F19),
                                border: Border.all(color: const Color(0xFF526289)),
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Gizli Hikayeleri Görüntüleyin",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 13,color: Color(0xFF8E9AC2),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                ),),
                                const SizedBox(height: 8,),
                                      Text("Kilitli Profillerin Hikayelerini Görün",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 11,color: Color(0xFF5E6A92),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                ),)
                                    ],   
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/svgicons/ileriarrow.svg',
                                    width: 15,
                                    height: 15,
                                    color: const Color(0xFF8E9AC2),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  InkWell( // ! ikinci 
                    onTap: (){
                      
                    },
                    child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.11,
                      decoration: const BoxDecoration(
                        
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF638FFF).withOpacity(0.16),
                                    spreadRadius: 7,
                                    blurRadius: 8,
                                    offset: const Offset(-3, 1), // changes position of shadow
                                  ),
                                ],
                               gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF69D9D9),
                                  Color(0xFF0044F2),
                                ]
                               ),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
                              ),
                              child: Center(
                                child: Shimmer.fromColors(
                                  baseColor: Colors.blue,
                                  highlightColor:Colors.white ,
                                  child: SvgPicture.asset(
                                    'assets/images/svgicons/OzelliklerIconiki.svg',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // ! ozzellikler deneme
                          
                          Expanded(
                            flex : 8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF0C0F19),
                                border: Border.all(color: const Color(0xFF526289)),
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Profilinize Bakanları Görün",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 13,color: Color(0xFF8E9AC2),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                ),),
                                const SizedBox(height: 8,),
                                      Text("Profilinizi Ziyaret Edenleri Görün",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 11,color: Color(0xFF5E6A92),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                ),)
                                    ],
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/svgicons/ileriarrow.svg',
                                    width: 15,
                                    height: 15,
                                    color: const Color(0xFF8E9AC2),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  InkWell( // ! üçüncü
                    onTap: (){},
                    child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.11,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFFED02B).withOpacity(0.16),
                                    spreadRadius: 7,
                                    blurRadius: 8,
                                    offset: const Offset(-3, 1), // changes position of shadow
                                  ),
                                ],
                               gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFDBB00),
                                  Color(0xFFFED22E),
                                ]
                               ),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
                              ),
                              child: Center(
                                child: Shimmer.fromColors(
                                  baseColor:Colors.yellow ,
                                  highlightColor: Colors.white,
                                  child: SvgPicture.asset(
                                    'assets/images/svgicons/OzelliklerIconuc.svg',
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex : 8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF0C0F19),
                                border: Border.all(color: const Color(0xFF526289)),
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Profili Gizli Görüntüleyin",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 13,color: Color(0xFF8E9AC2),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                ),),
                                const SizedBox(height: 8,),
                                      Text("Yakında...",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 11,color: Color(0xFF5E6A92),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                ),)
                                    ],
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/svgicons/ileriarrow.svg',
                                    width: 15,
                                    height: 15,
                                    color: const Color(0xFF8E9AC2),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  InkWell( // ! dört
                    onTap: (){},
                    child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.11,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFC0FFFB).withOpacity(0.16),
                                    spreadRadius: 7,
                                    blurRadius: 8,
                                    offset: const Offset(-3, 1), // changes position of shadow
                                  ),
                                ],
                               gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFBEFF33),
                                  Color(0xFF1ABD00),
                                ]
                               ),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
                              ),
                              child: Center(
                                child: Shimmer.fromColors(
                                  baseColor: Colors.green,
                                  highlightColor:Colors.white ,
                                  child: SvgPicture.asset(
                                    'assets/images/svgicons/OzelliklerIcondort.svg',
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex : 8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF0C0F19),
                                border: Border.all(color: const Color(0xFF526289)),
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Gizli Hayranları Gör",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 13,color: Color(0xFF8E9AC2),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                ),),
                                const SizedBox(height: 8,),
                                      Text("Seni Gizlice İzleyenleri Görüntüle",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 11,color: Color(0xFF5E6A92),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                ),)
                                    ],
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/svgicons/ileriarrow.svg',
                                    width: 15,
                                    height: 15,
                                    color: const Color(0xFF8E9AC2),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  InkWell( // ! beş
                    onTap: (){},
                    child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.11,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFFCA2E6).withOpacity(0.16),
                                    spreadRadius: 7,
                                    blurRadius: 8,
                                    offset: const Offset(-3, 1), // changes position of shadow
                                  ),
                                ],
                               gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFE43E3),
                                  Color(0xFFFCACE5),
                                ]
                               ),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
                              ),
                              child: Center(
                                child: Shimmer.fromColors(
                                  baseColor: Colors.pink,
                                  highlightColor: Colors.white,
                                  child: SvgPicture.asset(
                                    'assets/images/svgicons/OzelliklerIconbes.svg',
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex : 8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF0C0F19),
                                border: Border.all(color: const Color(0xFF526289)),
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Reklamsız SocailX Deneyimi",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 13,color: Color(0xFF8E9AC2),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                ),),
                                const SizedBox(height: 8,),
                                      Text("Reklamları Kaldırın",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 11,color: Color(0xFF5E6A92),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                ),)
                                    ],
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/svgicons/ileriarrow.svg',
                                    width: 15,
                                    height: 15,
                                    color: const Color(0xFF8E9AC2),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )

                  
                  
                ],
              ),
        ),
      ),
    );
  }
}
