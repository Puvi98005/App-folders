import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

abstract class CounterEvent{}

final class CounterInc extends CounterEvent{

}

final class CounterDec extends CounterEvent{

}

class CounterBloc extends Bloc<CounterEvent, int> 
{
   CounterBloc():super(0){

    
    
    on<CounterInc>((event, emit)  {
       emit(state+1);
    });

    on<CounterDec>((event, emit) {
      
      if(state==0){
      return;
    }
    
      emit(state-1);
      
    },);
   }
} 