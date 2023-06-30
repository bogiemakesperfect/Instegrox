import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive, {super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 450),
      margin: const EdgeInsets.symmetric(horizontal: 5),
     
      height: isActive ? 8 : 8,
      width: isActive ? 8 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(50))
      ),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    
  }

}