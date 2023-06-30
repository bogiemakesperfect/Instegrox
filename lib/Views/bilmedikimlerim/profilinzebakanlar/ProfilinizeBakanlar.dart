
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instero/Views/bilmedikimlerim/profilinzebakanlar/profbakanitems.dart';

import 'profikinizebakanlaritems.dart';

class ProfilinizeBakanlar extends StatefulWidget {
  const ProfilinizeBakanlar({super.key});

  @override
  State<ProfilinizeBakanlar> createState() => _ProfilinizeBakanlarState();
}

class _ProfilinizeBakanlarState extends State<ProfilinizeBakanlar> {
  
  final String assetGeri = 'assets/images/svgicons/geriarrow.svg';
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
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
                      
                      child: Row(
                        children: [
                          const SizedBox(width: 30,),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              assetGeri,
                              width: 10,
                              height: 17,
                              color: const Color(0xFFA1AEC2),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text("PROFİLİNİZE BAKANLAR",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 17,color: Color(0xFFCED8FF),fontWeight: FontWeight.w800,letterSpacing: 5.0)
                                ),)
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.only(left : 11,right: 11,top: 24,bottom: 24),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(11),
                        
                      ),
                      color: Color(0xFF080C23),
                    ),
                    child: Column(
                      children: [
                        Text("Profilini görüntüleyen bir kullanıcının kilidini ücretsiz aç",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.w300,letterSpacing: 1.0)
                                ),),
                                const SizedBox(height: 8,),
                        Text("Profilini görüntüleyen kullanıcının kilidini ücretsiz açmak için hemen reklamı izle",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 13,color: Color(0xFF949DDC),fontWeight: FontWeight.w400,letterSpacing: 1.0)
                                ),),
                                const SizedBox(height: 16,),
                        InkWell(
                          onTap: (){
      
                          },
                          child: Container(
                            width: screenWidth * 0.36,
                            height: screenHeight * 0.052,
                            decoration: BoxDecoration(
                              borderRadius : const BorderRadius.all(Radius.circular(48)),
                              color: const Color(0xFF1E5C51),
                              border: Border.all(color: const Color(0xFF44A989))
                            ),
                            child: Row(
                              mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Reklamı İzle",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 14,color: Color(0xFF41FFB9),fontWeight: FontWeight.w400,letterSpacing: 1.0)
                                ),),
                                SvgPicture.asset(
                                  'assets/images/svgicons/playbutton.svg',
                                )
                              ],
                            ),
                          ),
                        )
                      ],
      
                    ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: screenWidth,
                        height: screenHeight,
                        child: ListView.builder(
                        itemBuilder: (ctx, i) => ProfItems(i),
                        itemCount: ProfBakanList.length,
                        
                        ),
                      ),
                    )
      
                  ],
                ),
          ),
      )
        );
  }
}