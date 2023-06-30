import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:instero/models/PostLikersModel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikersPage extends StatefulWidget {
  final String mediaid;
  const LikersPage({super.key, required this.mediaid});

  @override
  State<LikersPage> createState() => _LikersPageState();
}
class begenenlermodel {
  String? username;
  String? profile_pic_url;
  String? full_name;
  String? id;
  begenenlermodel(
      {this.username, this.profile_pic_url, this.full_name, this.id});
}

class _LikersPageState extends State<LikersPage> {
  
  late Future<LikersModel> likersalbum;
  late List<begenenlermodel> begenenler;
  
  Future<LikersModel> getLikes() async {
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
            
            var url = Uri.parse('https://i.instagram.com/api/v1/media/${widget.mediaid}/likers/');
            
            var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$dsUserId; ',
              'user-agent':"Instagram 64.0.0.14.96 Android",// "Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id': "936619743392459", //794590088308990 -2055074604688395
              

              
            });
      
            print(response.statusCode);
            Map<dynamic, dynamic> dataget = {};
            var jsonResponse = jsonDecode(response.body);
            jsonResponse.forEach((key, value) {
              dataget[key] = value;
              if (key == "users") {
                begenenler = [];
                for (var i = 0; i < value.length; i++) {
                  begenenler.add(begenenlermodel(
                      username: value[i]["username"],
                      profile_pic_url: value[i]["profile_pic_url"],
                      full_name: value[i]["full_name"],
                      id: value[i]["pk"]));
                }
              }
              
            });
             
                      
            return LikersModel.fromJson(jsonDecode(response.body));
          } 
          late List<begenenlermodel>? sonuc;
            var searchController = TextEditingController();


            onSearch(String text) async {
              if(text.isEmpty){
                setState(() {
                  sonuc = begenenler;
                });
                return;
              }
              sonuc = begenenler.where((element) {
                
                var username = element.username!.toLowerCase();
         
                
                var fullname = element.full_name!.toLowerCase();
                var searchtext = text.toLowerCase();
              
                return username.contains(searchtext) || fullname.contains(searchtext);
              }).toList();
             
              
        

              setState(() {});
            
          }
            
          // serch func
          void searchuser(){
            setState(() {
              begenenler = begenenler.where((element) => element.username!.contains(searchController.text)).toList();
              
           
              

            });
          }
          bool aratildi = false;
          @override
  void initState() {
    
    super.initState();
    likersalbum = getLikes();
    
  }

  @override
  Widget build(BuildContext context) 
  {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: const Color(0xFF080E1A),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top : 0.0,bottom: 24),
                child: Container(
                  width: Adaptive.w(84),
                  height: Adaptive.w(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1D1D),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color.fromARGB(255, 95, 95, 95), width: 3),
                  
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                         
                          
                          child:  Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: TextField(
                              controller: searchController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Kullanıcı adı giriniz',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            onSearch(searchController.text);
                          },
                          child: Container(
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
                                            borderRadius: const BorderRadius.only(topRight : Radius.circular(6),bottomRight: Radius.circular(6)),
                                          ),
                            child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: SvgPicture.asset(
                                              
                                              'assets/images/svgicons/aramaiconiki.svg',
                                              
                                            ),
                                          ),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
              Container(
              width: screenWidth / 1.2,
              height: screenHeight / 1.5,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF080E1A),
                    Color(0xFF080E1A),
                  ],
                ),
                border: Border.all(color: const Color.fromARGB(255, 95, 95, 95), width: 3),
                borderRadius: BorderRadius.circular(10),
              
              ),
              child: FutureBuilder<LikersModel>(
                future: likersalbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return 
                    searchController.text.isNotEmpty ?
                    sonuc!.length != 0 ?
                    //Text(sonuc![0].username.toString(),style: TextStyle(color: Colors.white),)
                    ListTile(
                              
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(sonuc![0].profile_pic_url.toString()),
                              ),
                              title: Text( sonuc![0].full_name.toString() , style: const TextStyle(color: Colors.white),),
                              subtitle: Text(sonuc![0].username.toString(), style: const TextStyle(color: Colors.white),),
                            )
                    :
                    Center(
                      child: Container(
                        child: Text("Kullanıcı bulunamadı", style: TextStyle( 
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        
                        )  ,),
                      ),
                    )
                    :
                    snapshot.data!.userCount! < 10 ?
                    ListView.builder(
                      itemCount: snapshot.data!.userCount!  ,
                      itemBuilder: (context, index) {
                        
                         return Column(
                            children: [
                              Divider(
                                color: Color.fromARGB(255, 95, 95, 95),
                                thickness: 1, 
                              ),
                              ListTile(
                                
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot.data!.users![index].profilePicUrl!),
                                ),
                                title: Text( snapshot.data!.users![index].fullName! , style: const TextStyle(color: Colors.white),),
                                subtitle: Text(snapshot.data!.users![index].username!, style: const TextStyle(color: Colors.white),),
                              ),
                              Divider(
                                color: Color.fromARGB(255, 95, 95, 95),
                                thickness: 1,
                              ),
                             
                            
        
                            ],
                          );
                         
                      
                       
                        
                          
                         
                      },
                    )
                    :
                    ListView.builder(
                      itemCount: snapshot.data!.users!.length  ,
                      itemBuilder: (context, index) {
                        
                         return Column(
                            children: [
                              Divider(
                                color: Color.fromARGB(255, 95, 95, 95),
                                thickness: 1, 
                              ),
                              ListTile(
                                
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot.data!.users![index].profilePicUrl!),
                                ),
                                title: Text( snapshot.data!.users![index].fullName! , style: const TextStyle(color: Colors.white),),
                                subtitle: Text(snapshot.data!.users![index].username!, style: const TextStyle(color: Colors.white),),
                              ),
                              Divider(
                                color: Color.fromARGB(255, 95, 95, 95),
                                thickness: 1,
                              ),
                             
                            
        
                            ],
                          );
                         
                      
                       
                        
                          
                         
                      },
                    );

                    
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Container(
                    color: Colors.transparent,
                  );
                },
              ),
            ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        foregroundColor: const Color(0xFF080E1A),
        backgroundColor: const Color(0xFF424F7A),
        onPressed: () {
         Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );

    
  }
}