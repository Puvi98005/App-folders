
import "package:dog_info/My_App/login_page.dart";
import "package:flutter/material.dart";



void main()
{
   runApp(MyApp());
}

class MyApp extends StatelessWidget{

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(), debugShowCheckedModeBanner: false,
    );
  }

}


class MyHome extends StatefulWidget{
  @override
   _splash createState() => _splash();

}

class _splash extends State<MyHome> {

  void initState(){

    super.initState();

    Future.delayed( Duration(seconds: 2), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), ),);
    },);

  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: const Color.fromARGB(255, 192, 241, 146),
      appBar: AppBar(centerTitle: true,title:Text("Electronic Products App"), foregroundColor: const Color.fromARGB(255, 254, 254, 253), backgroundColor: const Color.fromARGB(255, 110, 255, 7),),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            //ClipOval(child: Image.asset("assets/dog_images/login.png", height: 200, width: 200, fit: BoxFit.cover,)),
            SizedBox(height: 30,),
            Text("App Loading", style: TextStyle(fontSize: 18),),
            SizedBox(height: 30,),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color> (Colors.white),
            )
          ],
        ),
      ),
     );
  }

}