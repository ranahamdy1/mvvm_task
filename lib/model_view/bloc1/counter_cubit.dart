import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view/delay.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  static CounterCubit get(context) => BlocProvider.of(context);

  int counter = 0;

  Future<void> delay(int millis) async {
    print('delay start');
    await Future.delayed(Duration(microseconds: millis));
    print('delay end');
  }

  void increment() async {
    await delay(500);
    counter++;
    emit(CounterIncrement());
  }

  void decrement() async {
    await delay(500);
    counter--;
    emit(CounterDecrement());
  }
}
