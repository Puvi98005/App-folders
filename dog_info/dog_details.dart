
import 'package:flutter/material.dart';

class DogdetailsScreen extends StatelessWidget{

 final String? breed;
 final String? info;
 
 const DogdetailsScreen({super.key, required this.breed, required this.info});


  String getPath()
  {
   switch(breed)
   {
     case "Pug":
        return 'assets/dog_images/dog1.jpg';
      case "Beagle":
        return "assets/dog_images/dog2.png";
      case "Chow Chow":
        return "assets/dog_images/dog3.png";
      default:
        return "assets/dog_images/default.png";
   }
  }

  @override

  Widget build(BuildContext context)
  { 
    return Scaffold(
      
      appBar: AppBar(
        centerTitle:true, 
      title: Text(breed.toString()), 
      foregroundColor: Colors.orangeAccent,
      backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          children: <Widget>
          [ 
            Text("Dog : ${breed.toString()} ", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.brown),),
            SizedBox(height: 10,),
            SizedBox(height: 30,),
            Text("Image : ${breed.toString()}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.redAccent),),
            SizedBox(height: 10,),
            ClipOval(child: Image.asset(getPath(),height: 200, width: 200, fit: BoxFit.cover)),
            SizedBox(height: 30,),
            Text("About: ${info.toString()} ", style: TextStyle(fontSize: 18),),
          ],
        ),
      ),
    );
  }
}