import 'package:dog_info/alert_dialog.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyHome());
}

class MyHome extends StatelessWidget{
  MyHome({super.key});
  
  @override
  Widget build(Object context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(centerTitle: true,foregroundColor: Colors.blueGrey,backgroundColor: Colors.white70,title: Text("CARD APP"),),

        body: Center(
          child: Card(
               elevation: 10,
               shadowColor: Colors.blueGrey,
               shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
               color: Colors.blueGrey,
               
                child: 
                  Container(
                    width: 200,
                    height: 150,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Flutter App", style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 20),
                        Image.asset("assets/dog_images/image.jpg"),
                        Text("Hello This is FLutter Card"),
                      ],
                    )
                    
                  )
                ),
               ),
          ),
        );
      
    
  }
  
}