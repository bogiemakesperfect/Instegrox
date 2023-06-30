import 'dart:convert';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart';

import 'package:instero/models/UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserInfo> getRequestforprofile(String id) async {
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
              
            var url = Uri.parse('https://www.instagram.com/api/v1/users/$id/info');
            
            var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$ds_user_id; ',
              'user-agent': "Instagram 64.0.0.14.96 Android", // "Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id': "936619743392459", //794590088308990 -2055074604688395
              

              
            });
            print(response.body);
            print(response.statusCode);
             
            
             
            
           
            
            
            return UserInfo.fromJson(jsonDecode(response.body));
          } 