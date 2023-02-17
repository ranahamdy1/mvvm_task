abstract class CounterState {}

class CounterInitialState extends CounterState {}

class CounterIncrementState extends CounterState {}

class CounterDecrementState extends CounterState {}

class CounterFailedState extends CounterState {
  String message;
  CounterFailedState(this.message);
}
