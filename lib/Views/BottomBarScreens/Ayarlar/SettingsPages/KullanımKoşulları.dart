import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KullanimKosullariPage extends StatefulWidget {
  const KullanimKosullariPage({super.key});

  @override
  State<KullanimKosullariPage> createState() => _KullanimKosullariPageState();
}

class _KullanimKosullariPageState extends State<KullanimKosullariPage> {
  final String assetGeri = 'assets/images/svgicons/geriarrow.svg';
  
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: screenWidth,
            height: Adaptive.w(260),
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
             
//yeni versiyon
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
                             
                              child: Text("Kullanım Koşulları",style: GoogleFonts.roboto(
                                    textStyle : const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
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
                      Padding(
                  padding: const EdgeInsets.only(left: 24,right: 24,top: 24,bottom: 24),
                  child:Container(
                        width: Adaptive.w(90),
                        height: Adaptive.w(50),
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
                Expanded(
                  child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.65,
                  padding: const EdgeInsets.only(left: 24,right: 24),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF292D45),
                        Color(0xFF292D45),
                      ]
                    )
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection : Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 24,),
                        Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                            'assets/images/svgicons/kullanımkosulları.svg',
                            color: const Color(0xFFACC5DB),
                            width: 21,
                            height: 21,
                          ),
                          const SizedBox(width: 8,),
                          Text("Kullanım Koşulları",style: GoogleFonts.roboto(
                          textStyle : const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                            ),)
                  ],
                ),
                const SizedBox(height: 24,),
                        const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                        
                      ],
                    ),
                  ),
                ),
                ),
                
            ],
          ),
        ),
      ),
    );
  }
}