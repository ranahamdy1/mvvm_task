import 'package:task_mvvm2/modules/counter/data_sources/data_sources.dart';

class CounterRepo {
  final CounterDataSource _dataSource;
  CounterRepo(this._dataSource);

  int getCounterValue() {
    try {
      return _dataSource.counterValue;
    } catch (e) {
      throw "error";
    }
  }

  Future<int> incrementCounter() async {
    try {
      await _dataSource.incrementValue();
      return _dataSource.counterValue;
    } catch (e) {
      throw "error";
    }
  }

  Future<int> decrementCounter() async {
    try {
      await _dataSource.decrementValue();
      return _dataSource.counterValue;
    } catch (e) {
      throw "error";
    }
  }
}
