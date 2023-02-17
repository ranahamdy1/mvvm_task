import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mvvm2/modules/counter/repo/counter_repo.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this._repo)
      : counterValue = _repo.getCounterValue(),
        super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);

  int counterValue = 0;
  final CounterRepo _repo;

  void incrementCounter() async {
    try {
      counterValue = await _repo.incrementCounter();
    } catch (message) {
      emit(CounterFailedState(message.toString()));
    }
  }

  void decrementCounter() async {
    try {
      counterValue = await _repo.decrementCounter();
    } catch (message) {
      emit(CounterFailedState(message.toString()));
    }
  }
  /*void increment() async {
    counter++;
    emit(CounterIncrementState());
  }

  void decrement() async {
    counter--;
    emit(CounterDecrementState());
  }*/
}
