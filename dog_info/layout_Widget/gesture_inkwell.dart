import "package:flutter/material.dart";

void main(){

  runApp(MyHome());

}

class MyHome extends StatelessWidget{
  MyHome({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       appBar: AppBar(title: Text("Gesture & Inkwell"), centerTitle: true, foregroundColor: const Color.fromARGB(255, 7, 23, 255),),
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(onPressed: (){
              print("Hi Outlined Button Tapped");
            }, child: Text("Tap Me"),),

            SizedBox(height: 30),

            GestureDetector(
              child: Container(
                
                width: 200,
                height: 250,
                color: Colors.amberAccent,
                child: Center(child: Text("Tab Me"),),
              ),
              // ignore: avoid_print
              onTap: () { print("Hi Im from 1st Container");},
            ),

           SizedBox(height: 40,),

            InkWell(
              child: Container(
                width: 200,
                height: 150,
                color: Colors.purple,
                child: Center(child: Text("Tab Me",style: TextStyle(fontSize: 15),),
              ),),
              onDoubleTap: () {
                print("Hey Im from 2nd Container");
              },
            ),
          ],
       )
      )
    ),);
  }
  
}