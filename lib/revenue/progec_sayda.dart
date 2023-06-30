import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instero/Views/LoginPage/LoginPage.dart';
import 'package:instero/revenue/PayWall.dart';
import 'package:instero/revenue/constants.dart';
import 'package:instero/revenue/singletons_data.dart';
import 'package:instero/revenue/user.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'dart:io' show Platform;

class gec extends StatefulWidget {
  const gec({super.key});

  @override
  State<gec> createState() => _gecState();
}

class _gecState extends State<gec> {
  bool _isLoading = false;

  Future<void> checkPro() async {
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    if (customerInfo.entitlements.all[entitlementID] != null &&
        customerInfo.entitlements.all[entitlementID]!.isActive == true) {
          var data;
          data = await Purchases.appUserID;
          
          print("PRO");
      setState(() {
         appData.isPro = true;
         appData.appUserID = data;
         print("asdasdasd$data");
         
      });
    } 
    else {
      setState(() {
         appData.isPro = false;
      });
    }
  }


 
  
  void perfomMagic() async {
    setState(() {
      _isLoading = true;
    });

    CustomerInfo customerInfo = await Purchases.getCustomerInfo();

    if (customerInfo.entitlements.all[entitlementID] != null &&
        customerInfo.entitlements.all[entitlementID]!.isActive == true) {
          print("PRO");

       
         
      

      setState(()  {
        _isLoading = false;
         appData.isPro = true;
         
      });
    } else {
      Offerings offerings = await Purchases.getOfferings();
      appData.isPro = false;
   
      try {
        offerings = await Purchases.getOfferings();
      } on PlatformException catch (e) {
        await showDialog(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(title: e.message != null ? Text(e.message!) : null));
      }

      setState(() {
        _isLoading = false;
      });

      if (offerings.current == null) {
        // offerings are empty, show a message to your user
      } else {
        // current offering is available, show paywall
        await showModalBottomSheet(
          useRootNavigator: true,
          isDismissible: true,
          isScrollControlled: true,
          backgroundColor: Color.fromARGB(255, 37, 37, 37),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
              return Paywall(
                offering: offerings.current!,
              );
            });
          },
        );
      }
    }
  }



  @override
  void initState() {
     setState(() {
      
    });
    checkPro();
 
    
    super.initState();
   
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('gec'),
      ),
      body:  Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                perfomMagic();
              },
              child: Container(
                width: 200,
                height: 100,
                color: Colors.red,
                child: Text('Pro'),
            
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Userrev()));
              },
              child: Container(
                width: 200,
                height: 100,
                color: Colors.blue,
                child: Center(child: Text('user')),
              
              
              ),
              
            )
          
            ,
            SizedBox(height: 20,),
            InkWell(
              onTap: () {
               
              },
              child: Container(
                width: 200,
                height: 100,
                color: Color.fromARGB(255, 63, 59, 26),
                child: Column(
                  children: [
                    appData.appUserID.contains("RCAnonymousID:") ? Text('RCAnonymousID: var ') : Text('RCAnonymousID: yok'),
                    appData.appUserID == "" ? Text('appUserID: null') :
                    Text(appData.appUserID, style: TextStyle(color: Colors.white),),
                  ],
                ),
              
              
              ),
              
            ),
            SizedBox(height: 20,),
           
            Container(
              width: 200,
              height: 100,
              color: Colors.green,
              child:Column(
                children: [
                  Text("Promu"),
                
                  TextButton(onPressed: (() async {
                    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
                    print("isactive : ${customerInfo.entitlements.all[entitlementID]?.isActive}"); 
                    print(" willRenew :${customerInfo.entitlements.all[entitlementID]?.willRenew}" );
                    print("periodType :${customerInfo.entitlements.all[entitlementID]?.periodType}" );
                    print("latestPurchaseDate :${customerInfo.entitlements.all[entitlementID]?.latestPurchaseDate}" );
                    print("originalPurchaseDate :${customerInfo.entitlements.all[entitlementID]?.originalPurchaseDate}" );
                    print( "store :${customerInfo.entitlements.all[entitlementID]?.store}" );
                    print( "isSandbox :${customerInfo.entitlements.all[entitlementID]?.isSandbox}" );
                    print( "unsubscribeDetectedAt :${customerInfo.entitlements.all[entitlementID]?.unsubscribeDetectedAt}" );
                    print( "billingIssueDetectedAt :${customerInfo.entitlements.all[entitlementID]?.billingIssueDetectedAt}" );
                    print( "expiresDate :${customerInfo.entitlements.all[entitlementID]?.expirationDate}" );
                    print(customerInfo.entitlements.all[entitlementID]?.identifier);

                    
                  }), child: Text("Promu")),
                ],
              )
            ),
            SizedBox(height: 20,),
            Container(
              width: 200,
              height: 100,
              color: Colors.green,
              child:Column(
                children: [
                  Text("" ),
                  
                ],
              )
            ),
            SizedBox(height: 20,),
            Container(
              width: 200,
              height: 100,
              color: Colors.green,
              child:Column(
                children: [
                  appData.isPro == true ? Text("sadece prolar görebilir") : Text(""),
                
                  TextButton(onPressed: (() async {
                    setState(() {
                       if (appData.isPro == true) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Userrev()));
                         // Navigator.pushNamed(context
                       } else {
                         print("pro değil");
                       }
                    });
                    
                  }), child: Text("gİT", style: TextStyle(color: Colors.white),)),
                ],
              )
            ),

          ],
        ),
        
      ),);
  }
  
}