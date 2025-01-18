
import 'package:ajanda_uygulamasi/sayfalar/oturum/giris.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';




void main()  {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PLANDAN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GirisSayfasi(),
      //home: AnaSayfa(),
    );
  }
}  


   
