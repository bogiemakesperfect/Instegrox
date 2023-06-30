import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instero/revenue/singletons_data.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class Userrev extends StatefulWidget {
  const Userrev({super.key});

  @override
  State<Userrev> createState() => _UserrevState();
}

class _UserrevState extends State<Userrev> {
  bool _isLoading = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
    });
  }
  
  _manageUser(String task, String newAppUserID) async {
    setState(() {
      _isLoading = true;
    });

    /*
      How to login and identify your users with the Purchases SDK.
            
      Read more about Identifying Users here: https://docs.revenuecat.com/docs/user-ids
    */

    try {
      if (task == "login") {
        await Purchases.logIn(newAppUserID);
      } else if (task == "logout") {
        await Purchases.logOut();
      } else if (task == "restore") {
        await Purchases.restorePurchases();
      }

      appData.appUserID = await Purchases.appUserID;
    } on PlatformException catch (e) {
      await showDialog(
        
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: e.message != null ? Text(e.message!) : null,
              ));
    }

    setState(() {
      _isLoading = false;
    });
  }

    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Color.fromARGB(255, 49, 49, 49),
          body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 32.0, right: 8.0, left: 8.0, bottom: 8.0),
                      child: Text(
                        'Current User Identifier',
                        textAlign: TextAlign.center,
                 

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                     appData.appUserID,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                     
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 24.0, bottom: 8.0, left: 8.0, right: 8.0),
                    child: Text(
                      'Subscription Status',
                      textAlign: TextAlign.center,
                  
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      appData.isPro == true
                          ? 'Active'
                          : 'Not Active',
                      textAlign: TextAlign.center,
                      
                    ),
                  ),
                  Visibility(
                    visible: appData.appUserID.contains("RCAnonymousID:"),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          top: 24.0, bottom: 8.0, left: 8.0, right: 8.0),
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                          
                      ),
                    ),
                  ),
                  Visibility(
                    visible: appData.appUserID.contains("RCAnonymousID:"),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                     
                          onSubmitted: (value) {
                            if (value != '') _manageUser('login', value);
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your user identifier',
                        
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Column(
                      children: [
                        Visibility(
                          visible:
                              !appData.appUserID.contains("RCAnonymousID:"),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                               _manageUser('logout', appData.appUserID);
                              },
                              child: Text(
                                "Logout",
                                
                                
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {
                             // Purchases.restorePurchases();
                              _manageUser('restore', appData.appUserID);
                            },
                            child: Text(
                              "Restore Purchases",
                              
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
        );

  }
}
