import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart';
import 'package:instero/models/CommentsModel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentsPage extends StatefulWidget {
  final String mediaid;
  const CommentsPage({super.key, required this.mediaid});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
   late Future<CommentsModel> CommentsAlbum;
  
  Future<CommentsModel> getComments() async {
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
            
            var url = Uri.parse('https://i.instagram.com/api/v1/media/${widget.mediaid}/comments/');
            
            var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$dsUserId; ',
              'user-agent':"Instagram 64.0.0.14.96 Android",// "Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id': "936619743392459", //794590088308990 -2055074604688395
              

              
            });
           
            print(response.statusCode);
           

                       
            return CommentsModel.fromJson(jsonDecode(response.body));
          } 

          @override
  void initState() {
    
    super.initState();
    CommentsAlbum = getComments();
  }

  @override
  Widget build(BuildContext context) 
  {
   
    return Scaffold(
      backgroundColor: const Color(0xFF080E1A),
      body: Center(
        child: Container(
        width: Adaptive.w(84),
        height: Adaptive.w(100 * 1.35),
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
        child: FutureBuilder<CommentsModel>(
          future: CommentsAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.comments!.length,
                itemBuilder: (context, index) {
                  return 
                   snapshot.data!.comments![index].text!.contains("@") ?
                    Column(
                      children: [
                        
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data!.comments![index].user!.profilePicUrl!),
                          ),
                          title: Text(snapshot.data!.comments![index].user!.username!, style: const TextStyle(color: Colors.white),),
                          subtitle: Text(snapshot.data!.comments![index].text!, style: const TextStyle(color: Colors.white),),
                        ),
                        const Divider(color: Colors.white,)
                      

                      ],
                    )
                    :
                    Column(
                      children: [
                        Divider(
                              color: Color.fromARGB(255, 95, 95, 95),
                              thickness: 1,
                            ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data!.comments![index].user!.profilePicUrl!),
                          ),
                          title: Text(snapshot.data!.comments![index].user!.username!, style: const TextStyle(color: Colors.white),),
                          subtitle: Text(snapshot.data!.comments![index].text!, style: const TextStyle(color: Colors.white),),
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