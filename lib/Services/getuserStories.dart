import 'dart:convert';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart';


import 'package:instero/models/userStoriesModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserStories> getStories() async {
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
              
              var ds_user_id = prefs.getString("ds_user_id");
              var sessionid = prefs.getString("sessionid");
              var csrftoken = prefs.getString("csrftoken");
            
            var url = Uri.parse('https://i.instagram.com/api/v1/feed/reels_tray/');
            
            var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$ds_user_id; ',
              'user-agent':"Instagram 64.0.0.14.96 Android",// "Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id':"936619743392459", //794590088308990 -2055074604688395
              

              
            });
            print("-----------USERS STORIES-----------------");
            print(response.body);
            print(response.statusCode);


             Map<dynamic, dynamic> dataget = {}; // yeri değişebilir !
            
            
             var jsonResponse = jsonDecode(response.body);
            jsonResponse.forEach((key, value) {
              dataget[key] = value;
              

              
              
            
            });
            
            
           
            
            
            return UserStories.fromJson(jsonDecode(response.body));
          } 