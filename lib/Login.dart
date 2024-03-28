import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;
late final FirebaseFirestore database;

class Logins extends StatefulWidget {
  const Logins({super.key});

  @override
  State<Logins> createState() => _Logins();
}

class _Logins extends State<Logins> {
  @override

  Future<void> register(String email,String password) async{
    UserCredential user = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if(user != null){
      database.collection("user").add({
        "userid":auth.currentUser?.uid,
        "email":email,
        "password":password,

      });
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
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "First Page",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(70),
                child: Container(
                  width: 450,
                  color: Colors.white,
                  child: Column(
                      children:[
                         Image.asset("img/hot.jpg"),
                        // Image.asset("img/jummy.jpg"),
                        SizedBox(
                          height:40,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/11.5,
                          width: MediaQuery.of(context).size.height/2,
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.all(8),
                          ),
                        ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/11.5,
                          width: MediaQuery.of(context).size.height/2,
                       child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.all(8),
                          ),
                        ),
                        ),
                        SizedBox(
                          height:20,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/14,
                          width: MediaQuery.of(context).size.width/2,
                          child: ElevatedButton(
                            onPressed: () {
                               if(email.text != null && password.text != null ){
                                 register(email.text, password.text);
                                 Navigator.pushNamed(context, '/others');
                               }
                               else{
                                 // print("We did not register you");
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("You Could login. Try again later"),
                                        );
                                      }
                                  );
                               }
                            },
                            style: ElevatedButton.styleFrom(
                               primary: Color(0xff1dcf9f),
                              // primary: Color(0xfff89c24),
                              // Background color
                              onPrimary: Colors.white, // Text Color (Foreground color)
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height:20,
                        ),
                        // Text(
                        //   "Already have an account? Login",
                        //   style: TextStyle(color: Colors.white, fontSize: 7, fontStyle: FontStyle.italic),
                        //
                        // ),
                      ]
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}
