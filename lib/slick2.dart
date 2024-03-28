import 'dart:ui';

import 'package:Dominion/slick.dart';
import 'package:Dominion/tired.dart';
import 'package:flutter/material.dart';
import 'package:Dominion/HomePage.dart';
import 'package:Dominion/slick.dart';
import 'package:Dominion/Description2.dart';
import 'package:Dominion/slick2.dart';
import 'slick.dart';
import 'package:provider/provider.dart';

class FantasyBooksScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  FantasyBooksScreen(this.cartItems);
  // CartScreen({required this.selectedBookData});

  @override
  _FantasyBooksScreenState createState() => _FantasyBooksScreenState();
}

class _FantasyBooksScreenState extends State<FantasyBooksScreen> with AutomaticKeepAliveClientMixin<FantasyBooksScreen> {


  @override

  @override
  bool get wantKeepAlive => true;

  Widget build(BuildContext context) {
    // var cartProvider = Provider.of<FantasyBooksScreen>(context);

    return MaterialApp(
    theme: ThemeData.light(),
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffffffff),
    body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/24,
            ),
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 60,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/40,
                  ),
                  Text(
                      "Cart",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,),

                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
        Container(
          height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/4,
            // color: Colors.red,
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                var bookData = widget.cartItems[index];
              return  Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/5,
                  decoration: BoxDecoration(
                    color: Color(0xff8599ff),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          // color: Colors.yellow,
                        ),
                        child: Image(
                          image: NetworkImage(
                            bookData['img'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.6,
                              height: MediaQuery.of(context).size.height / 9,
                              decoration: BoxDecoration(
                                // color: Colors.green,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 75),
                                    child: Text(
                                      ' ${bookData['Title']}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 190),
                                    child: Text(
                                      ' ${bookData['price']}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width / 4,
                                    height: MediaQuery.of(context).size.height / 16,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          widget.cartItems.removeAt(index);
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        onPrimary: Color(0xff8599ff),
                                      ),
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width / 22,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width / 3.6,
                                    height: MediaQuery.of(context).size.height / 16,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Add Pay Now functionality
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        onPrimary:  Color(0xff8599ff),
                                      ),
                                      child: const Text(
                                        'Pay Now',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
          ],
        ),
      ),
          bottomNavigationBar: tireds(),
      ),


    );
  }
}

//
// import 'package:flutter/material.dart';
//
// class FantasyBooksScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> cartItems;
//
//   FantasyBooksScreen(this.cartItems,);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: cartItems.length,
//         itemBuilder: (context, index) {
//           var bookData = cartItems[index];
//           return ListTile(
//             title: Text(bookData['Title']),
//             subtitle: Text('Price: \$${bookData['price']}'),
//             leading: Image.network(
//               bookData['img'],
//               width: 50,
//               height: 50,
//               fit: BoxFit.cover,
//             ),
//             // Add any other UI elements you want for each item
//           );
//         },
//       ),
//     );
//   }
// }
