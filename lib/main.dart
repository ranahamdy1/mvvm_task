import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_mvvm2/modules/counter/ui/home1.dart';
import 'core/cache_helper.dart';
import 'modules/counter/blocs/counter_cubit.dart';
import 'modules/counter/data_sources/data_sources.dart';
import 'modules/counter/repo/counter_repo.dart';

SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  //CacheData.cacheInitialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) =>
            CounterCubit(CounterRepo(CounterDataSource(sharedPreferences!))),
        /*/_repo: CounterRepo(
              _dataSource:
                  CounterDataSource(sharedPreferences: SharedPreferences))*/
        child: HomeScreen(),
      ),
    );
  }
}
