import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instero/Views/prototippages/prototipmodel.dart/prototipslide.dart';




class SlideItem extends StatelessWidget {
  final int index;
  const SlideItem(this.index);
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return  Column(
      children: <Widget> [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.only(top:16.0,bottom: 8),
              child: Container(
                width: screenWidth * 0.85,
                
                height: screenHeight * 0.24,
                decoration: BoxDecoration(
                    
                    image: DecorationImage(image: AssetImage(slideList[index].imageUrl),
                        fit: BoxFit.fill)

                ),
              ),
            ),
            
            Column(
              children: [
                Text(
                  slideList[index].title,
                  style: GoogleFonts.poppins(
                          textStyle : const TextStyle(fontSize: 30,color: Color(0xFFEEEFF1),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                            ),
                ),
                Text(
                  slideList[index].titleiki,
                  style: GoogleFonts.poppins(
                          textStyle : const TextStyle(fontSize: 30,color: Color(0xFFEEEFF1),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                            ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left : 8.0 , right: 8),
              child: Text(
                slideList[index].description,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                            textStyle : const TextStyle(fontSize: 15,color: Color(0xFFEEEFF1),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                              ),
              ),
            )
          ],
        )
      ],
    );
    
  }

}