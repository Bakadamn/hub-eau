import 'package:flutter/material.dart';
import 'package:hub_eau/main.dart';
import 'main.dart';



Widget infoWindow(Size screenSize, BuildContext context) {
 Widget widget;
  widget = Align(
  alignment: Alignment.bottomCenter,
  child:  Container(
   height: screenSize.height/3,
   width: screenSize.width,
   color: Colors.white,
   child: Row(
    children: [
     Column(
      mainAxisSize: MainAxisSize.max,
      children: [
       textInfo("Nom de la station", ),
       textInfo("Code station"),
      ],
     ),
     Column(
      children: [
       textInfo('Temperature')
      ],
     ),
     Align(
         alignment: Alignment.topRight,
         child:  ElevatedButton(
             onPressed: () {widget = Container();},
             child: Icon(Icons.close))
     ),

    ],

   ),
  ),
 );

  return widget;
}

Text textInfo(String texte){
 return Text(
  texte,
  style: TextStyle(fontSize: 11, color: Colors.black),
 );

}