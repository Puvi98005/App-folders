import'package:flutter/material.dart';

void main()
{
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold( appBar: AppBar(foregroundColor: Colors.black, backgroundColor: Colors.purpleAccent,centerTitle: true,title: const Text("Stack" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, ),)),
    

      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: 200,
              height: 200,
              color: Colors.blue,
              padding: EdgeInsets.all(10),
            ),

            Container(
              margin: EdgeInsets.all(10),
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 66, 237, 106),
              padding: EdgeInsets.all(10),
             ),

              Container(
              margin: EdgeInsets.all(10),
              width: 50,
              height: 50,
              color: const Color.fromARGB(255, 237, 196, 153),
              child:Align(child: const FlutterLogo(size:200)),
              ),
             
              
          ],
        ),
      )
    ),);
  }
}