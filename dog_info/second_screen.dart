import 'package:flutter/material.dart';

class Details extends StatelessWidget{
  String? text ;
   bool check;
  String? radio;
  bool switchvalue;


  Details({super.key, required this.text, required this.check, required this.radio, required this.switchvalue});
  
  @override
  Widget build(BuildContext context) { 
     
      return  Scaffold( 
        
        appBar: AppBar(centerTitle: true,foregroundColor: Colors.deepOrange,backgroundColor: const Color.fromARGB(255, 147, 208, 237),title: Text("User Data", style: TextStyle(fontSize: 20),),),

        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: 30,),
               Text("User Name: $text"),
               SizedBox(height: 30,),
               Text("Degree Status: ${check ? "Yes" : "No"}"),
               SizedBox(height: 30,),
               Text("Class : $radio"),
               SizedBox(height: 30,),
               Text("Are You Ready to Join : ${switchvalue ? "Yes" : "No "}"),

            ],
          ),
        )
      );
    
  }
  
}