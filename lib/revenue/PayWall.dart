import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:instero/revenue/constants.dart';
import 'package:instero/revenue/singletons_data.dart';
import 'package:purchases_flutter/models/offering_wrapper.dart';
import 'package:purchases_flutter/purchases_flutter.dart'; 

class Paywall extends StatefulWidget {
  final Offering offering;
  const Paywall({super.key, required this.offering});

  @override
  State<Paywall> createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {





  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child : SafeArea(
        child: Wrap(
          children: [
             Container(
              height: 70.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 31, 31, 31),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
              child: const Center(
                  child:
                      Text('Instegro Pro', style: TextStyle(fontSize: 20.0, color: Colors.white))),
            ),


             const Padding(
              padding:
                  EdgeInsets.only(top: 32, bottom: 16, left: 16.0, right: 16.0),
              child: SizedBox(
                child: Text(
                  'Instegro Pro Üyelik', textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink),
                ),
                width: double.infinity,
              ),
            ),


            ListView.builder(
              itemCount: widget.offering.availablePackages.length,
              itemBuilder: (BuildContext context, int index) {
                var myProductList = widget.offering.availablePackages;
                return Card(
                  color: Color.fromARGB(255, 19, 18, 18),
                  child: ListTile(
                      onTap: () async {
                        try {
                          CustomerInfo customerInfo =
                              await Purchases.purchasePackage(
                                  myProductList[index]);
                          appData.entitlementIsActive = customerInfo
                              .entitlements.all[entitlementID]!.isActive;
                        } catch (e) {
                          print(e);
                        }

                        //setState(() {});
                        Navigator.pop(context);
                      },
                      title: Padding(
                        padding: const EdgeInsets.only(top : 20.0),
                        child: Text(
                          myProductList[index].storeProduct.title,
                          
                        ),
                      ),
                      subtitle: Text(
                        myProductList[index].storeProduct.description,
                        
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right : 20.0,top: 20),
                        child: Text(
                            myProductList[index].storeProduct.priceString,
                            style: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0)),
                      )),
                );
              },
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
            ),
             Container(
              height: 70.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 31, 31, 31),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
              child: const Center(
                  child:
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: AutoSizeText(footerText, style: TextStyle(fontSize: 15.0, color: Colors.white)),
                        ))),
             )


          ],
        ),
 
      ),
      
    );
  }
}