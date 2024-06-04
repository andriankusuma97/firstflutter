import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  increment() => emit(state + 1);
  decrement() => emit(state - 1);
}

class GetPerson extends Cubit<int>{
  GetPerson(): super(1);
  getPerson()=>{

  };
}