import 'package:basic_tutorial/pages/cart_page.dart';
import 'package:basic_tutorial/pages/home_page.dart';
import 'package:basic_tutorial/pages/login_page.dart';
import 'package:basic_tutorial/utils/routes.dart';
import 'package:basic_tutorial/widgets/themes.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme:MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute : (context) => HomePage(),
        MyRoutes.loginRoute : (context) => LoginPage(),
        MyRoutes.cartRoute : (context) => CartPage(),
      },
    );


  }
  
}