import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class ProfilePP extends StatefulWidget {
  final String profiepp;
  const ProfilePP({super.key, required this.profiepp});

  @override
  State<ProfilePP> createState() => _ProfilePPState();
}

class _ProfilePPState extends State<ProfilePP>  with TickerProviderStateMixin{
   AnimationController? _animationController;
   var yuklendi = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }
  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left : 17.0, top : 17),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white,size: 30,),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      backgroundColor: const Color(0xFF080E1A),
      body: Container(
        child: Center(
          child:Image.network(widget.profiepp),
        ),
        ),
   

    ) ;
  }
}