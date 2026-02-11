import 'package:dog_info/second_screen.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyHome());
}

class MyHome extends StatelessWidget{
    MyHome({super.key});
    
      @override
      Widget build(BuildContext context) {
         return MaterialApp(home: Demo(), debugShowCheckedModeBanner: false,);
      }

}

class Demo extends StatefulWidget{
  Demo ({super.key});

  @override
  
  _Userinput createState() => _Userinput();
}

class _Userinput extends State<Demo> {
  bool _checkboxvalue = false;
  String _radiovalue = "option 1";
  bool _switchValue = false;
  final TextEditingController _texteditingController = TextEditingController();
  
  void _method(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Details(text: _texteditingController.text, check: _checkboxvalue, radio: _radiovalue, switchvalue: _switchValue)));
  }

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("User Input Widget"), centerTitle: true, foregroundColor: Colors.blue,backgroundColor: Colors.blueGrey,),
      
     body: Center(child: Column(
      children: <Widget> [
        SizedBox(height: 30,),

        Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: TextField(
            controller: _texteditingController,
            decoration: InputDecoration(
              labelText: "Enter your Name",
            ),
            
          ),
          
        ),
        SizedBox(height: 30,),

        Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Row(children: [
                
                Checkbox(value: _checkboxvalue, onChanged: (value){
                  setState(() {
                    _checkboxvalue = value!;
                    
                  }, );
                } ),
                const Text("I have completed my Degree"),
          ],),
        ),
        
        SizedBox(height: 30,),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsetsGeometry.all(10),
               child: Radio(value:"First", 
               groupValue: _radiovalue,
               onChanged: (value){
                setState(() {
                   _radiovalue = value!. toString();
                });
                      
               }, ),
             ),
             const Text("First class"),

             SizedBox(height: 30,),

              Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Radio(value:"Second", 
                             groupValue: _radiovalue,
                             onChanged: (value){
                setState(() {
                   _radiovalue = value!. toString();
                });
                      
                             }, ),
              ), const Text("Second class"), ],),

             
            
             SizedBox(height: 30,),
             
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
              Padding(padding: EdgeInsetsGeometry.all(10),

                child: Switch(value: _switchValue, onChanged: (value){
                    setState(() {
                      _switchValue = value!;
                    });
                }),
                
              ), 
               Text("Are You Ready to Join:"),
             ],),

             SizedBox(height: 20,),

             Column(children: [
              ElevatedButton(onPressed: _method, child: Text("Submit")),
             ],)
          ],
        
     ),),
        
      
    );
    
  }

 
 
  
}