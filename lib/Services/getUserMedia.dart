import 'dart:convert';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart';
import 'package:instero/models/UserMediaModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserMedia> getUserstorie (int y) async {
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
              var ids =  [];
              var ds_user_id = prefs.getString("ds_user_id");
              var sessionid = prefs.getString("sessionid");
              var csrftoken = prefs.getString("csrftoken");
              /*
              
              var yenimediaids = widget.webstorypics.toString();
              for(var i = 0;i < widget.webstorycount  ;i++){
                ids.add(yenimediaids.split(",")[i].replaceAll("[", "").replaceAll("]", "").replaceAll(" ", ""));
              }
              print("ALERT--------------$ids"); 
*/
              
            
            var url = Uri.parse('https://www.instagram.com/api/v1/media/${ids[y]}/info/');
            
            var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$ds_user_id; ',
              'user-agent':"Instagram 64.0.0.14.96 Android", // "Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id': "936619743392459", //794590088308990 -2055074604688395
              

              
            });
            print(response.body);
            print(response.statusCode);
            
            Map<dynamic, dynamic> dataget = {}; // yeri değişebilir !
            
           
             var jsonResponse = jsonDecode(response.body);
            jsonResponse.forEach((key, value) {
              dataget[key] = value;
              

               
                if(dataget["items"][0]["media_type"] == 1){
                  //denekiki.add(dataget["items"][0]["image_versions2"]["candidates"][0]["url"]);
                 
                 
                  print("ALERT------MEİAAA--------${dataget["items"][0]["image_versions2"]["candidates"][0]["url"]}");
                  //print("ALEERT ------- DENEKİKİ VALUE : ${denek[0]}");  
                  //mediatype = false;
                  //sampleUsers[i].stories.add(StoryModel(dataget["items"][0]["image_versions2"]["candidates"][0]["url"]));

                }
                else{
                  //denekiki.add(dataget["items"][0]["video_versions"][0]["url"]);
                  //print("ALEERT ELSE ------- DENEKİKİ VALUE : ${denek[i]}");
                  // _controller = VideoPlayerController.network(dataget["items"][0]["video_versions"][0]["url"])..initialize().then((_) {
                  // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
                  //setState(() {
                   // _controller.play();
                  
                  //});
                //});

                  //mediatype = true;
                  //sampleUsers[i].stories.add(StoryModel(dataget["items"][0]["video_versions"][0]["url"]));
                }


              print("ÇALLLLIIŞŞTIIII -->>>>>>");
            });
             
              return UserMedia.fromJson(jsonDecode(response.body));
           
  }