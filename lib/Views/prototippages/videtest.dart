import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class VideoTest extends StatefulWidget {
  const VideoTest({super.key});

  @override
  State<VideoTest> createState() => _VideoTestState();
}

class _VideoTestState extends State<VideoTest> {


   late VideoPlayerController controller;
   @override
  void initState() {
    
    super.initState();
    controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
      
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
       var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          
          width : screenWidth / 2,
          height: screenHeight / 2,
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio : screenWidth / screenHeight,
          child :VideoPlayer(
            controller..initialize().then((value) => value = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"))
          )
          
        )
    ),
      )
    );
  }
}