import 'package:flutter/material.dart';
import 'package:task_mvvm2/view/home1.dart';
import 'model_view/shared_prefrence.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheData.cacheInitialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
