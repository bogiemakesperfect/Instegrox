

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Profileone extends StatefulWidget {
  const Profileone({super.key});

  @override
  State<Profileone> createState() => _ProfileoneState();
}

class _ProfileoneState extends State<Profileone> {
  final String assetGeri = 'assets/images/svgicons/geriarrow.svg';
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children : [
            Container(
              width : screenWidth,
              height: screenHeight,
              color: const Color(0xFF302C44),
            ),
            ListView(

            children: [
              Column(
                children: [
                  Container(
                      width: screenWidth,
                      height: screenHeight * 0.08,
                      color: Colors.transparent,
                      child: Row(
                        
                        children: [
                        Padding(
                          padding: const EdgeInsets.only(left : 30.0),
                          child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            assetGeri,
                            width: 10,
                            height: 17,
                            color: const Color(0xFFA1AEC2),
                          ),
                      ),
                        ),
                      const SizedBox(width: 110,),
                        Text("PROFİL",style: GoogleFonts.roboto(
                          textStyle : const TextStyle(fontSize: 17,color: Color(0xFFCED8FF),fontWeight: FontWeight.w700,letterSpacing: 3.0)
                            ),)
        
                      ],
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.2,
                      color: const Color(0xFF302C44),
                      child: Padding(
                        padding: const EdgeInsets.only(top : 24.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 78,
                                  height: 78,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color:const Color(0xFFAAB6DE)),
                                    image: const DecorationImage(image: AssetImage('assets/images/profilepictures/profilepic.png'),fit: BoxFit.fill),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("123",style: GoogleFonts.roboto(
                                          textStyle : const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                            ),),
                                    Text("gönderi",style: GoogleFonts.roboto(
                                          textStyle : const TextStyle(fontSize: 17,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                            ),),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("82222",style: GoogleFonts.roboto(
                                          textStyle : const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                            ),),
                                    Text("takipçi",style: GoogleFonts.roboto(
                                          textStyle : const TextStyle(fontSize: 17,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                            ),),
                                    
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("9566",style: GoogleFonts.roboto(
                                          textStyle : const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                            ),),
                                    Text("takip",style: GoogleFonts.roboto(
                                          textStyle : const TextStyle(fontSize: 17,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w600,letterSpacing: 1.0)
                                            ),),
                                    
                                  ],
                                ),
                                
                              ],
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Sıla Salda",style: GoogleFonts.roboto(
                                          textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                            ),),
                                    Text("@binewore",style: GoogleFonts.roboto(
                                          textStyle : const TextStyle(fontSize: 11,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w800,letterSpacing: 1.0)
                                            ),),
                                  ],
                                ),
                                const SizedBox(width: 13,),
                                InkWell(
                                  onTap: (){},
                                  child: Container(
                                    width: screenWidth * 0.29,
                                    height: screenHeight * 0.042,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF0C0F19),
                                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(color: const Color(0xFF2CBAFF))
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                      SvgPicture.asset(
                                        'assets/images/svgicons/takipetlogo.svg'
                                      ),
                                      Text("Takip Et",style: GoogleFonts.roboto(
                                          textStyle : const TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w400,letterSpacing: 1.0)
                                            ),),
                                    ]),
                                  ),
                                ),
                                 InkWell(
                                  onTap: (){},
                                   child: Container(
                                    width: screenWidth * 0.29,
                                    height: screenHeight * 0.042,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF0C0F19),
                                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(color: const Color(0xFF954191))
                                    ),
                                    child: Center(
                                      child: Text("Merlin'le",style: GoogleFonts.roboto(
                                            textStyle : const TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w400,letterSpacing: 1.0)
                                              ),),
                                    ),
                                                                 ),
                                 ),
                              ],
                            )
                          ],
                        ),
                      ),
                      
                    ),
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.14,
                      color: const Color(0xFF201434),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Öne Çıkanlar",style: GoogleFonts.roboto(
                                            textStyle : const TextStyle(fontSize: 15,color: Color(0xFFCED8FF),fontWeight: FontWeight.w800,letterSpacing: 1.0)
                                              ),),
                                              const SizedBox(height: 9,),
                          Container(
                            
                            width: screenWidth,
                            height: screenHeight * 0.09,
                            
                            child: ListView.builder(itemCount: 15,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left :8.0,right: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 4,),
                                    Text("Açıklama",style: GoogleFonts.roboto(
                                              textStyle : const TextStyle(fontSize: 11,color: Color(0xFFCED8FF),fontWeight: FontWeight.w700,letterSpacing: 1.0)
                                                ),)

                                  ],
                                ),
                              );
                            },),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      height: screenHeight * 4,
                      color: const Color(0xFF302C44),
                      child:GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      children: [
                        Image.network('https://picsum.photos/250?image=1'),
                        Image.network('https://picsum.photos/250?image=2'),
                        Image.network('https://picsum.photos/250?image=3'),
                        Image.network('https://picsum.photos/250?image=4'),
                        Image.network('https://picsum.photos/250?image=4'),
                        Image.network('https://picsum.photos/250?image=4'),
                        Image.network('https://picsum.photos/250?image=6'),
                        Image.network('https://picsum.photos/250?image=4'),
                        Image.network('https://picsum.photos/250?image=4'),
                        Image.network('https://picsum.photos/250?image=4'),
                        Image.network('https://picsum.photos/250?image=4'),
                        Image.network('https://picsum.photos/250?image=4'),
                        Image.network('https://picsum.photos/250?image=4'),
                        Image.network('https://picsum.photos/250?image=4'),
                        Image.network('https://picsum.photos/250?image=4'),
                       


                      ],
                    )

                      )
                    ,
                    
                ],
              ),
              
            ],
          ),
          ]
        ),
      )
    );
  }
}
ListView hikayeler() {
    return ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                     Padding(
                    padding: const EdgeInsets.only(left :16.0,right: 16,top: 3,bottom: 5),
                    child: Column(
                      children: [
                        Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF500B1),
                            Color(0xFFE5BA78),
                            Color(0xFFB837E5),
                            Color(0xFF3768E5),
                          ]
                        ),
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                        
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF080E1A),
                            
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text("Açıklama",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 13,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w500,letterSpacing: .0))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left :10.0,right: 10,top: 3,bottom: 5),
                    child: Column(
                      children: [
                        Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF500B1),
                            Color(0xFFE5BA78),
                            Color(0xFFB837E5),
                            Color(0xFF3768E5),
                          ]
                        ),
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                        
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF080E1A),
                            
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text("binewore",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 13,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w500,letterSpacing: .0))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left :10.0,right: 10,top: 3,bottom: 5),
                    child: Column(
                      children: [
                        Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF500B1),
                            Color(0xFFE5BA78),
                            Color(0xFFB837E5),
                            Color(0xFF3768E5),
                          ]
                        ),
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                        
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF080E1A),
                            
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text("binewore",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 13,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w500,letterSpacing: .0))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left :10.0,right: 10,top: 3,bottom: 5),
                    child: Column(
                      children: [
                        Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF500B1),
                            Color(0xFFE5BA78),
                            Color(0xFFB837E5),
                            Color(0xFF3768E5),
                          ]
                        ),
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                        
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF080E1A),
                            
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text("binewore",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 13,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w500,letterSpacing: .0))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left :10.0,right: 10,top: 3,bottom: 5),
                    child: Column(
                      children: [
                        Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF500B1),
                            Color(0xFFE5BA78),
                            Color(0xFFB837E5),
                            Color(0xFF3768E5),
                          ]
                        ),
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                        
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF080E1A),
                            
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text("binewore",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 13,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w500,letterSpacing: .0))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left :10.0,right: 10,top: 3,bottom: 5),
                    child: Column(
                      children: [
                        Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF500B1),
                            Color(0xFFE5BA78),
                            Color(0xFFB837E5),
                            Color(0xFF3768E5),
                          ]
                        ),
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                        
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF080E1A),
                            
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text("binewore",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 13,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w500,letterSpacing: .0))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left :10.0,right: 16,top: 3,bottom: 5),
                    child: Column(
                      children: [
                        Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF500B1),
                            Color(0xFFE5BA78),
                            Color(0xFFB837E5),
                            Color(0xFF3768E5),
                          ]
                        ),
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                        
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF080E1A),
                            
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text("binewore",style: GoogleFonts.roboto(textStyle : const TextStyle(fontSize: 13,color: Color(0xFFA4A8BA),fontWeight: FontWeight.w500,letterSpacing: .0))),
                      ],
                    ),
                  ),
                  
                  



                  ],
                );
  }