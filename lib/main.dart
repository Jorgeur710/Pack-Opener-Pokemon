import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t2_jorge_urenia/screens/home_screen_fb_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home:  HomeScreenFbScreen()
    );
  }
}