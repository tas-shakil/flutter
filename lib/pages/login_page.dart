import 'package:basic_tutorial/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(

      child:SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/login_image.png",
                fit: BoxFit.cover),
            const SizedBox(
              height: 20.0,
            ),
             const Text("Welcome",
              style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter password",
                      labelText: "password",
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    child: const Text("Login",style: TextStyle(fontSize: 20.0),),
                    style: TextButton.styleFrom(minimumSize: const Size(150, 50)),
                    onPressed: (){
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}