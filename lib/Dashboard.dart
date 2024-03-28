import 'package:Dominion/Cart.dart';
import 'package:Dominion/Description2.dart';
import 'package:Dominion/HomePage.dart';
import 'package:Dominion/Login.dart';
import 'package:Dominion/main.dart';
import 'package:Dominion/slick2.dart';
import 'package:Dominion/tired.dart';
import 'package:Dominion/transfer.dart';
import 'package:flutter/material.dart';
import 'package:Dominion/SignUp.dart';


class Home extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
        title: "jnujbfk",
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => FirstPage(),
          // '/others': ((context) => Dashboard()),
          '/signup': ((context) => MyApp()),
          '/signups': ((context) => Loginpage()),
          '/home': ((context) => HomePage()),
          // '/home': ((context) => FantasyBooksScreen()),
          //  '/cart': ((context) =>  Descriptions()),
        });
  }
}

class  Dashboard extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Opay",
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Column(
          children: <Widget>[
            SizedBox(
              height:30,
            ),
            Container(
              // color: Colors.red,
              width: 415,
              // padding: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  // color: Colors.red,
                  // SizedBox(
                  //   height:40,
                  //
                  // ),
                  SizedBox(
                    width:05,
                  ),
                  Image.asset("img/heed.png"),
                  Text(
                    "Hello Dominion",
                    style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width:165,
                  ),
                  Image.asset("img/three.png"),
                ],
              ),
            ),

            SizedBox(
              height:20,
            ),

            Container(
              width: 410,
              height: 180,
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(13),
                color: Color(0xff2fbf6c),
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          height:50,
                          width: 05,
                        ),
                        Text(
                          "Total Balance",
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset("img/opps.png"),
                        SizedBox(
                          width: 55,
                        ),
                        Text(
                          "Transaction History",
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                        SizedBox(
                          width: 10,
                          height: 40,
                        ),
                        Image.asset("img/right1.png"),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.zero,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Text(
                          '#100,000.00',
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  Center(
                    child: Container(
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: Column(
                                  children: [
                                    Image.asset("img/skills.png"),
                                    SizedBox(
                                      height: 05,
                                    ),
                                    Text(
                                        "Add money",
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),

                                    )
                                  ],
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: Column(
                                children: [
                                  Image.asset("img/skillss.png"),
                                  SizedBox(
                                    height: 05,
                                  ),
                                  Text(
                                      "Transfer",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: Column(
                                children: [
                                  Image.asset("img/skillsss.png"),
                                  SizedBox(
                                    height: 05,
                                  ),
                                  Text(
                                      "Withdraw",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],

              ),
            ),

            SizedBox(
              height:10,
            ),
             Container(
               // color: Colors.red,
                alignment: Alignment.centerLeft,
               margin: EdgeInsets.only(left: 35),
             child:  Text(
                 "Payment",
                 style: TextStyle(fontWeight: FontWeight.bold,),
               ),
             ),

            Container(
              child: Center(
                child: Column(
                  children: [
                    // Image.asset("img/rinter.png"),
                    Container(
                      height: 70,
                         width: MediaQuery.of(context).size.height,
                        child: Row(
                          children: [
                            Expanded(child: Image.asset("img/row.png"),
                            ),
                            Expanded(
                              child: Image.asset("img/dt.png"),
                            ),
                            Expanded(
                              child: Image.asset("img/better.png"),
                            ),
                            Expanded(
                              child: Image.asset("img/tv.png"),
                            ),
                          ],
                        )

                    ),
                    SizedBox(
                      height:20,
                    ),
                    Container(
                        height: 70,
                        width: MediaQuery.of(context).size.height,
                        child: Row(
                          children: [
                            Expanded(child: Image.asset("img/electricity.png"),
                            ),
                            Expanded(
                              child: Image.asset("img/rings.png"),
                            ),
                            Expanded(
                              child: Image.asset("img/school.png"),
                            ),
                            Expanded(
                              child: Image.asset("img/more.png"),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height:15,
            ),
            // Container(
            //   height: 65,
            //   color: Colors.red,
            //   width: 415,
            //   child: Column(
            //       children: [
            //         Image.asset("image/refer.png"),
            //       ],
            //   ),
            // ),
            Container(
              padding: EdgeInsets.zero,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Image.asset("img/refer.png"),
                ),
              ),
            ),


          ],
        ),
        bottomNavigationBar: tireds(),
      ),
    );
  }
}