import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instero/Services/userSearchservice.dart';
import 'package:instero/Views/BottomBarScreens/ProfilePageNew/ProfieNewPage.dart';

import 'package:instero/models/UserSearchmodel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class KullaniciAramaPageTwo extends StatefulWidget {
  const KullaniciAramaPageTwo({super.key});

  @override
  State<KullaniciAramaPageTwo> createState() => _KullaniciAramaPageTwoState();
}

class _KullaniciAramaPageTwoState extends State<KullaniciAramaPageTwo> {
  
  late TextEditingController _controller;
  bool tiklandi = false;
  bool yazildi = false;
  late String yazilansey;
  @override
  void initState() {
    
    super.initState();
    
    tiklandi = false;
    yazildi = false;
    aratilabilir = false;
    _controller = TextEditingController();
    yazilansey = "";
  }
  
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userSearchalbum = getUserSearch(_controller.text); // TODO 1
  }
  
  late bool aratilabilir;
  

  @override
  void dispose() {
    
   
    super.dispose();
  }
  late Future<UserSearchsonuc> userSearchalbum;
  final String assetGeri = 'assets/images/svgicons/geriarrow.svg';
  @override
  Widget build(BuildContext context) {
       var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
   
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            
            Container(
              width: screenWidth,
              height: screenHeight * 5,
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
            ),
            Column(
              children: [
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
                             
                              child: Text("Kullanıcı Arama",style: GoogleFonts.roboto(
                                    textStyle : const TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
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
                          Container( // !textfield 
                            width: 90.w,
                            height: Adaptive.h(8),
                            
                            child: Container(
                              
                              
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.all(Radius.circular(14)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      height: screenHeight,
                                      decoration: BoxDecoration(
                                          color: Colors.white12,
                                          borderRadius: const BorderRadius.only(topLeft : Radius.circular(14),bottomLeft: Radius.circular(14)),
                                          border: Border.all(color: const Color(0xFFC28BF9),width: 1),
                                        ),
                                        child:  Padding(
                                          padding: const EdgeInsets.only(top : 8.0,left :24),
                                          child: TextField(
                                            controller: _controller,
    
                                            onChanged: (value){
                                              
                                             
                                                aratilabilir = true;
                                              
                                                
                                                 yazilansey = value;
                                            
                                               
                                              
                                            },
                                            onSubmitted: (value) {
    
    
                                              aratilabilir = true;
                                              
                                                
                                                 yazilansey = value;
    
                                                //
                                              
                                             
                                            },
                                            obscureText: false,
                                           
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                             decoration: const InputDecoration(
                                                  
                                                  border: InputBorder.none,
                                                  hintText: "Kullanıcı Ara...",
                                                  hintStyle: TextStyle(
                                                    color: Colors.white,
    
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                          ),
                                        ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: 
                                    
                                    InkWell(
                                      onTap: (){
                                       
                                        
                                      
                                        //Future<UserSearchsonuc> userSearchalbum = getUserSearch(_controller.text);
                                        setState(() {
                                          _controller.text = yazilansey;
                                          userSearchalbum = getUserSearch(_controller.text);
                                          tiklandi = true;
                                        });
                                        
                                      },
                                      child: Container(
                                        width: screenWidth ,
                                        height: screenHeight ,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              const Color(0xFFCF00E1),
                                              const Color(0xFF7600EC).withOpacity(0.93),
                                              const Color(0xFF2200F5).withOpacity(0.87),
                                    
                                            ]
                                          ),
                                          borderRadius: const BorderRadius.only(topRight : Radius.circular(14),bottomRight: Radius.circular(14)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: SvgPicture.asset(
                                            
                                            'assets/images/svgicons/aramaiconiki.svg',
                                            
                                          ),
                                        ),
                                    
                                      ),
                                    
    
                                    )
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top : 24.0),
                            child: Container( 
                              width: screenWidth,
                              height: screenHeight * 0.09,
                              color: const Color(0xFF08132F), 
                            ),
                          ),
                          Expanded(   // !listviewbuilder 
                            child: Container(
                              
                              width: screenWidth,
                              height: screenHeight,
                              color: Colors.transparent,
                              child: _controller.text.isEmpty ? Container(color: Colors.transparent,)
                              :
                              FutureBuilder(
                                future: userSearchalbum,
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if(snapshot.hasData){
    
                                    return snapshot.data!.numResults! == 0 ?
                                    Container()
                                    :
                                     ListView.builder(
                                      itemCount: snapshot.data!.numResults! < 3 ? snapshot.data!.numResults! : snapshot.data!.numResults!,  // TODO 2
                                      itemBuilder: (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: (){
                                           
                                           Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfilePageNew(id: snapshot.data!.users[index].pk))); // ! geçici
                                      
                                          },
                                          child: Container(
                                            width: screenWidth,
                                            height: screenHeight * 0.1,
                                            margin: const EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF0E1324),
                                              borderRadius: const BorderRadius.all(Radius.circular(14)),
                                              border: Border.all(color: const Color.fromARGB(255, 27, 34, 57),width: 2),
                                            ),
                                            child: Row(
                                              children: [
                                                
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    width: screenWidth,
                                                    height: screenHeight,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFF0E1324),
                                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(14),bottomLeft: Radius.circular(14)),
                                                      //border: Border.all(color: Color.fromARGB(255, 49, 38, 60),width: 1),
                                                    ),
                                                    child: 
                                                    
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: CircleAvatar(
                                                        radius: 30,
                                                        backgroundImage: NetworkImage(snapshot.data.users[index].profilePicUrl),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    width: screenWidth,
                                                    height: screenHeight,
                                                    decoration: const BoxDecoration(
                                                      color: Color.fromARGB(255, 27, 34, 57),// TODO BAK
                                                      borderRadius: BorderRadius.only(topRight: Radius.circular(14),bottomRight: Radius.circular(14)),
                                                      //border: Border.all(color: const Color(0xFFC28BF9),width: 1),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 0.0),
                                                      child: SingleChildScrollView(
                                                        scrollDirection: Axis.horizontal,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(snapshot.data.users[index].username,style: GoogleFonts.roboto(
                                                                  textStyle: const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w500)
                                                                ),),
                                                                Row(
                                                                  children: [
                                                                    Text( "@" + snapshot.data.users[index].username,style: GoogleFonts.roboto(
                                                                  textStyle: const TextStyle(fontSize: 14,color: Color(0xFF455376),fontWeight: FontWeight.w500)
                                                                ),),
                                                                snapshot.data.users[index].isPrivate== true ? 
                                                                 SvgPicture.asset(
                                                                  'assets/images/svgicons/kiliticon.svg',
                                                                  width: 15,
                                                                  height: 15,
                                                                  color: Colors.white,
                                                                  ) :
                                                                 Container(color: Colors.red,),// TODO BAK
                                                                
                                                                  
                                                                  ],
                                                                  
                                                                )
                                                              ],
                                                            ),
                                                            
                                                           
                                                             Container(
                                                              margin: const EdgeInsets.only(left: 5),
                                                              padding: const EdgeInsets.all(6),
                                                              width: screenWidth * 0.26,
                                                              height: screenHeight * 0.04,
                                                              decoration: BoxDecoration(
                                                                color: const Color(0xFF0E1324),
                                                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                                border: Border.all(color: Colors.pink,width: 1),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    'assets/images/svgicons/gozicon.svg',
                                                                    width: 10,
                                                                    height: 10,
                                                                    color: Colors.white,
                                                                  ),
                                                                  Text("Görüntüle",style: GoogleFonts.roboto(
                                                                    textStyle: const TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500)
                                                                  ),),
                                                      
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(width: screenWidth * 0.02,),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                 
                                               
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
    
                                  }
                                  else{
                                    return const Center(child: CircularProgressIndicator(),);
    
                                  }
                                  
                                  
                                },
                              ) 
                            ),
                          )
              ],
            )
            
          ],
        )
      ),
    );
  }
}


