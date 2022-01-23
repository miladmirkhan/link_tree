import 'package:flutter/material.dart';
import 'package:link_tree/Screens/Log_up/signup.dart';
import 'package:link_tree/Screens/homeScrren/homeScreen.dart';
import 'package:link_tree/createProfile/createProfile.dart';
import 'package:link_tree/main.dart';
import 'package:link_tree/mainScreen/mainScreen.dart';

import 'Screens/logIn/login_screen_view.dart';

class mainApp extends StatelessWidget {
  const mainApp({ Key? key }) : super(key: key);
final String selectedLang = 'En';
Widget build(BuildContext context) {
    return MaterialApp(
      
          //the Routes
      initialRoute: '/homeScreen',
      routes: {
        '/mainScreen': (context) => mainScreen(),
        '/homeScreen':(context)=>HomeScreenView(),
        '/createProfile':(context)=>LoginScreen(),
        '/rejesteration':(context)=>CreateProfileScreen(),
        '/signUp':(context)=>RegisterScreen(),
        
        },
    );
  }
}
