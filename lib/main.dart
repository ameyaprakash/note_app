import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/utils/app_sessions.dart';

import 'package:note_app/view/splash_screen/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox(AppSessions.NOTEBOX);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomeScreen(),
     home: SplashScreen(),
    );
  }
}
