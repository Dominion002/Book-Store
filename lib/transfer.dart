import 'package:flutter/material.dart';
import 'package:Dominion/SignUp.dart';
import 'package:Dominion/Dashboard.dart';



class  FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Book app",
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Color(0xff8599ff),
    body: SingleChildScrollView(
    child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height/8,
          ),
      Container(
      // color: Colors.red,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/1.1,
      // padding: const EdgeInsets.only(top: 50),
      child: Column(
          children: [
            Image.asset("img/order.png"),

            SizedBox(
              height: MediaQuery.of(context).size.height/23,
            ),
            Padding(
                padding: EdgeInsets.only(right: 105),
           child: Text(
              "Read your",
              style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 49),
              child: Text(
                "favourite book",
                style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 105),
              child: Text(
                "from here",
                style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height/45,
            ),

            Padding(
              padding: EdgeInsets.only(right: 05),
              child: Text(
                "Purchase your trending book",
                style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 130),
              child: Text(
                "at QuickRead",
                style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height/20,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width/1.6,
              height: MediaQuery.of(context).size.height/14.5,
              // height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                  // Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff151e47), // Background color
                  onPrimary: Colors.white, // Text Color (Foreground color)
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height/20,
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
                      "already have an account",
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
      ),
        ],
    ),
    )
    ),
    );

  }
}



