



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class EnCokYorumveBegeniPage extends StatefulWidget {
  const EnCokYorumveBegeniPage({Key? key}) : super(key: key);

  @override
  State<EnCokYorumveBegeniPage> createState() => _EnCokYorumveBegeniPage();
}

class _EnCokYorumveBegeniPage extends State<EnCokYorumveBegeniPage> {
  final String assetGeri = 'assets/images/svgicons/geriarrow.svg';
  int _tabTextIndexSelected = 0;
  final List<String> _listTextTabToggle = <String> [
    "En Çok",
    "En Az",
  ];  
 
  @override
  Widget build(BuildContext context) {
   


  
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
                width: screenWidth,
                height: screenHeight * 0.08,
                color: const Color(0xFF0C0F1A),
                
                child: Row(
                  
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(left : 30.0,top: 10),
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        assetGeri,
                        width: 10,
                        height: 17,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left : 30,top: 10),
                    child: Row(
                      children: [
                        Text("En Çok Yorum ve Bepğeni Yapanlar",style: GoogleFonts.roboto(
                          textStyle : const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                            ),),

                      ],
                    ),
                  )

                ],
                ),
              ),
              Expanded(
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF302C44),
              Color(0xFF181C3C),
              Color(0xFF080C2C),
              ],
            )
          ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top : 30.0,left:40,right: 30,),
                          child: Row(
                            children : [
                              Text("Sırala:",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                ),),
                              const SizedBox(width: 8,),
                              Container(
                                width: screenWidth * 0.6,
                                height: screenWidth * 0.09,
                                
                                
                                child: FlutterToggleTab(
                            // width in percent
                              width: 60,
                              borderRadius: 10,
                              height: 20,
                              unSelectedBackgroundColors: const [ Color(0xFF303454)],
                              selectedIndex: _tabTextIndexSelected,
                              selectedBackgroundColors: const [Color(0xFF080C2C),],
                              selectedTextStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                              unSelectedTextStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                              labels: _listTextTabToggle,
                              selectedLabelIndex: (index) {
                                setState(() {
                                _tabTextIndexSelected = index;
                                });
                              },
                              isScroll: false,
                            ),
                              )
                                
                      
                            ]
                                          ),
                        ),
                      ),
                      const SizedBox(height : 24),
                      Expanded(
                        child: Container(
                          width: screenWidth * 0.9,
                          height: screenHeight,
                          
                          child: _tabTextIndexSelected == 0 ? ListView.builder(itemCount: 10,itemBuilder: (context, index) { // En Çok
                            
                            return Padding(
                              padding: const EdgeInsets.only(bottom:16.0),
                              child: Container(
                                width: screenWidth * 0.9,
                                height: screenWidth * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                                  border: Border.all(color: const Color(0xFF3C446F),width: 3),
                                  color: const Color(0xFF0E1324),
                                  
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(50)),
                                        color: Colors.green,
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/profilepictures/profilepic.png'),
                                          fit: BoxFit.fill,
                                        )
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Sıla Salda",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                ),),
                                Text("@binewore",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.w700,letterSpacing: .0)
                                ),)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 160,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(6)),
                                            
                                            color: Color(0xFF3C446F),
                                          ),
                                          child: TextButton(onPressed: (){}, child: Text("Takip et",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                ),))
                                          ),
                                          const SizedBox(height: 8,),
                                        Container(
                                          width: 160,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(6)),
                                            
                                            color: Color(0xFF202C55),
                                          ),
                                          
                                          child: TextButton(onPressed: (){}, child: Text("Seni Takip Ediyor",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                ),)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },): ListView.builder(itemCount: 10,itemBuilder: (context, index) {
                            
                            return Padding(
                              padding: const EdgeInsets.only(bottom:16.0),
                              child: Container(
                                width: screenWidth * 0.9,
                                height: screenWidth * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                                  border: Border.all(color: const Color(0xFF3C446F)),
                                  color: const Color(0xFF0E1324),
                                  
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(50)),
                                        color: Colors.green,
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/profilepictures/profilepic.png'),
                                          fit: BoxFit.fill,
                                        )
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Bugra kul",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                ),),
                                Text("@binewore",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.w700,letterSpacing: .0)
                                ),)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 160,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(6)),
                                            
                                            color: Color(0xFF3C446F),
                                          ),
                                          child: TextButton(onPressed: (){}, child: Text("Takip et",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                ),))
                                          ),
                                          const SizedBox(height: 8,),
                                        Container(
                                          width: 160,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(6)),
                                            
                                            color: Color(0xFF202C55),
                                          ),
                                          
                                          child: TextButton(onPressed: (){}, child: Text("Seni Takip Ediyor",style: GoogleFonts.roboto(
                              textStyle : const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                ),)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },),
                        ),
                      )
                    ],
                  ),
              ),
              ),
              
          ],
        ),
      ),
    );
  }
}