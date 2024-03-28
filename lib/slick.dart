import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget {

  final Map<String, dynamic> selectedBookData;
  SearchScreen(this.selectedBookData,);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 110,vertical: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Color(0xff8599ff),
              // color: Colors.red,
            ),
            height: MediaQuery.of(context).size.height/2.3,
            width: MediaQuery.of(context).size.width/2,
            child: Column(
              children: [
                SizedBox(
                  height:5
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // color: Colors.yellow,
                  ),
                  width: MediaQuery.of(context).size.width/2.7,
                  height: MediaQuery.of(context).size.height/4.5,
                  child: Image.asset(
                    'img/boook.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/2.7,
                  height: MediaQuery.of(context).size.height/20,
                  child: Row(
                    children: [
                      Icon(Icons.star,color: Colors.yellow),
                      Icon(Icons.star,color: Colors.yellow),
                      Icon(Icons.star,color: Colors.yellow),
                      Icon(Icons.star,color: Colors.yellow),
                      Icon(Icons.star,color: Colors.white),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 35),
                  child: Text(
                    ' ${widget.selectedBookData['Title']}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 55),
                  child: Text(
                    ' ${widget.selectedBookData['author']}',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 100),
                  child: Text(
                    ' ${widget.selectedBookData['price']}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            ),
          )
      );
    }

  }