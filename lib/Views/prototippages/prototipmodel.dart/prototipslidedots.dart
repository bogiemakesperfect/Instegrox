import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: isActive ? 14 : 11,
      width: isActive ? 14 : 11,
      decoration: BoxDecoration(
          color: isActive ? Colors.grey : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
    );
    
  }

}