import 'package:Dominion/Description2.dart';
import 'package:Dominion/description.dart';
import 'package:Dominion/slick.dart';
import 'package:Dominion/slick2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Dominion/HomePage.dart';
import 'package:provider/provider.dart';



class tireds extends StatefulWidget {

  const tireds({super.key});

  @override
  State<tireds> createState() => _tiredsState();
}



class _tiredsState extends State<tireds> {
  bool _isTapped = false;
  bool _isTapped1 = false;
  bool _isTapped2 = false;
  bool _isTapped3 = false;

  @override
  Widget build(BuildContext context){
    return SafeArea(
      top: false,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 12,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              // color: Color(0xff970690),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(13),
              //   topRight: Radius.circular(13),
              // )
          ),
          child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState((){
                        _isTapped = !_isTapped;
                         _isTapped1 = false;
                         _isTapped2 = false;
                         _isTapped3 = false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.home_outlined,
                      size: 40,
                      color: _isTapped ? Color(0xff8599ff): Colors.grey,

                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState((){
                        _isTapped1 = !_isTapped1;
                        _isTapped = false;
                        _isTapped2 = false;
                        _isTapped3 = false;
                      });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: _navigateToStarRatingScreen,
                      //   ),
                      // );
                    },
                    child: Icon(
                      Icons.widgets,
                      size: 40,
                      color: _isTapped1 ? Color(0xff8599ff) : Colors.grey,

                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState((){
                        _isTapped3 = !_isTapped3;
                        _isTapped1 = false;
                        _isTapped2 = false;
                        _isTapped = false;
                      });
                      List<Map<String, dynamic>> cartItems = [];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                             builder: (context) => FantasyBooksScreen(cartItems),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.shopping_cart,
                      size: 40,
                      color: _isTapped3 ? Color(0xff8599ff) : Colors.grey,

                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState((){
                        _isTapped2 = !_isTapped2;
                        _isTapped1 = false;
                        _isTapped = false;
                        _isTapped3 = false;
                      });
                    },
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: _isTapped2 ? Color(0xff8599ff) : Colors.grey,

                    ),
                  ),
                ),
              ],
          )
      ),
    );
  }


}