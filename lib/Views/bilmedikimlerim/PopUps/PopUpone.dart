import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PopUpOne extends StatefulWidget {
  const PopUpOne({super.key});

  @override
  State<PopUpOne> createState() => _PopUpOneState();
}

class _PopUpOneState extends State<PopUpOne> {
// from 0-10
// from 0-10
// from 0-1.0
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children : [
        Blur(
          blur: 20,
          child: Container(
            width: screenWidth,
            height: screenHeight,
            child:  Image.network(
              'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
        margin: const EdgeInsets.only(left: 36,right: 36,top: 165,bottom: 165),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          border: Border.all(color: Colors.white.withOpacity(0.7)),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.20),
              Colors.white.withOpacity(0.35),
            ]
          )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/svgicons/infoicon.svg',
                color: Colors.white,
              ),
              Text("Hikayeyi Geçmek İçin",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w900,letterSpacing: 1.0)
                                ),),
                                const SizedBox(height: 8,),
              
              Text("Pro'ya geç veya reklamı izle",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 17,color: Color(0xFFE4EFFF),fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                ),),
                                const SizedBox(height: 8,),
              Text("İnsanların onların hikayelerine  \n baktığını bilmesinden rahatsız \n mısın ? Artık hikayeleri gizli \n       olarak izleyebilirsin.",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 17,color: Color(0xFFE4EFFF),fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                ),),
                                const SizedBox(height: 24,),
              Container(
                padding: const EdgeInsets.only(left: 60,right: 60,top: 20,bottom: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 244, 137, 250),
                      Color.fromARGB(255, 110, 119, 255),
                    ]
                  )
                ),
                child: Column(
                  children: [
                    Text("Pro'ya Geç",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                ),),
                    Text("Hikayeleri Sınırsız İzle",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                ),),
                  ],
                ),
              ),
              Text("veya",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 14,color: Color(0xFFE4EFFF),fontWeight: FontWeight.w400,letterSpacing: 1.0)
                                ),),
              Text("1 reklam izleyerek bu  hikayeyi görüntüle.",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 14,color: Color(0xFFE4EFFF),fontWeight: FontWeight.w400,letterSpacing: 1.0)
                                ),),
                               
              Container(
                            width: screenWidth * 0.36,
                            height: screenHeight * 0.052,
                            decoration: BoxDecoration(
                              borderRadius : const BorderRadius.all(Radius.circular(48)),
                              color: Colors.transparent,
                              border: Border.all(color: Colors.white)
                            ),
                            child: Row(
                              mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Reklamı İzle",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400,letterSpacing: 1.0)
                                ),),
                                SvgPicture.asset(
                                  'assets/images/svgicons/playbutton.svg',
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
            ],
          ),
        ),
      ]
    );
    
  }
}
