import 'package:dog_info/alert_dialog.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyHome());
}

class MyHome extends StatelessWidget{
  MyHome({super.key});
  
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      home: Scaffold(
        appBar: AppBar(centerTitle: true,foregroundColor: const Color.fromARGB(255, 4, 241, 4),backgroundColor: Colors.white,title: Text("Chip App"),),

        body: Center(
          child: Chip(label: const
          Text("Flutter App",style: TextStyle(fontSize: 15,color: Colors.white),), 
          backgroundColor:Colors.blueAccent,
          elevation: 5,
          shadowColor: Colors.black26,
          padding: EdgeInsets.all(10),)
         
        )
      ),
     );
  }

  
}