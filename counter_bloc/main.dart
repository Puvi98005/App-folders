import 'package:counter_app_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home:BlocProvider(create: (context)=> CounterBloc(),
      child: MyHomePage(),
      ),
      debugShowCheckedModeBanner: false,
      
    );
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
     appBar: AppBar(centerTitle: true, title:  Text("Counter App", style: TextStyle(fontSize: 30,color: Colors.blueAccent),),),
     body: BlocBuilder<CounterBloc,int>(
      builder: (context,count){
        return Center(child: Text('$count', style: TextStyle(fontSize: 48),),);
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
         children: [
          FloatingActionButton(onPressed: (){
            counterBloc.add(CounterInc());
          } , child: Icon(Icons.add),),
          SizedBox(height: 20,),
          FloatingActionButton(onPressed: (){
            counterBloc.add(CounterDec());
          }, child: Icon(Icons.delete),)
         ],
      ),
    );
  }

}