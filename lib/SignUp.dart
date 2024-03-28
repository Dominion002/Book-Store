import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Dominion/transfer.dart';


class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}



class _LoginpageState extends State<Loginpage> {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final TextEditingController _emailTextController = TextEditingController();
    final TextEditingController _passwordTextController = TextEditingController();

    Future<void> _signIn() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text,
        );
        Navigator.pushReplacementNamed(context, '/home');
      } catch (error) {
        print("Error signing in: $error");
        showErrorMessage("Email or Password incorect");

      }
    }

    void showErrorMessage(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff8599ff),
          duration: Duration(seconds: 3),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                        height:50,
                      ),
                      Image.asset("img/order.png"),
                    ],
                  ),
                ),

                SizedBox(
                  height:50,
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
                              "Email:",
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
                           controller:_emailTextController,
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
                  width:10,
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
                           controller: _passwordTextController,
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

                // Container(
                //   height: MediaQuery.of(context).size.height/10.5,
                //   width: MediaQuery.of(context).size.height/1.76,
                //   color: Colors.white,
                //   // width: 400,
                //   child:  TextField(
                //     controller: password,
                //     // controller: _textController1,
                //     decoration: InputDecoration(
                //       labelText: '6 digits',
                //       fillColor: Color(0xffeef4f8),
                //       filled: true,
                //       contentPadding: EdgeInsets.all(15),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height:30,
                ),

                // SizedBox(
                //   width: MediaQuery.of(context).size.width/1.76,
                //   height: MediaQuery.of(context).size.height/14.5,
                //   // height: 50,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.pushNamed(context, '/others');
                //     },
                //     style: ElevatedButton.styleFrom(
                //       primary: Color(0xff8497a4), // Background color
                //       onPrimary: Colors.white, // Text Color (Foreground color)
                //     ),
                //     child: const Text(
                //       'Confirm',
                //       style: TextStyle(fontSize: 20),
                //     ),
                //   ),
                // ),


                SizedBox(
                  width: MediaQuery.of(context).size.height/2.3,
                  height: MediaQuery.of(context).size.height/14.5,
                  child:ElevatedButton(
                    onPressed: () => _signIn(),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff151e47), // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height/30,
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
                          "Do not have an account?",
                          style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/5,
                        height: MediaQuery.of(context).size.height/17,
                        // height: 50,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff8599ff), // Background color
                            onPrimary: Colors.white, // Text Color (Foreground color)
                          ),
                          child: const Text(
                            'SignUp',
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
