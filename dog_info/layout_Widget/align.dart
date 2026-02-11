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
      home: Scaffold( appBar: AppBar(foregroundColor: Colors.black, backgroundColor: Colors.purpleAccent,centerTitle: true,title: const Text("Align" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, ),)),
    

      body: Center(
        child: 
            Container(
              margin: EdgeInsets.all(10),
              width: 200,
              height: 200,
              color: const Color.fromARGB(255, 158, 209, 250),
              padding: EdgeInsets.all(10),
              child: Align(alignment: AlignmentGeometry.center,child: const FlutterLogo(size:100)),
              
            ),
            

    

        ),
      )
    );
  }
}