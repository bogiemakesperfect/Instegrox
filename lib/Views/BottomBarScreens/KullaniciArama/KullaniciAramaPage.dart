import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instero/Services/userSearchservice.dart';
import 'package:instero/Views/BottomBarScreens/ProfilePageNew/ProfieNewPage.dart';
import 'package:instero/models/UserSearchmodel.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KullaniciArama extends StatefulWidget {
  const KullaniciArama({super.key});

  @override
  State<KullaniciArama> createState() => _KullaniciAramaState();
}

class _KullaniciAramaState extends State<KullaniciArama> with TickerProviderStateMixin {
   late final AnimationController _controller;
   final myController = TextEditingController();

   String ?yazilansey = ""; 
   bool ?yazilanseyvarmi = false;
   late Future<UserSearchsonuc>? userSearchalbum ;
   bool ?tiklandi = false;
   
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
    yazilanseyvarmi = false;
     
  }

    @override
  void dispose() {
    _controller.dispose();
    myController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF080C2C) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                             
                              child: Text(" KULLANICI ARAMA",style: GoogleFonts.roboto(
                                    textStyle : const TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                              ),),
                            )
                       
                    
                      ],
                      ),
                          ),
                        ),
                      
                      
                      ]
                    ),
                  ),
                ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              width: double.infinity,
              height: 25.w,
              decoration: BoxDecoration(
                color: Color(0xFF181C3C),
                borderRadius: BorderRadius.circular(40), 
              ),
              child:
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.only( left: 20, right: 0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 39, 44, 87),
                        borderRadius: BorderRadius.circular(30), 
                      ),
                      child: TextField(
                        controller:  myController,
                        
                        onSubmitted: (value){
                          setState(() {
                            yazilansey = value;
                            yazilanseyvarmi = true;
                            if(myController.text.isNotEmpty){
                          setState(() {
                            yazilansey = myController.text;
                            userSearchalbum = getUserSearch(yazilansey!);
                            yazilanseyvarmi = true;
                          });
                        }
                          });
                        },

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Kullanıcı adı',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          contentPadding: EdgeInsets.only(left: 20,right: 20),
                        ),
                      )
                     
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40) ,
                      onTap: (){
                        /*
                        setState(() {
                          yazilansey = myController.text;
                          yazilanseyvarmi = true;
                          tiklandi = true;
                        });
                        */
                        if(myController.text.isNotEmpty){
                          setState(() {
                            yazilansey = myController.text;
                            userSearchalbum = getUserSearch(yazilansey!);
                            yazilanseyvarmi = true;
                          });
                        }
                        
                       
                      },
                      child: Container(
                        
                        
                        decoration: BoxDecoration(
                          //color: Color.fromARGB(255, 39, 44, 87),
                          borderRadius: BorderRadius.circular(40), 
                        ),
                        child : SvgPicture.asset(
                          'assets/images/svgicons/searchtwo.svg',
                          color: Colors.white,
                          width: 6.w,
                          height: 6.w,
                        )
                      ),
                    ),
                  ),
                ],
              
                 
                
              ) ,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              height: 137.w,
             decoration: BoxDecoration(
                //color: Color(0xFF181C3C).withOpacity(0.3),
                borderRadius: BorderRadius.circular(40), 
              ),
             child: 
              yazilanseyvarmi == true ?
             FutureBuilder(
              future: userSearchalbum,
              builder: (BuildContext context, AsyncSnapshot<UserSearchsonuc> snapshot){
                if(snapshot.hasData){
                  return  ListView.builder(
              physics: BouncingScrollPhysics() ,
              itemCount: snapshot.data!.numResults,
              itemBuilder: (context, index) {
                return 

                myController.text.isEmpty ? 
                Container()
                              :

                          
                
              
                Stack(
                  children: [
                     InkWell(
                      borderRadius: BorderRadius.circular(40) ,
                      splashColor: Colors.purpleAccent,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfilePageNew(id: snapshot.data!.users![index].pk.toString()))).then((value) => myController.clear());
                      },
                       child: Container(
                                       margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                       width: double.infinity,
                                       height: 23.w,
                                       decoration: BoxDecoration(
                                         color: Color(0xFF181C3C),
                                         borderRadius: BorderRadius.circular(40), 
                                       ),
                                       child: Row(
                     
                     
                                         children: [
                        Expanded(
                          flex: 2,
                          child: CircleAvatar(
                            radius: 10.w,
                            backgroundColor: Color.fromARGB(255, 39, 44, 87),
                            child: CircleAvatar(
                              radius: 9.w,
                              backgroundImage: Image.network(snapshot.data!.users![index].profilePicUrl.toString()).image,
                            ),
                          
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                        
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data!.users![index].username.toString(), style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),),
                                Text( "@"+snapshot.data!.users![index].username.toString(), style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),),
                              ],
                            ),
                          ),
                        ),
                       
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(right : 8.0),
                            child: Container(
                              
                              width: 30.w,
                              height: 10.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 39, 44, 87),
                                borderRadius: BorderRadius.circular(40), 
                              ),
                              child: Center(
                                child: Text("Görüntüle",style: GoogleFonts.roboto(
                                        textStyle : const TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: .0)
                                  ),),
                              ),
                            ),
                          ),
                        )
                                         ],
                                       ),
                      
                                     ),
                     ),
                // ! eğer kullanıcı kilitli ise kilit ikonu gözüksün
                 snapshot.data!.users![index].isPrivate== true ? 
                Container(
                  width: 9.w,
                  height: 9.w,
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 39, 44, 87),
                   
                    shape: BoxShape.circle,
                  
                  ),
                  child:
                  snapshot.data!.users![index].friendshipStatus!.following == true ?
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SvgPicture.asset(
                      'assets/images/svgicons/acilankilit.svg',
                      color: Color.fromARGB(255, 163, 163, 163),
                      width: 3.w,
                      height: 3.w,
                    
                    ),
                  )
                  :
                  SvgPicture.asset(
                    'assets/images/svgicons/lockkilit.svg',
                    color: Color.fromARGB(255, 163, 163, 163),
                    width: 4.w,
                    height: 4.w,
                  
                  )
                )
                :
                Container()
                  ],
                );
              
                
               
              }, 
             ) ;
                }
                else if(snapshot.hasData == false){
                  return Center(
                    child:
                   Lottie.network(
                      'https://assets2.lottiefiles.com/packages/lf20_yKVf0ghM7m.json',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                      repeat: true,
                      reverse: true,
                      animate: true,
                      alignment: Alignment.center,
                    
                   )
                   );

                }
                else {
                  return Center(
                    child:
                   Lottie.network(
                      'https://assets2.lottiefiles.com/packages/lf20_yKVf0ghM7m.json',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                      repeat: true,
                      reverse: true,
                      animate: true,
                      alignment: Alignment.center,
                    
                   )
                   );
                   }

              }
            
              )
              :
              Center(
                child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top : 8.0,left : 24),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 16,),
                                    Text("-Kullanıcının Hikayesini Gizli izle",style: TextStyle(color: Colors.white12,fontSize: 14,fontWeight: FontWeight.w500),),
                                    SizedBox(height: 16,),
                                    Text("-Profil Resmini HD+ Çözünürlükde Görüntüle (profil resmini uzun süre basman yeterli)",style: TextStyle(color: Colors.white12,fontSize: 14,fontWeight: FontWeight.w500)),
                                    SizedBox(height: 16,),
                                    Text("-Profil Resmini HD+ Çözünürlükde İndir",style: TextStyle(color: Colors.white12,fontSize: 14,fontWeight: FontWeight.w500)),
                                    SizedBox(height:16,),
                                    Text("-Kullanıcının Fotoğraf Ve Videolarını İndir",style: TextStyle(color: Colors.white12,fontSize: 14,fontWeight: FontWeight.w500)),
                                    SizedBox(height: 16,),
                                    Text("-Kullanıcıyı Markaja Al Hakkındaki Her şeyi Öğren",style: TextStyle(color: Colors.white12,fontSize: 14,fontWeight: FontWeight.w500)),
                                    SizedBox(height: 16,),
                                    Text("-Kullanıcının Takipçilerini ve Takip Ettiği Kişileri Görüntüle",style: TextStyle(color: Colors.white12,fontSize: 14,fontWeight: FontWeight.w500)),
                                    SizedBox(height: 16,),
                                    Text("-Kullanıcının Hikayesini İndir",style: TextStyle(color: Colors.white12,fontSize: 14,fontWeight: FontWeight.w500)),
                                    
                                  ],
                                ),
                              ),
                              )
              ),
            
            )
            
          ],
        ),
      )
    );
  }
}

