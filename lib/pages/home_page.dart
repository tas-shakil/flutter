import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),
      body: Center(
        child: Container(
          child:Text("Welcome to 10 days of flutter"),
        ),
      ),
      drawer: Drawer(),
    );
  }
  
}