import 'package:flutter/material.dart';

void main()
{
  runApp(SnackbarWidget());
}

class SnackbarWidget extends StatelessWidget{
    SnackbarWidget({super.key});
    
      @override
      Widget build(BuildContext context) {
         return MaterialApp(home: Snackbar());
      }

}

class Snackbar extends StatefulWidget{
  Snackbar({super.key});

  @override
  
  _Snackbar createState() => _Snackbar();
}

class _Snackbar extends State<Snackbar> {
  String? _text  = " ";
  
  void _snackbarButton(){

    final snackBar = SnackBar(
      content: Text("This is SnackBar"),
      duration: Duration(seconds: 5),
      action: SnackBarAction(label: 'undo',
       onPressed: (){
         setState(() {
           _text = "Undo Button Clicked";
         });
       }),
       );

       ScaffoldMessenger.of(context).showSnackBar(snackBar);

   
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Snackbar"), centerTitle: true, foregroundColor: Colors.blue,backgroundColor: Colors.blueGrey,),
      
      body: Center(child: Column(
        children: [
          SizedBox(height: 30,),
          ElevatedButton(onPressed: _snackbarButton, child: Text("Show Snack Bar"), ),
          SizedBox(height: 20,),
          Text(_text.toString()),
        ],
      ),)
    );
    
  }

 
 
  
}