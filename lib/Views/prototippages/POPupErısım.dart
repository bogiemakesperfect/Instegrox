import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instero/revenue/PayWall.dart';
import 'package:instero/revenue/constants.dart';
import 'package:instero/revenue/singletons_data.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProyaGecPageSurekli extends StatefulWidget {
  const ProyaGecPageSurekli({super.key});

  @override
  State<ProyaGecPageSurekli> createState() => _ProyaGecPageSurekliState();
}

class _ProyaGecPageSurekliState extends State<ProyaGecPageSurekli> {
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
  

  String? _radioValue; //Initial definition of radio button value
  String ?choice;
  @override
  void initState() {
    // TODO: implement initState
    var _radioValue = 'one';
    checkPro();
    super.initState();
  }
  static const List<String> selections = <String>[
    '1 Aylık Üyelik',
    '1 Yıllık Üyelik',
  ];
  static const List<double> selectionsint = <double>[
    59.99,
    500.00,
  ];
  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          choice = value;
          break;
        case 'two':
          choice = value;
          break;
        case 'three':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF00101C),
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF00101C),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 100.h,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    Container(
                      width: double.infinity,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF00101C),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                           topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(color: Color(0xFF093148),width: 3), 
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 2.h),
                          Image.asset(
                            'assets/images/backgrounds/prototipbir.png',
                            fit: BoxFit.cover,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               SizedBox(height: 2.h),
                              Text("Profilin Günlük ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                                       Text("Analizleri",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                                      SizedBox(height: 2.h),

                              Center(
                                child: Text("Hikayeni görenler özelliği ile hikayeni görenler arasında daha esnek şekilde arama ve sıralama yapabilir, onları yakından inceleyebilirsin.", textAlign: TextAlign.center,
                                    style: TextStyle(
                                      
                                        color: Color.fromARGB(255, 158, 158, 158),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    // ! 2
                     Container(
                      width: double.infinity,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF00101C),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                           topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(color: Color(0xFF093148),width: 3), 
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 2.h),
                          Image.asset(
                            'assets/images/backgrounds/prototipiki.png',
                            fit: BoxFit.cover,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               SizedBox(height: 2.h),
                              Text("Hikayeleri Gizli ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                                       Text("İzle",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                                      SizedBox(height: 2.h),

                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Tüm hikayeleri sınırsız olarak gizli olarak izleyebilirsiniz.", textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                          color: Color.fromARGB(255, 158, 158, 158),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF00101C),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(color: Color(0xFF093148),width: 3), 
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 2.h),
                          Image.asset(
                            'assets/images/backgrounds/prototipiuc.png',
                            fit: BoxFit.cover,
                          ),
                          Column(
                           
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               
                              Center(
                                child: Text("Gizli Profilleri Görüntüle", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                              ),
                                      

                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Gizli hesapların gönderilerini ve hikayelerini sınırsız olarak görüntüleyin.", textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                          color: Color.fromARGB(255, 158, 158, 158),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                     Container(
                      width: double.infinity,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF00101C),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(color: Color(0xFF093148),width: 3), 
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 2.h),
                          Image.asset(
                            'assets/images/backgrounds/prototipikidort.png',
                            fit: BoxFit.cover,
                          ),
                          Column(
                           
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               SizedBox(height: 2.h),
                              Center(
                                child: Text("Gizli Mod", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                              ),
                                      
                                      SizedBox(height: 2.h),

                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Hesabınızı kimlerin görüntülediğini öğrenin ve tüm hesaplara gizli modda bakın. Hedef kullanıcı bu konuda bilgilendirilmez.", textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                          color: Color.fromARGB(255, 158, 158, 158),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                     Container(
                      width: double.infinity,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF00101C),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(color: Color(0xFF093148),width: 3), 
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 2.h),
                          Image.asset(
                            'assets/images/backgrounds/prototipbes.png',
                            fit: BoxFit.cover,
                          ),
                          Column(
                           
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               SizedBox(height: 4.h),
                              Center(
                                child: Text("Kayıp Raporu", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                              ),
                                      
                                      SizedBox(height: 4.h),

                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Seni takip etmeyi bırakanları, engelleyenleri, hatta gönderilerine bıraktığı yorumlarını silen veye beğenen geri çekenleri görebilirsin.", textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                          color: Color.fromARGB(255, 158, 158, 158),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF00101C),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(color: Color(0xFF093148),width: 3), 
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 2.h),
                          Image.asset(
                            'assets/images/backgrounds/prototipalti.png',
                            fit: BoxFit.cover,
                          ),
                          Column(
                           
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               SizedBox(height: 4.h),
                              Center(
                                child: Text("Self Control Paketi", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                              ),
                                      
                                      SizedBox(height: 4.h),

                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("En popüler gönderilerini keşfet, davranış verilerine bakarak takipçilerini daha iyi anla. Gizli hayranlarını gör", textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                          color: Color.fromARGB(255, 158, 158, 158),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF00101C),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(color: Color(0xFF093148),width: 3), 
                      ),
                      child: Column(
                        children: [
                          
                          Image.asset(
                            'assets/images/backgrounds/prototipyedi.png',
                            fit: BoxFit.cover,
                          ),
                          Column(
                           
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               SizedBox(height: 2.h),
                              Center(
                                child: Text("Profil Etkileşimleri", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                                        
                              ),
                              Center(
                                child: Text("Paketi", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                                        
                              ),
                                      
                                      SizedBox(height: 2.h),

                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Profiline en çok ilgi gösteren kişilerin listesini gör.", textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                          color: Color.fromARGB(255, 158, 158, 158),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF00101C),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(color: Color(0xFF093148),width: 3), 
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 2.h),
                          Image.asset(
                            'assets/images/backgrounds/prototipsekiz.png',
                            fit: BoxFit.cover,
                          ),
                          Column(
                           
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               SizedBox(height: 6.h),
                              Center(
                                child: Text("Reklamları Devre Dışı", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                                        
                              ),Center(
                                child: Text(" Bırak", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                                        
                              ),
                             
                                      
                                      SizedBox(height: 4.h),

                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Uygulamayı reklamsız olarak kullanmanın tadını çıkar", textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                          color: Color.fromARGB(255, 158, 158, 158),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF00101C),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(color: Color(0xFF093148),width: 3), 
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 2.h),
                          Image.asset(
                            'assets/images/backgrounds/prototipbir.png',
                            fit: BoxFit.cover,
                          ),
                          Column(
                           
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               SizedBox(height: 3.h),
                              Center(
                                child: Text("Gönderileri İndirin", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                                        
                              )
                            ,
                             
                                      
                                      SizedBox(height: 4.h),

                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Sınırsız olarak görselleri, videoları, hikayeleri indirme.", textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                          color: Color.fromARGB(255, 158, 158, 158),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                )
              ),
            
            Expanded(
              flex: 3,
              child: Container(
                
                width:double.infinity,
                color: Colors.transparent,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right:40.0,left: 40.0,top: 20.0,bottom: 0.0),
                      child: Container(
                        width: 75.w,
                        height: 20.w,
                        decoration: BoxDecoration(
                          color: Color(0xFF00101C),
                          borderRadius: BorderRadius.circular(48),
                          border: Border.all(
                            color: Color(0xFF093148),
                            width: 2,
                          ),
                        ),
                        child: RadioListTile(
                          value: index,
                          groupValue: groupValue,
                          toggleable: true,
                          onChanged: (int? value) {
                            setState(() {
                              groupValue = value;
                            });
                          },
                          title: Text(
                            selections[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "₺ ${selectionsint[index]}",
                            style: TextStyle(
                              color: Color(0xFF718EAA),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          activeColor: Colors.white,
                          secondary: Container(
                            width: 20.w,
                            height: 20.w,
                            decoration: BoxDecoration(
                              color: Color(0xFF00101C),
                              borderRadius: BorderRadius.circular(48),
                              border: Border.all(
                                color: Color(0xFF093148),
                                width: 2,
                              ),
                            ),
                            child:
                            groupValue == index ? Icon(
                              Icons.check,
                              color: Colors.white,
                            ) : Icon(
                              Icons.check,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ) ;
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                
                width:double.infinity,
                color: Colors.transparent,
                child: Column(
                  children: [
                     InkWell(
                      onTap: () {
                        perfomMagic();
                      },
                       child: Container(
                        width: 85.w,
                        height: 21.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFD718E2),
                              Color(0xFF1F2FFD),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(48),
                         border: Border.all(
                              color: Color(0xFF093148),
                              width: 2,
                            ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                     
                          children: [
                            Text("Devam Et", textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 1.h),
                             Text("Tüm Özelliklere Erişin", textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF718EAA),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                          ],
                        ),
                                         ),
                     ),
                    Container(
                      width: double.infinity,
                      height: 18.8.w,
                      color: Color(0xFF0A102F),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: AutoSizeText(
                          "Information about the auto-renewable of the Premium Subscription: - Every time in a week you can reach your updated premium reports and if you want to continue gettin premium reports, your subscription should be continued.- Subscription periods are 1 month / 6 months and 12 months. Ever 1 month/ 6months / 12 months your subscription- Any unused portion of a free trial period, if offered will be forfeited when you purchase a subscription to that publication.- Auto-renewable may be turned off at any time by going to your settings in the iTunes Store after purchase.- Privacy Policy:- Terms of Use: ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF718EAA),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
    
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Colors.white,size: 35,),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
     
    );
    
  }
}
int? groupValue;
