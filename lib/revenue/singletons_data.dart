 import 'dart:async';

class AppData {
   static final AppData _appData = AppData._internal();
   
   bool entitlementIsActive = false;
   String appUserID = '';
  bool ?isPro;
   

    factory AppData() {
      return _appData;
    }

    AppData._internal();

 }

 final appData = AppData();