import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Center(
          child: AvatarGlow(
            startDelay: const Duration(milliseconds: 1000),
            glowColor: const Color.fromARGB(255, 233, 7, 7),
            glowShape: BoxShape.circle,
            curve: Curves.fastOutSlowIn,
            repeat: true,
            child: const Material(
              elevation: 8.0,
              shape: CircleBorder(),
              color: Colors.transparent,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/xc.jpg'),
                radius: 70.0,
              ),
            ),
          ),
        )),
      ),
    );
  }
}
