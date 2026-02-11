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
      home: Scaffold( appBar: AppBar(foregroundColor: Colors.black, backgroundColor: Colors.purpleAccent,centerTitle: true,title: const Text("Container App" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, ),)),
    

      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: 200,
              height: 200,
              color: Colors.blue,
              padding: EdgeInsets.all(10),
              child: Center(child: Text("Hello"),),
            ),

            Container(
              margin: EdgeInsets.all(10),
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 66, 160, 237),
              padding: EdgeInsets.all(10),
             child: Center( child: Text("Hello"),),),

              Container(
              margin: EdgeInsets.all(10),
              width: 80,
              height: 80,
              color: const Color.fromARGB(255, 92, 171, 236),
              child: Center(child: Text("Hello"),),),
          ],
        ),
      )
    ),);
  }
}