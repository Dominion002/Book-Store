import 'package:Dominion/slick2.dart';
import 'package:Dominion/tired.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Dominion/slick.dart';
import 'package:Dominion/HomePage.dart';
import 'package:Dominion/description.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Descriptions extends StatefulWidget {
   Function(int)? onRatingChanged;
  final Map<String, dynamic> selectedBookData;
  Descriptions(this.selectedBookData,);

  @override
  _DescriptionsState createState() => _DescriptionsState();
}

class _DescriptionsState extends State<Descriptions> {
  final TextEditingController remarks = TextEditingController();
  int _currentRating = 0;
  var me;

  List<Map<String, dynamic>> cartItems = [];



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    home: Scaffold(
    backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
              ),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/3,
                    width: MediaQuery.of(context).size.width/3.5,
                    decoration: BoxDecoration(
                    ),
                    child: Image(
                      image: NetworkImage(widget.selectedBookData['img'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width:9
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/3,
                    width: MediaQuery.of(context).size.width/1.5,
                    decoration: BoxDecoration(
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height/12,
                          width: MediaQuery.of(context).size.width/1.5,
                          padding: EdgeInsets.only(top: 18),
                          decoration: BoxDecoration(
                          ),
                          child: Text(
                            ' ${widget.selectedBookData['Title']}',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/4,
                          width: MediaQuery.of(context).size.width/1.5,
                          decoration: BoxDecoration(
                              // color: Colors.red
                          ),
                          child: Text(
                            ' ${widget.selectedBookData['description']}',
                            style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child:SizedBox(
                width: MediaQuery.of(context).size.width/3.2,
                height: MediaQuery.of(context).size.height/14.5,
                // height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _showFantasyBooksScreen(context,  cartItems);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff8599ff), // Background color
                    onPrimary: Colors.white, // Text Color (Foreground color)
                  ),
                  child: const Text(
                    'add to cart',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
              ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(right: 300),
                  child:Text(
                      "Ratings",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 25),
            ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/8,
                    width: MediaQuery.of(context).size.width/1,
                    padding: EdgeInsets.only(bottom: 15, left: 12),
                    child: Row(
                      // children: [
                      //   Icon(Icons.star,color: Colors.yellow),
                      //   Icon(Icons.star,color: Colors.yellow),
                      //   Icon(Icons.star,color: Colors.yellow),
                      //   Icon(Icons.star,color: Colors.yellow),
                      //   Icon(Icons.star,color: Colors.yellow),
                      // ],
                       children: List.generate(5, (index) {
                         return IconButton(
                             icon: Icon(
                             _currentRating > index ? Icons.star : Icons.star_border,
                             color: Colors.yellow,
                             size: 30,
                         ),
                         onPressed: () {
                         setState(() {
                         _currentRating = index + 1;
                         if (widget.onRatingChanged != null) {
                         widget.onRatingChanged!(_currentRating);
                         }
                         });
                         },
                         );
                       },
                    ),
                  ),
                  ),
                  // RatingBar.builder(
                  //   initialRating: 0,
                  //   minRating: 0,
                  //   direction: Axis.horizontal,
                  //   allowHalfRating: true,
                  //   itemCount: 5,
                  //   itemSize: 40,
                  //   itemBuilder: (context, _) => Icon(
                  //     Icons.star,
                  //     color: Colors.amber,
                  //   ),
                  //   onRatingUpdate: (rating) {
                  //     // Handle the rating update here
                  //     print(rating);
                  //   },
                  // ),

                  Padding(padding: EdgeInsets.only(right: 285),
                   child:Text(
                      "Remarks",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 25),
                   ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/35,
                    width:  MediaQuery.of(context).size.height/10 ,
                  ),
                  Container(
                    width:  MediaQuery.of(context).size.width/1.1,
                    height: MediaQuery.of(context).size.height/8,
                    decoration: BoxDecoration(
                      color: Color(0xff8599ff),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:  TextFormField(
                      controller: remarks,
                  ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height/35,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width/3.2,
                    height: MediaQuery.of(context).size.height/14.5,
                    // height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        remarks.clear();
                        setState(() {
                          _currentRating = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff8599ff), // Background color
                        onPrimary: Colors.white, // Text Color (Foreground color)
                      ),
                      child: const Text(
                        'Submit',
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
      bottomNavigationBar: tireds(),
    )
    );
  }

  void _showFantasyBooksScreen(BuildContext context, List<Map<String, dynamic>> cartItems) {

      setState(() {
        cartItems.add(widget.selectedBookData);
      });


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FantasyBooksScreen(cartItems),
      ),
    );
  }



 }





