import 'package:Dominion/Description2.dart';
import 'package:Dominion/HomePage.dart';
import 'package:Dominion/MyMap.dart';
import 'package:Dominion/description.dart';
import 'package:Dominion/tired.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Dominion/Dashboard.dart';
import 'package:Dominion/MyMap.dart';
import 'package:Dominion/Login.dart';
import 'package:Dominion/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Dominion/transfer.dart';


late final FirebaseApp app;
late final FirebaseAuth auth;
late final FirebaseFirestore database;




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  database = FirebaseFirestore.instance;
  runApp(Home());
}

class  MyApp extends StatelessWidget {

  @override

  Future<void> register(String email,String password, String username, BuildContext context) async{
    UserCredential user = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if(user != null){
      database.collection("user").add({
        "userid":auth.currentUser?.uid,
        "username":username,
        "email":email,
        "password":password,

      });

      Navigator.pushReplacementNamed(context, '/home');
      // Navigator.pushNamed(context, '/signup');
      print("User Created successfully");
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         title: Text("You clicked a container"),
      //       );
      //     }
      // );
    }

    else{
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("You clicked a container"),
            );
          }
      );
    }

  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();


  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Opay",
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xff8599ff),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  // color: Colors.red,
                  width: 415,
                  // padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      // color: Colors.red,
                      SizedBox(
                        height:40,
                      ),
                      Image.asset("img/order.png"),
                    ],
                  ),
                ),

                SizedBox(
                  height:40,
                ),

                Container(
                  // color: Colors.white,
                  width: 415,
                  // padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      SizedBox(
                        width:05,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/10.5,
                        // color: Color(0xffeef4f8),
                        width: 110,
                        child: Row(
                          children: [
                            Text(
                              "email:",
                              style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                       Container(
                         height: MediaQuery.of(context).size.height/8.1,
                         width: MediaQuery.of(context).size.width/1.5,
                         padding: EdgeInsets.only(top: 12),
                         child:TextFormField(
                           controller: email,
                           // controller: _textController1,
                           decoration: InputDecoration(
                             fillColor: Color(0xffb8c4ff),
                             filled: true,
                             contentPadding: EdgeInsets.all(20),
                           ),
                         ),
                       ),
                    ],
                  ),
                ),

                Container(
                  // color: Colors.white,
                  width: 415,
                  // padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      SizedBox(
                        width:05,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/10.5,
                        // color: Color(0xffeef4f8),
                        width: 110,
                        child: Row(
                          children: [
                            Text(
                              "Username:",
                              style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/8.1,
                        width: MediaQuery.of(context).size.width/1.5,
                        padding: EdgeInsets.only(top: 12),
                        child:TextFormField(
                          controller :username,
                          // controller: _textController1,
                          decoration: InputDecoration(
                            fillColor: Color(0xffb8c4ff),
                            filled: true,
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(
                  height:7,
                ),

                Container(
                  // color: Colors.white,
                  width: 415,
                  // padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      SizedBox(
                        width:05,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/10.5,
                        // color: Color(0xffeef4f8),
                        width: 110,
                        child: Row(
                          children: [
                            Text(
                              "Password:",
                              style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/8.1,
                        width: MediaQuery.of(context).size.width/1.5,
                        padding: EdgeInsets.only(top: 12),
                        child:TextFormField(
                          controller: password,
                          // controller: _textController1,
                          decoration: InputDecoration(
                            fillColor: Color(0xffb8c4ff),
                            filled: true,
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height:30,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.height/2.3,
                  height: MediaQuery.of(context).size.height/14.5,
                  child:ElevatedButton(
                    onPressed: () {
                       if(email.text != null && password.text != null)
                       {
                         register(email.text, password.text,username.text, context);
                         // Navigator.pushReplacementNamed(context, '/home');
                       }
                       else{
                         showDialog(
                             context: context,
                             builder: (context) {
                               return AlertDialog(
                                 title: Text("You clicked a container"),
                               );
                             }
                         );
                       }
                        // Navigator.pushNamed(context, '/signup');
                     },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff151e47), // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text(
                      'SignUp',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height/28,
                ),

                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 76,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 1),
                        child: Text(
                          "already have an account?",
                          style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/5,
                        height: MediaQuery.of(context).size.height/17,
                        // height: 50,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signups');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff8599ff), // Background color
                            onPrimary: Colors.white, // Text Color (Foreground color)
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),
          )
      ),
    );
  }
}