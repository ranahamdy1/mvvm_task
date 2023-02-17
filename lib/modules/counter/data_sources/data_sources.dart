import 'package:shared_preferences/shared_preferences.dart';

class CounterDataSource {
  CounterDataSource(this.sharedPreferences);
  SharedPreferences sharedPreferences;
  int get counterValue => sharedPreferences.getInt('key') ?? 0;

  Future<bool> incrementValue() {
    return sharedPreferences.setInt('key', counterValue + 1);
  }

  Future<bool> decrementValue() {
    return sharedPreferences.setInt('key', counterValue - 1);
  }
}
