import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/utils/animation_constants.dart';

import 'package:note_app/view/note_screen/note_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NoteScreen(),));
    },);
    // TODO: implement initState
    super.initState();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(AnimationConstants.splash_note)
      ),
    );
  }
}