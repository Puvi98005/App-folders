import 'package:dog_info/main.dart';
import'package:flutter/material.dart';

void main()
{
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Splashscreen(), debugShowCheckedModeBanner: false,);
  }
}

class Splashscreen extends StatefulWidget{
   const Splashscreen({super.key});
   
     @override
     State<StatefulWidget> createState() => _StatefulWidget();
    
  
}

class _StatefulWidget extends State<Splashscreen>{

  @override
  void initState(){
    super.initState();

    Future.delayed(const Duration(seconds:3),(){
      Navigator.push(context, MaterialPageRoute(builder:(context) => MyHome(),));
      },);
    }
    
      @override
      Widget build(BuildContext context) {
       return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(child: Image.asset('assets/dog_images/dog1.jpg', height: 200,width: 200, fit: BoxFit.cover,)),
              SizedBox(height: 20,),
              Text("Dog Info App", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),),
              SizedBox(height: 20,),
              Text("Loading", style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color> (Colors.white),
              )
            ],
          ),
        ),
       );
      }
  }
