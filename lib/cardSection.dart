import 'package:flutter/material.dart';

class EButton extends StatelessWidget {
  String label;
  final dynamic color;
final Function onTab;
 EButton({ Key? key,required this.label,required this.color,required this.onTab }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
           children: [
      Divider(color: Colors.transparent,),//for making a space between the buttons
                 ElevatedButton( 
                   style: ElevatedButton.styleFrom(
                  fixedSize: const Size(170, 50),
                  primary: color,
                  ),
                 child:Text(label,style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold )) ,
                 onPressed:(){onTab();} ,
               )
           ]));
  }
}

class EPButton extends StatelessWidget {
  dynamic label;
  final dynamic color;
final Function onTab;
 EPButton({ Key? key,required this.label,required this.color,required this.onTab }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),//for making a space between the buttons
      child: Column(
           children: [
      
                 ElevatedButton( 
                   style: ElevatedButton.styleFrom(
                  fixedSize: const Size(50, 50),
                  primary: color,
                  ),
                 child:Icon(label) ,
                 onPressed:(){onTab();} ,
               )
           ]));
  }
  }

