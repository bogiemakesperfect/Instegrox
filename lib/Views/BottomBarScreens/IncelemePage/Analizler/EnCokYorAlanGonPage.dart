



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class EnCokYorumAlanGonderilerinPage extends StatefulWidget {
  const EnCokYorumAlanGonderilerinPage({Key? key}) : super(key: key);

  @override
  State<EnCokYorumAlanGonderilerinPage> createState() => _EnCokYorumAlanGonderilerinPage();
}

class _EnCokYorumAlanGonderilerinPage extends State<EnCokYorumAlanGonderilerinPage> {
  final String assetGeri = 'assets/images/svgicons/geriarrow.svg';
  int _tabTextIndexSelected = 0;
  final List<String> _listTextTabToggle = <String> [
    "En Çok",
    "En Az",
  ];  
  final String AssetGeri = 'assets/images/svgicons/yorumicon.svg';
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
                    padding: const EdgeInsets.only(left : 55,top: 10),
                    child: Row(
                      children: [
                        Text("En Çok Yorum Alan Gönderilerin",style: GoogleFonts.roboto(
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
                          
                          child: _tabTextIndexSelected == 0  ? ListView.builder(itemCount: 10,itemBuilder: (context, index) {
                            return Padding(
                        padding: const EdgeInsets.only( top : 10, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                                  border: Border.all(color: const Color(0xFF3C446F),width: 3),
                                  color: const Color(0xFF0E1324),
                                  
                                ),
                          alignment: Alignment.centerLeft,
                          
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                    children: [
                                      const SizedBox(width: 30,),
                                      const Text("1."),
                                      const SizedBox(width: 8,),
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: const BoxDecoration(
                                          
                                          image: DecorationImage(
                                            image: AssetImage('assets/images/gönderiimages/manzara.png'),
                                            fit :BoxFit.fill,
                                            
                                          )
                                        ),
                                      ),
                                      const SizedBox(width: 18,),
                                      SvgPicture.asset(
                                        AssetGeri,
                                        width: 15,
                                        height: 15,
                                      ),
                                      const SizedBox(width: 8,),
                                      const Text("456"),
                                      const SizedBox(width: 16,),
                                      Expanded(
                                        child: RichText(
                                          text: const TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '#sonbahar #autumn ', // emoji characters
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 15,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '🍁🍂', // emoji characters
                                                style: TextStyle(
                                                  fontFamily: 'EmojiOne',
                                                  fontSize: 15,
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
                          },): 
                          ListView.builder(itemCount: 10,itemBuilder: (context, index) {
                            return Padding(
                        padding: const EdgeInsets.only( top : 10, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                                  border: Border.all(color: const Color(0xFF3C446F),width: 3),
                                  color: const Color(0xFF0E1324),
                                  
                                ),
                          alignment: Alignment.centerLeft,
                          
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                    children: [
                                      const SizedBox(width: 30,),
                                      const Text("1."),
                                      const SizedBox(width: 8,),
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: const BoxDecoration(
                                          
                                          image: DecorationImage(
                                            image: AssetImage('assets/images/gönderiimages/manzara.png'),
                                            fit :BoxFit.fill,
                                            
                                          )
                                        ),
                                      ),
                                      const SizedBox(width: 18,),
                                      SvgPicture.asset(
                                        AssetGeri,
                                        width: 15,
                                        height: 15,
                                      ),
                                      const SizedBox(width: 8,),
                                      const Text("456"),
                                      const SizedBox(width: 16,),
                                      Expanded(
                                        child: RichText(
                                          text: const TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '#sevgi #güven ', // emoji characters
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 15,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '💖', // emoji characters
                                                style: TextStyle(
                                                  fontFamily: 'EmojiOne',
                                                  fontSize: 15,
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
                          },)
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