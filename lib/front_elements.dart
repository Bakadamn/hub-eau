
import 'package:flutter/material.dart';
import 'package:hub_eau/main.dart';
import 'package:hub_eau/models/temperature.dart';
import 'main.dart';



Widget infoWindow(Size screenSize, BuildContext context, Temperature? temperature) {
 Widget widget;
  widget = Align(
  alignment: Alignment.bottomLeft,
  child:  Container(
   alignment: Alignment.center,
   height: screenSize.height/3,
   width: screenSize.width,
   color: Colors.blueAccent,
   child:
     Wrap(
      runSpacing: 10,
      spacing: 10,
      alignment: WrapAlignment.center,
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
       textInfo("Date de prélèvement : " +temperature!.date.toString()),
       textInfo("Température : "+temperature.resultat.toString()+"°C"),
       textInfo("Adresse : "+temperature.station!.libelle!)
      ],
     ),


  ),
 );

  return widget;
}

Text textInfo(String texte){
 return Text(
  texte,
  style: const TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.none),
 );

}