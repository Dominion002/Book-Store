import 'package:Dominion/SignUp.dart';
import 'package:Dominion/tired.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Dominion/Description2.dart';
import 'package:Dominion/slick.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();
}




class _HomePage extends  State<HomePage> {


  var done = false;
  Future<void> closeOpen()async {
    setState(() {
      done = !done;
    });
  }

  int selectedContainerIndex = 666;


  @override

  TextEditingController word = TextEditingController();
  Widget build (BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text(
            'BookStore',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 30),
           child: IconButton(
          icon: Icon(
              Icons.search,
            // color: Colors.black,
          ),
                onPressed: (){
                  closeOpen();
                }
            )
)
          ],
      ),
    drawer: NavigationDrawer(),
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
           child: Column(
               children: <Widget>[

                 if(done)
                   Container(
                     child: Row(
                       children:[
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                   decoration: BoxDecoration(
                     color:Color(0xff8599ff),
                     borderRadius: BorderRadius.circular(13),
                   ),
                   height: MediaQuery.of(context).size.height/12,
                   width: MediaQuery.of(context).size.width/1.35,
                   padding: EdgeInsets.only(left: 07,top: 11),
                   child: TextField(
                     controller :word,
                     textAlign: TextAlign.start,
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                       hintText: "Search for books....",
                       prefixIcon: Icon(
                         Icons.search,
                         color: Colors.white
                       ),
                       border: InputBorder.none,
                     ),
                     // controller: _searchController,
                     //
                     // onSubmitted: (query) async{
                     //   _onContainerTap(context, 0);
                     //
                     // },
                   ),
                 ),

                         Padding(
                           padding: const EdgeInsets.only(right:18.0, bottom:4),
                           child: IconButton(
                               icon:Icon(
                                 Icons.search,
                                 size: 40,
                                 color:Color(0xff8599ff),
                               ),
                             onPressed: (){
                               // _onContainerTap(context, 0);
                               _onContainer4Tap(context, 0);
                             },
                           ),
                         ),
                       ]
                     ),
                   ),
                 SizedBox(
                   height:07
                 ),

                 Container(
                   height: MediaQuery.of(context).size.height/10,
                   width: MediaQuery.of(context).size.width,
                   child:SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                   child: Row(
                     children: [
                       GestureDetector(
                         onTap: () {
                           setState(() {
                             selectedContainerIndex = 666;
                           });
                         },
                         child:Container(
                           height: MediaQuery.of(context).size.height/14,
                           width: MediaQuery.of(context).size.width/6,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(07),
                             color: Color(0xff8599ff),
                           ),
                           padding: EdgeInsets.only(top: 10, left: 13),
                           child: Text(
                             " All",
                             style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
                           ),
                         ),
                       ),
                       SizedBox(
                         width: 20,
                       ),
                       GestureDetector(
                         onTap: () {
                           setState(() {
                             selectedContainerIndex = 0;
                           });
                         },
                       child:Container(
                         height: MediaQuery.of(context).size.height/14,
                         width: MediaQuery.of(context).size.width/4,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(07),
                           color: Color(0xff8599ff),
                         ),
                         padding: EdgeInsets.only(top: 10, left: 13),
                         child: Text(
                             "Fantasy",
                           style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
                         ),
                       ),
                      ),
                       SizedBox(
                         width: 20,
                       ),
                       GestureDetector(
                         onTap: (){
                           setState(() {
                             selectedContainerIndex = 1;
                           });
                         },
                       child:Container(
                         height: MediaQuery.of(context).size.height/14,
                         width: MediaQuery.of(context).size.width/4,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(07),
                           color: Color(0xff8599ff),
                         ),
                         padding: EdgeInsets.only(top: 12, left: 17),
                         child: Text(
                           "History",
                           style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
                         ),
                       ),
                       ),
                       SizedBox(
                         width: 20,
                       ),
                       GestureDetector(
                         onTap: (){
                           setState(() {
                             selectedContainerIndex = 2;
                           });
                         },
                       child:Container(
                         height: MediaQuery.of(context).size.height/14,
                         width: MediaQuery.of(context).size.width/4,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(07),
                           color: Color(0xff8599ff),
                         ),
                         padding: EdgeInsets.only(top: 12, left: 17),
                         child: Text(
                           "Horror",
                           style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
                         ),
                       ),
                       ),
                       SizedBox(
                         width: 20,
                       ),
                       GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedContainerIndex = 3;
                          });
                        },
                      child: Container(
                         height: MediaQuery.of(context).size.height/14,
                         width: MediaQuery.of(context).size.width/4,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(07),
                           color: Color(0xff8599ff),
                         ),
                         padding: EdgeInsets.only(top: 12, left: 13),
                         child: Text(
                           "Humour",
                           style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
                         ),
                       ),
                      ),
                     ],
                   ),
                   ),
                 ),
                 SizedBox(
                   height:MediaQuery.of(context).size.height/27,
                 ),

                 //****************************************************************************************************************************
                 Visibility(
                   visible: selectedContainerIndex == 0 ||  selectedContainerIndex == 666,
                child:Container(
                   height:MediaQuery.of(context).size.height/2.4,
                   width:MediaQuery.of(context).size.width,
                   // color: Colors.blue,
                   child: Column(
                     children: [
                       Padding(
                           padding: EdgeInsets.only(right: 330),
                       child:  Text(
                           "Fantasy",
                         style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold ),
                       )
                        ),
                       SizedBox(
                         height: MediaQuery.of(context).size.height/80,
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width,
                         height: MediaQuery.of(context).size.height/2.74,
                         // color: Colors.grey,
                         child: SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                           child: Row(
                             children: [
                               GestureDetector(
                                 onTap: () => _onContainerTap(context, 3),
                              child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic1.png',
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
                                         "Displacement",
                                       style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                     ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 55),
                                       child: Text(
                                         "Kiku Hughes",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦108",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),

                                   ],
                                 ),
                                ),
  ),

                               SizedBox(
                                 width: MediaQuery.of(context).size.width/40,
                               ),

                               GestureDetector(
                                 onTap: () => _onContainerTap(context, 0),
                               child:Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic2.png',
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
                                         "Im a wild Seed",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 55),
                                       child: Text(
                                         "Sharon Lee de",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦60",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
  ),

                               SizedBox(
                                 width: MediaQuery.of(context).size.width/40,
                               ),


                               GestureDetector(
                                 onTap: () => _onContainerTap(context, 2),
                               child:Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/harry.jpg',
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
                                     Padding(padding: EdgeInsets.only(right: 42),
                                       child: Text(
                                         "Harry Potter",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 55),
                                       child: Text(
                                         "Kiku Hughes",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦70",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),

                                   ],
                                 ),

                               ),
                             ),

                               SizedBox(
                                 width: MediaQuery.of(context).size.width/40,
                               ),

                               GestureDetector(
                                 onTap: () => _onContainerTap(context, 1),
                               child:Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic4.jpg',
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
                                     Padding(padding: EdgeInsets.only(right: 40),
                                       child: Text(
                                         "Wings Of Fire",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 55),
                                       child: Text(
                                         "Sharon Lee de",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦100",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),

                                   ],
                                 ),
                               ),
                             ),

                             ],
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
                 ),
                 //***************************************************************************************************************

                 SizedBox(
                   height: MediaQuery.of(context).size.height/25,
                 ),

                 Visibility(
                   visible: selectedContainerIndex == 1 ||  selectedContainerIndex == 666,
                 child:Container(
                   height:MediaQuery.of(context).size.height/2.4,
                   width:MediaQuery.of(context).size.width,
                   // color: Colors.blue,
                   child: Column(
                     children: [
                       Padding(
                           padding: EdgeInsets.only(right: 330),
                           child:  Text(
                             "History",
                             style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold ),
                           )
                       ),
                       SizedBox(
                         height: MediaQuery.of(context).size.height/80,
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width,
                         height: MediaQuery.of(context).size.height/2.74,
                         // color: Colors.grey,
                         child: SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                           child: Row(
                             children: [

                               GestureDetector(
                                 onTap: () => _onContainer1Tap(context, 1),
                               child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic16.jpg',
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
                                         "Anctient China",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 90),
                                       child: Text(
                                         "Bob Lee",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦90",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),

                                   ],
                                 ),

                               ),
                               ),

                               SizedBox(
                                 width: MediaQuery.of(context).size.width/40,
                               ),


                               GestureDetector(
                                 onTap: () => _onContainer1Tap(context, 3),
                              child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic17.jpg',
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
                                     Padding(padding: EdgeInsets.only(right: 65),
                                       child: Text(
                                         "Napoleon",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 55),
                                       child: Text(
                                         "Frank Mckyln",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦40",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                                     ),

                               SizedBox(
                                 width: MediaQuery.of(context).size.width/40,
                               ),

                               GestureDetector(
                                 onTap: () => _onContainer1Tap(context, 2),
                               child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic14.jpg',
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
                                     Padding(padding: EdgeInsets.only(right: 52),
                                       child: Text(
                                         "Time History",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 55),
                                       child: Text(
                                         "Stephen Hakig",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦42",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),

                                   ],
                                 ),

                               ),
                                 ),

                               SizedBox(
                                 width: MediaQuery.of(context).size.width/40,
                               ),


                               GestureDetector(
                                 onTap: () => _onContainer1Tap(context, 0),
                               child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic13.jpg',
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
                                     Padding(padding: EdgeInsets.only(right: 40),
                                       child: Text(
                                         "History Book",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 65),
                                       child: Text(
                                         "Dominnion",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦150",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),

                                   ],
                                 ),
                               ),
                               ),

                             ],
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
                 ),
                 //************************************************************************************************************************************


                 SizedBox(
                   height: MediaQuery.of(context).size.height/25,
                 ),

                 Visibility(
                  visible: selectedContainerIndex == 2 ||  selectedContainerIndex == 666,
               child:  Container(
                   height:MediaQuery.of(context).size.height/2.4,
                   width:MediaQuery.of(context).size.width,
                   // color: Colors.blue,
                   child: Column(
                     children: [
                       Padding(
                           padding: EdgeInsets.only(right: 330),
                           child:  Text(
                             "Humour",
                             style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold ),
                           )
                       ),
                       SizedBox(
                         height: MediaQuery.of(context).size.height/80,
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width,
                         height: MediaQuery.of(context).size.height/2.74,
                         // color: Colors.grey,
                         child: SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                           child: Row(
                             children: [

                               GestureDetector(
                                 onTap: () => _onContainer2Tap(context, 2),
                               child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic9.jpg',
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
                                     Padding(padding: EdgeInsets.only(right: 70),
                                       child: Text(
                                         "Kid Jokes",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 85),
                                       child: Text(
                                         "Dominion",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦65",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),

                                   ],
                                 ),

                               ),
                              ),


                               SizedBox(
                                 width: MediaQuery.of(context).size.width/40,
                               ),


                               GestureDetector(
                                 onTap: () => _onContainer2Tap(context, 3),
                               child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic10.jpg',
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
                                     Padding(padding: EdgeInsets.only(right: 55),
                                       child: Text(
                                         "Joke Book",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 75),
                                       child: Text(
                                         "Lee Min",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦10",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                                ),

                               SizedBox(
                                 width: MediaQuery.of(context).size.width/40,
                               ),

                               GestureDetector(
                                 onTap: () => _onContainer2Tap(context, 1),
                               child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic11.jpg',
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
                                     Padding(padding: EdgeInsets.only(right: 70),
                                       child: Text(
                                         "GrimWood",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 55),
                                       child: Text(
                                         "Nadia Shireen",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦50",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),

                                   ],
                                 ),

                               ),
                                ),

                               SizedBox(
                                 width: MediaQuery.of(context).size.width/40,
                               ),


                               GestureDetector(
                                 onTap: () => _onContainer2Tap(context, 1),
                               child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic12.jpg',
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
                                     Padding(padding: EdgeInsets.only(right: 60),
                                       child: Text(
                                         "Dad Jokes",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 55),
                                       child: Text(
                                         "Lionel Messi",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦16",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),

                                   ],
                                 ),
                               ),
                                ),

                             ],
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
                 //**********************************************************************************************************************************************\
                  ),

                 SizedBox(
                   height: MediaQuery.of(context).size.height/25,
                 ),


                 Visibility(
                   visible: selectedContainerIndex == 3 ||  selectedContainerIndex == 666,
                child: Container(
                   height:MediaQuery.of(context).size.height/2.4,
                   width:MediaQuery.of(context).size.width,
                   // color: Colors.blue,
                   child: Column(
                     children: [
                       Padding(
                           padding: EdgeInsets.only(right: 330),
                           child:  Text(
                             "Horror",
                             style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold ),
                           )
                       ),
                       SizedBox(
                         height: MediaQuery.of(context).size.height/80,
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width,
                         height: MediaQuery.of(context).size.height/2.74,
                         // color: Colors.grey,
                         child: SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                           child: Row(
                             children: [

                               GestureDetector(
                                 onTap: () => _onContainer3Tap(context, 3),
                               child:Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic5.jpg',
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
                                     Padding(padding: EdgeInsets.only(right: 45),
                                       child: Text(
                                         "From Grave",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 55),
                                       child: Text(
                                         "Sam Norton",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦75",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),

                                   ],
                                 ),

                               ),
                               ),

                               SizedBox(
                                 width: MediaQuery.of(context).size.width/40,
                               ),


                               GestureDetector(
                                 onTap: () => _onContainer3Tap(context, 0),
                               child:Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic6.jpg',
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
                                         "The Moonlight",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 55),
                                       child: Text(
                                         "Castle Pope",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦19",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                                     ),

                               SizedBox(
                                 width: MediaQuery.of(context).size.width/40,
                               ),

                               GestureDetector(
                                 onTap: () => _onContainer3Tap(context, 1),
                               child:Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         // color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic7.jpg',
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
                                     Padding(padding: EdgeInsets.only(right: 20),
                                       child: Text(
                                         "The Black Devil",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 55),
                                       child: Text(
                                         "Kiku Hughes",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦96",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),

                                   ],
                                 ),

                               ),
                                 ),

                               SizedBox(
                                 width: MediaQuery.of(context).size.width/40,
                               ),


                               GestureDetector(
                                 onTap: () => _onContainer3Tap(context, 2),
                               child:Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   // color: Colors.red,
                                 ),
                                 height: MediaQuery.of(context).size.height/2.69,
                                 width: MediaQuery.of(context).size.width/2.7,
                                 child: Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         color: Colors.yellow,
                                       ),
                                       width: MediaQuery.of(context).size.width/2.7,
                                       height: MediaQuery.of(context).size.height/4.3,
                                       child: Image.asset(
                                         'img/pic8.jpg',
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
                                     Padding(padding: EdgeInsets.only(right: 60),
                                       child: Text(
                                         "Dark Forst",
                                         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 55),
                                       child: Text(
                                         "FatSiberian",
                                         style: TextStyle(fontSize: 15, color: Colors.black),
                                       ),
                                     ),
                                     Padding(padding: EdgeInsets.only(right: 100),
                                       child: Text(
                                         "₦190",
                                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                       ),
                                     ),

                                   ],
                                 ),
                               ),
                                   ),

                             ],
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
                 ),
                 //**********************************************************************************************************************************************\




               ]
           ),
        ),
    bottomNavigationBar: tireds(),
  );


  void _onContainerTap(BuildContext context, int selectedIndex) async {
    // Query Firestore for documents with genre 'fantasy'
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('cards')
        .where('genre', isEqualTo: 'Fantasy')
        .get();

    // Extract and display data from the documents
    List<Map<String, dynamic>> fantasyBooksData = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    _showFantasyBooksScreen(context, fantasyBooksData[selectedIndex]);
  }

  void _onContainer1Tap(BuildContext context, int selectedIndex) async {
    // Query Firestore for documents with genre 'fantasy'
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('cards')
        .where('genre', isEqualTo: 'History')
        .get();

    // Extract and display data from the documents
    List<Map<String, dynamic>> fantasyBooksData = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    _showFantasyBooksScreen(context, fantasyBooksData[selectedIndex]);
  }

  void _onContainer2Tap(BuildContext context, int selectedIndex) async {
    // Query Firestore for documents with genre 'fantasy'
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('cards')
        .where('genre', isEqualTo: 'Humour')
        .get();

    // Extract and display data from the documents
    List<Map<String, dynamic>> fantasyBooksData = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    _showFantasyBooksScreen(context, fantasyBooksData[selectedIndex]);
  }

  void _onContainer3Tap(BuildContext context, int selectedIndex) async {
    // Query Firestore for documents with genre 'fantasy'
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('cards')
        .where('genre', isEqualTo: 'Horror')
        .get();

    // Extract and display data from the documents
    List<Map<String, dynamic>> fantasyBooksData = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    _showFantasyBooksScreen(context, fantasyBooksData[selectedIndex]);
  }

  void _onContainer4Tap(BuildContext context, int selectedIndex) async {
    // Query Firestore for documents with genre 'fantasy'
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('cards')
        .where('Title', isEqualTo: word.text)
        .get();

    // Extract and display data from the documents
    List<Map<String, dynamic>> fantasyBooksData = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    _showFantasyBooksScreens(context, fantasyBooksData[selectedIndex]);
  }

  void _showFantasyBooksScreens(BuildContext context, Map<String, dynamic> selectedBookData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(selectedBookData),
      ),
    );
  }

  void _showFantasyBooksScreen(BuildContext context, Map<String, dynamic> selectedBookData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Descriptions(selectedBookData),
      ),
    );
  }


}




class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}


class _NavigationDrawerState extends State<NavigationDrawer >{
  File? _image;


  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build (BuildContext context) => Drawer(
    backgroundColor: Color(0xff8599ff),

    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) => Container(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child: Column(
      children:[
        GestureDetector(
          onTap: _getImage,
        child:CircleAvatar(
          radius: 52,
          backgroundImage: _image != null ? FileImage(_image!) : null,
          child: _image == null
              ? Icon(Icons.camera_alt, size: 40)
              : null,
        ),
        ),
        SizedBox(height: 12),
        Text(
          'Dominion Salau',
          style: TextStyle(fontSize: 20, color: Colors.white,)
        ),
      ],
    ),
  );
  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
      children: [
  ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text( 'Home'),
    onTap:(){} ,
  ),

        ListTile(
          leading: const Icon(Icons.favorite_border),
          title: const Text( 'Favourite'),
          onTap:(){} ,
        ),

        ListTile(
          leading: const Icon(Icons.workspaces_outline),
          title: const Text( 'Workflow'),
          onTap:(){} ,
        ),

        ListTile(
          leading: const Icon(Icons.update),
          title: const Text( 'Updates'),
          onTap:(){} ,
        ),
        const Divider(color: Colors.white),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text( 'Notifications'),
          onTap:(){} ,
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text( 'LogOut'),
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Loginpage(),
              ),
            );
          } ,
        )

  ]
  )
  );

}





