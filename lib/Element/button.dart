import 'package:flutter/material.dart';

abstract class Button extends StatelessWidget{
  final String title;
  final Function() callBack;

  const Button({super.key, 
    required this.title,
    required this.callBack,
  });
}

class AndroidButton extends Button {
  const AndroidButton ({
    super.key, 
    required super.title, 
    required super.callBack,
    });
  
  @override
  Widget build(BuildContext context) {
   return ElevatedButton (
    style: const ButtonStyle(
    backgroundColor: WidgetStatePropertyAll<Color>(Colors.red)
  ), 
    onPressed: super.callBack,
    child: Text(super.title),
    );
  }
}

class IOSButton extends Button {
  const IOSButton ({super.key, required super.title, required super.callBack,});
  
  @override
  Widget build(BuildContext context) {
   return ElevatedButton (
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red, 
      shadowColor: Colors.amber, 
      foregroundColor: Colors.white), 
    onPressed: super.callBack,
    child: Text(super.title,),
    );
  }
}