import 'package:flutter/material.dart';
import 'package:footic/pages/root.dart';
import 'package:footic/pages/login.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _sessionTest(),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _sessionTest(){
    GetStorage box = GetStorage();

    if(box.read('isLogged') == true) {
      return const RootPage();
    }
    else{
      return const LoginPage();
    }
  }
}
