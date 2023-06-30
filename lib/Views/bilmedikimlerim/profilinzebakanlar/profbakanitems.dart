import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instero/Views/bilmedikimlerim/profilinzebakanlar/profikinizebakanlaritems.dart';


class ProfItems extends StatelessWidget {
  
  final int index;
  const ProfItems(this.index);
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: screenWidth,
                            height: screenHeight * 0.1,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              color: Color(0xFF0E1324)
                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(ProfBakanList[index].number),
                                CircleAvatar(
                                  backgroundImage: AssetImage(ProfBakanList[index].imageUrl),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(ProfBakanList[index].title,style: GoogleFonts.roboto(
                                            textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                              ),),
                                    Text(ProfBakanList[index].titleiki,style: GoogleFonts.roboto(
                                            textStyle : const TextStyle(fontSize: 12,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                              ),),
                                  ],
                                ),
                                SvgPicture.asset(
                                  ProfBakanList[index].imageUrliki
                                ),
                                 InkWell(
                                        onTap: (){
                                          
                                        },
                                        child: Container(
                                          width: screenWidth * 0.26,
                                          height: screenHeight * 0.045,
                                          
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(24)),
                                            color: const Color(0xFF0C0F19),
                                            border: Border.all(color: const Color(0xFF954191)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/svgicons/gozicon.svg'
                                              ),
                                              Text("Görüntüle",style: GoogleFonts.roboto(
                                            textStyle : const TextStyle(fontSize: 13,color: Color(0xFFBAC5FF),fontWeight: FontWeight.w500,letterSpacing: 1.0)
                                              ),)
                                            ],
                                          ),
                                        ),
                                      )
                              ],
                            )
                          ),
                        );
  }
}