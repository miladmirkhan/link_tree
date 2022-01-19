import 'package:flutter/material.dart';
import 'package:link_tree/main.dart';
import 'package:link_tree/mainScreen.dart';

class mainApp extends StatelessWidget {
  const mainApp({ Key? key }) : super(key: key);
final String selectedLang = 'En';
Widget build(BuildContext context) {
    return MaterialApp(
      
          //the Routes
      initialRoute: '/',
      routes: {
        '/': (context) => mainScreen(),
        },
    );
  }
}
