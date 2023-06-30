import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instero/Views/LoginPage/model/slide.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class SlideItem extends StatelessWidget {
  final int index;
  const SlideItem(this.index, {super.key});
  @override
  Widget build(BuildContext context) {
     var screenWidth = MediaQuery.of(context).size.width;
    return  Stack(
      children: [
        
        Container(
          width: screenWidth,
          height: Adaptive.h(65),
          decoration: BoxDecoration(
            
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
             image: DecorationImage(image: AssetImage(slideList[index].imageUrl),
                      fit: BoxFit.cover)
          ),
          child: Container(
            width: screenWidth,
            height: screenWidth * 1.4,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF1F2FFD).withOpacity(0.01),
                     const Color(0xFF1F2FFD).withOpacity(0.51),
                     const Color(0xFF3230FA).withOpacity(0.57),
                     const Color(0xFFA035E9).withOpacity(0.92),
                     const Color(0xFFB837E5),
      
      
                  ]
                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom : 50.0),
              child: Container(
                width: screenWidth * 0.9,
                height: screenWidth * 0.18,
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(slideList[index].text1,textAlign: TextAlign.center,style: GoogleFonts.roboto(
                                    textStyle : const TextStyle(fontSize: 25,color: Color(0xFFEFF2FF),fontWeight: FontWeight.w300,letterSpacing: 8,decoration: TextDecoration.none)
                                  ),),
                    Text(slideList[index].text2,textAlign: TextAlign.center,style: GoogleFonts.roboto(
                                    textStyle : const TextStyle(fontSize: 32,color: Color(0xFFEFF2FF),fontWeight: FontWeight.w900,letterSpacing: 1,decoration: TextDecoration.none)
                                  ),),

                    Padding(
                      padding: const EdgeInsets.only(left : 35.0,right: 35),
                      child: Text(slideList[index].text3,textAlign: TextAlign.center,style: GoogleFonts.roboto(
                                      textStyle : const TextStyle(fontSize: 14,color: Color(0xFFEFF2FF),fontWeight: FontWeight.w600,letterSpacing: 1,decoration: TextDecoration.none)
                                    ),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        
      ],
    );
   
  }

}