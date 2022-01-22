import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:link_tree/app.dart';
import 'package:link_tree/providers/nameProvider.dart';
import 'package:link_tree/service/auth_service.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => print('initialized'));
  runApp(
    MultiProvider(
      child: const mainApp(),
      providers: [
        ChangeNotifierProvider(create: (context) => TheNameProvider()),
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
    ),
  );
}



