import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import 'package:instero/models/NotifactionModel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import 'package:shared_preferences/shared_preferences.dart';
 
class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}
class CompanyStocks {
  String name;
  

  CompanyStocks({required this.name});
}
 
class _NotificationPageState extends State<NotificationPage> {

    late  Future<NotificationModel> notificationAlbum;

  Future<NotificationModel> getNotification() async {
    var i_d = "";
              CookieManager.instance().getCookies(url: Uri.parse("https://www.instagram.com")).then((value) {
                value.forEach((element) {
                  if (element.name == "x-ig-app-id") {
                    i_d = element.value;
                  }
                });
                print("----------------asdasd----------asd---------asd----------asd-");
                print(i_d);
              });
             SharedPreferences prefs = await SharedPreferences.getInstance();
            
             
              var dsUserId = prefs.getString("ds_user_id");
              var sessionid = prefs.getString("sessionid");
              var csrftoken = prefs.getString("csrftoken");
              
            var url = Uri.parse('https://i.instagram.com/api/v1/news/inbox/');
            
            var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$dsUserId; ',
              'user-agent': "Instagram 64.0.0.14.96 Android",//"Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id': "936619743392459", //794590088308990 -2055074604688395
              

              
            });
           
            print(response.statusCode);
             
            
           
            
            
            return NotificationModel.fromJson(jsonDecode(response.body));
          } 


 @override
  void initState() {
    
    super.initState();
    notificationAlbum = getNotification();
  }






  
  final String assetGeri = 'assets/images/svgicons/geriarrow.svg';
  final String assetBildirim = 'assets/images/svgicons/bildirimicon.svg';
  
  List stocksList = [
    CompanyStocks(name: "Takip Ettiğin Kullanıclar Yeni Hikayeler Paylaştı Hemen Gizli İzlemek İçin Sola Kaydır ",),
    CompanyStocks(name: "Üzgünüz... Birisi Seni Engelledi"),
    CompanyStocks(name: "Biri Profiline Baktı, Hemen Kim Olduğunu Öğren"),
    CompanyStocks(name: "Kesinleşmiş Gizli Bir Hayranın Var, Kim Olduğunu Öğrenmek İster Misin? "),
    CompanyStocks(name: "@hasliucar yeni bir gönderi paylaştı.Gizli profilini görüntülemek için dokun."),
   
  ];
  bool isDelete = false;
  // ignore: non_constant_identifier_names
  void Deleted(){
    setState(() {
      isDelete = true;
    });
  }
    
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: const Color(0xFF181C3C),
        body: FutureBuilder(
          future: notificationAlbum,
          builder: (BuildContext context, AsyncSnapshot<NotificationModel> snapshot) {
            if(snapshot.hasData){
              return Container(
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
                             
                              child: Text("Bildirimler",style: GoogleFonts.roboto(
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
                    Expanded(
                      child: Container(
                        width: 100.w,
                        height: Adaptive.h(84),
                        
                          
                        child: ListView.builder(
                          itemCount: snapshot.data!.oldStories!.length == 0 ? 0 : snapshot.data!.oldStories!.length,
                          itemBuilder: (context, index) {
                            return 
                            //651 hikayeni beğendi
                            snapshot.data?.oldStories![index].storyType == 651 ?
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                
                                width: screenWidth * 0.9,
                                height: screenHeight * 0.11,
                                
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E1C2F).withOpacity(0.7), // arka plan rengi
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color.fromARGB(255, 68, 68, 68), width: 2),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: screenWidth * 0.22,
                                      height: screenHeight * 0.11, 
                                   
                                       child: Padding(
                                         padding: const EdgeInsets.all(15.0),
                                         child: CircleAvatar(
                                          
                                          backgroundImage: NetworkImage(snapshot.data!.oldStories![index].args!.profileImage.toString()),
                                         ),
                                       ) 
                                    ),
                                    Container(
                                      width: screenWidth * 0.561,
                                      height: screenHeight * 0.11,
                                      //color: Colors.green,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5),
                                            child: Text(snapshot.data!.oldStories![index].args!.profileName.toString(), style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600
                                            ),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5),
                                            child: Text(snapshot.data!.oldStories![index].args!.richText!.replaceAll(r"|", "").
                                                replaceAll(r"1", "")
                                                .replaceAll(r"000000", "")
                                                .replaceAll(r"?", "")
                                                .replaceAll(r"{", "")
                                                .replaceAll(r"}", "")
                                                .replaceAll(r"userid", "")
                                                .replaceAll(r"liked", "hikayeni beğendi")
                                                .replaceAll(r"your", "")
                                                .replaceAll(r"story.", "")
                                                .replaceAll(r"and", "ve")
                                                .replaceAll(r"=", "/") , style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500
                                                ),),
                                          ),
                                        ],
                                      
                                      ),
                                    ),
                                    Container(
                                      padding:  EdgeInsets.all(7),
                                      width: screenWidth * 0.17,
                                      height: screenHeight * 0.11,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(snapshot.data!.oldStories![index].args!.images![0].image.toString()),
                                        
                          
                                      ),
                                    ),
                                  ],
                                ),
                                  ),
                            )
                            :
                            //75 seni takip etmek istiyor
                            snapshot.data?.oldStories![index].storyType == 75 ?
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              
                              width: screenWidth * 0.9,
                              height: screenHeight * 0.11,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E1C2F).withOpacity(0.7), // arka plan rengi
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: const Color.fromARGB(255, 68, 68, 68), width: 2),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: screenWidth * 0.22,
                                    height: screenHeight * 0.11, 
                                 
                                     child: Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: CircleAvatar(
                                        
                                        backgroundImage: NetworkImage(snapshot.data!.oldStories![index].args!.profileImage.toString()),
                                       ),
                                     ) 
                                  ),
                                  Container(
                          
                                    width: screenWidth * 0.7,
                                    height: screenHeight * 0.11,
                                    //color: Colors.green,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Text(snapshot.data!.oldStories![index].args!.profileName.toString(), style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600
                                          ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Text(snapshot.data!.oldStories![index].args!.richText!.replaceAll(r"|", "").
                                              replaceAll(r"1", "")
                                              .replaceAll(r"000000", "")
                                              .replaceAll(r"?", "")
                                              .replaceAll(r"{", "")
                                              .replaceAll(r"}", "")
                                              .replaceAll(r"requested to follow you.", "seni takip etmek istiyor.")
                                              
                                              .replaceAll(r"userid", "")
                                              .replaceAll(r"liked", "hikayeni beğendi")
                                              .replaceAll(r"your", "")
                                              .replaceAll(r"story.", "")
                                              .replaceAll(r"and", "ve")
                                              .replaceAll(r"=", "/") , style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500
                                              ),),
                                        ),
                                      ],
                                    
                                    ),
                                  ),
                                  
                                ],
                              ),
                                ),
                            )
                            :
                            //13 yorumunu beğendi
                            snapshot.data?.oldStories![index].storyType == 13 ?
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              
                              width: screenWidth * 0.9,
                              height: screenHeight * 0.11,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E1C2F).withOpacity(0.7), // arka plan rengi
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: const Color.fromARGB(255, 68, 68, 68), width: 2),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: screenWidth * 0.22,
                                    height: screenHeight * 0.11, 
                                 
                                     child: Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: CircleAvatar(
                                        
                                        backgroundImage: NetworkImage(snapshot.data!.oldStories![index].args!.profileImage.toString()),
                                       ),
                                     ) 
                                  ),
                                  Container(
                          
                                    width: screenWidth * 0.561,
                                    height: screenHeight * 0.11,
                                    //color: Colors.green,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Text(snapshot.data!.oldStories![index].args!.profileName.toString(), style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600
                                          ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Text(snapshot.data!.oldStories![index].args!.richText!.replaceAll(r"|", "").
                                              replaceAll(r"1", "")
                                              .replaceAll(r"000000", "")
                                              .replaceAll(r"?", "")
                                              .replaceAll(r"{", "")
                                              .replaceAll(r"}", "")
                                              .replaceAll(r"liked", "yorumunu beğendi:")
                                              .replaceAll(r"comment:", "")
                                              .replaceAll(r"userid", "")
                                              
                                              .replaceAll(r"your", "")
                                              .replaceAll(r"story.", "")
                                              .replaceAll(r"and", "ve")
                                              .replaceAll(r"=", "/") , style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500
                                              ),),
                                        ),
                                      ],
                                    
                                    ),
                                  ),
                                  Container(
                                    padding:  EdgeInsets.all(7),
                                      width: screenWidth * 0.17,
                                    height: screenHeight * 0.11,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot.data!.oldStories![index].args!.images![0].image.toString()),
                                      
                          
                                    ),
                                  ),
                                  
                                ],
                              ),
                                ),
                            )
                            :
                            //12 yorum yaptı
                            snapshot.data?.oldStories![index].storyType == 12 ?
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              
                              width: screenWidth * 0.9,
                              height: screenHeight * 0.11,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E1C2F).withOpacity(0.7), // arka plan rengi
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: const Color.fromARGB(255, 68, 68, 68), width: 2),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: screenWidth * 0.22,
                                    height: screenHeight * 0.11, 
                                 
                                     child: Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: CircleAvatar(
                                        
                                        backgroundImage: NetworkImage(snapshot.data!.oldStories![index].args!.profileImage.toString()),
                                       ),
                                     ) 
                                  ),
                                  Container(
                          
                                    width: screenWidth * 0.561,
                                    height: screenHeight * 0.11,
                                    //color: Colors.green,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Text(snapshot.data!.oldStories![index].args!.profileName.toString(), style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600
                                          ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Text(snapshot.data!.oldStories![index].args!.text!.replaceAll(r"|", "").
                                              replaceAll(r"1", "")
                                              .replaceAll(r"000000", "")
                                              .replaceAll(r"?", "")
                                              .replaceAll(r"{", "")
                                              .replaceAll(r"}", "")
                                              .replaceAll(r"commented", "yorum yaptı:")
                                              .replaceAll(r"userid", "")
                                              
                                              .replaceAll(r"your", "")
                                              .replaceAll(r"story.", "")
                                              .replaceAll(r"and", "ve")
                                              .replaceAll(r"=", "/") , style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500
                                              ),),
                                        ),
                                      ],
                                    
                                    ),
                                  ),
                                  Container(
                                    padding:  EdgeInsets.all(7),
                                      width: screenWidth * 0.17,
                                    height: screenHeight * 0.11,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot.data!.oldStories![index].args!.images![0].image.toString()),
                                      
                          
                                    ),
                                  ),
                                  
                                ],
                              ),
                                ),
                            )
                            :
                            // 101 seni takip etmeye başladı
                            snapshot.data?.oldStories![index].storyType == 101 ?
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              
                              width: Adaptive.w(90),

                              height: Adaptive.h(11.5),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E1C2F).withOpacity(0.7), // arka plan rengi
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color.fromARGB(255, 255, 182, 182), width: 2),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: screenWidth * 0.22,
                                    height: screenHeight * 0.11, 
                                 
                                     child: Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: CircleAvatar(
                                        
                                        backgroundImage: NetworkImage(snapshot.data!.oldStories![index].args!.profileImage.toString()),
                                       ),
                                     ) 
                                  ),
                                  Container(
                          
                                    width: screenWidth * 0.7,
                                    height: screenHeight * 0.11,
                                    //color: Colors.green,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Text(snapshot.data!.oldStories![index].args!.profileName.toString(), style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600
                                          ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Text(snapshot.data!.oldStories![index].args!.text!.replaceAll(r"|", "").
                                              replaceAll(r"1", "")
                                              .replaceAll(r"000000", "")
                                              .replaceAll(r"?", "")
                                              .replaceAll(r"{", "")
                                              .replaceAll(r"}", "")
                                              .replaceAll(r"started following you.", "Seni takip etmeye başladı.")
                                              .replaceAll(r"userid", "")
                                              
                                              .replaceAll(r"your", "")
                                              .replaceAll(r"story.", "")
                                              .replaceAll(r"and", "ve")
                                              .replaceAll(r"=", "/") , style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 12, // :a
                                                fontWeight: FontWeight.w500
                                              ),),
                                        ),
                                      ],
                                    
                                    ),
                                  ),
                                  
                                  
                                ],
                              ),
                                ),
                            )
                            :
                            // 60 fotoğrafını beğendi
                            snapshot.data?.oldStories![index].storyType == 60 ?
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              
                              width: screenWidth * 0.9,
                              height: screenHeight * 0.11,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E1C2F).withOpacity(0.7), // arka plan rengi
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: const Color.fromARGB(255, 68, 68, 68), width: 2),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: screenWidth * 0.22,
                                    height: screenHeight * 0.11, 
                                 
                                     child: Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: CircleAvatar(
                                        
                                        backgroundImage: NetworkImage(snapshot.data!.oldStories![index].args!.profileImage.toString()),
                                       ),
                                     ) 
                                  ),
                                  Container(
                          
                                    width: screenWidth * 0.561,
                                    height: screenHeight * 0.11,
                                    //color: Colors.green,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Text(snapshot.data!.oldStories![index].args!.profileName.toString(), style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600
                                          ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Text(snapshot.data!.oldStories![index].args!.text!.replaceAll(r"|", "").
                                              replaceAll(r"1", "")
                                              .replaceAll(r"000000", "")
                                              .replaceAll(r"?", "")
                                              .replaceAll(r"{", "")
                                              .replaceAll(r"}", "")
                                              .replaceAll(r"liked your photo.", "fotoğrafını beğendi.")
                                              .replaceAll(r"userid", "")
                                              .replaceAll(r"post.", "gönderini beğendi.")
                                              .replaceAll(r"reel.", "videonu beğendi.")
                                              .replaceAll(r"liked", "")
                                              .replaceAll(r"your", "")
                                              .replaceAll(r"story.", "")
                                              .replaceAll(r"and", "ve")
                                              .replaceAll(r"=", "/") , style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500
                                              ),),
                                        ),
                                      ],
                                    
                                    ),
                                  ),
                                  Container(
                                    //color: Colors.red,
                                    padding:  EdgeInsets.all(7),
                                    
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot.data!.oldStories![index].args!.images![0].image.toString()),
                                      
                          
                                    ),
                                  ),
                                  
                                  
                                ],
                              ),
                                ),
                            )
                            :
                            Container();
                            //
                          
                            
                          
                          
                            
                          },
                        ),
                      ),
                    )
                  ],
                ),
              );
        
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }
          },
        )
        
        
      ),
    );
  }
}