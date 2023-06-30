/*
import 'dart:convert';

import 'package:http/http.dart';

import 'package:instero/models/UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserInfo> getRequest() async {
             SharedPreferences prefs = await SharedPreferences.getInstance();
             SharedPreferences local = await SharedPreferences.getInstance();
             
              var ds_user_id = prefs.getString("ds_user_id");
              var sessionid = prefs.getString("sessionid");
              var csrftoken = prefs.getString("csrftoken");
              var datr = prefs.getString("datr");
              var shbid = prefs.getString("shbid");
              var shbts = prefs.getString("shbts");
              var dpr = prefs.getString("dpr");
              var ig_did = prefs.getString("ig_did");
              var ig_nrcb = prefs.getString("ig_nrcb");
              var rur = prefs.getString("rur");
              var mid = prefs.getString("mid");
            var url = Uri.parse('https://www.instagram.com/api/v1/users/$ds_user_id/info');
            
            var response = await get(url, headers: {
              'cookie': 'sessionid=$sessionid; csrftoken=$csrftoken; ds_user_id=$ds_user_id; ',
              'user-agent': "Instagram 219.0.0.12.117 Android",
              
              'x-ig-app-id': "936619743392459", //794590088308990 -2055074604688395
              

              
            });
            print(response.body);
            print(response.statusCode);
             Map<dynamic, dynamic> dataget = {}; // yeri değişebilir !
            
            if(response.statusCode == 200 ){
                var jsonResponse = jsonDecode(response.body);
                            jsonResponse.forEach((key, value) async {
                              dataget[key] = value;
                              
                            
                            });

            }
           
            
             
           
              if (dataget["message"] == "checkpoint_required" || dataget["message"] == "challenge_required") {
                local.setBool("reset", true);
                print("RESET  if ****= ${local.getBool("reset").toString()}");
                
              }
                  else if(response.statusCode == 200){
                    print("RESET  else if= ${local.getBool("reset").toString()}");
                    local.setString("username", dataget["user"]["username"]);         
                  local.setInt("followerCount", dataget["user"]["follower_count"]);
                  local.setInt("followingCount", dataget["user"]["following_count"]);
                  local.setInt("mediaCount", dataget["user"]["media_count"]);
                  local.setBool("reset", false);
                    

                  }


            
           
            
            
            return UserInfo.fromJson(jsonDecode(response.body));
          } 
          */