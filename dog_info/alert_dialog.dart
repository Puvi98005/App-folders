
import 'package:flutter/material.dart';

void main(){
  runApp(MyHome());
}

class MyHome extends StatelessWidget{
  MyHome({super.key});
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: AlertDialogWidget(), debugShowCheckedModeBanner: false,);
  }
}

class AlertDialogWidget extends StatefulWidget{

  AlertDialogWidget({super.key});
  
  @override
  _alertDialog createState() => _alertDialog();
  
} 

class _alertDialog extends State<AlertDialogWidget>{
  double? _value =0.0;

  void _ShowSlider(value){
   showDialog(
       context: context, 
       builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Slider Value"),
          iconColor: Colors.amber,
          content: Text("Slider Values is $value"),
          actions: [
            OutlinedButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("close"))
          ],
        );
       });
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: const Text("Alert Dialog and Slider App"), foregroundColor: Colors.black87, backgroundColor: Colors.blueAccent,),

      body: Center(child: Column(
        children: [
          SizedBox(height: 20,),
          Text("Slider ", style: TextStyle(fontSize: 18, ) ) ,
          SizedBox(height: 20,),
          Slider(value: _value ?? 0.0, onChanged: (newValue){
            setState(() {
              _value = newValue;
            });
            
          }, min: 0.0,
          max: 100,
          divisions: 100,),

          ElevatedButton(onPressed: (){
            _ShowSlider(_value) ;
          }, child: const Text("Show Slider Value"))
        ],
      ),),
    );
  }

  
}
  
