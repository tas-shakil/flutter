import 'package:basic_tutorial/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name ="";
  bool changeButton = false;
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
              Text("Welcome $name",
              style: const TextStyle(
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
                    onChanged: (value){
                      name = value;
                      setState(() {

                      });
                    },
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
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changeButton = true;
                      });
                      await Future.delayed(Duration(seconds: 3));
                       Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 3),
                      width: changeButton? 50: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton? const Icon(Icons.done,color: Colors.white,) : const Text('Login',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        shape: changeButton
                            ? BoxShape.circle
                            : BoxShape.rectangle,

                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   child: const Text("Login",style: TextStyle(fontSize: 20.0),),
                  //   style: TextButton.styleFrom(minimumSize: const Size(150, 50)),
                  //   onPressed: (){
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}