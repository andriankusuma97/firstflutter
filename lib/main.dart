import 'package:firstflutter/screens/detail.dart';
import 'package:firstflutter/screens/home.dart';
import 'package:firstflutter/screens/pocket.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'r1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Pocket(),
      routes: {
        '/pocket':(context)=> Pocket(),
        '/homepage':(context)=> HomePage(),
        '/detail':(context)=> DetailPage(),
      },
    );
  }
}
