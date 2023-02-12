import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model_view/bloc1/counter_cubit.dart';
import '../model_view/bloc1/counter_state.dart';
import '../model_view/shared_prefrence.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: const Icon(Icons.star),
              title: const Text("Counter"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            CounterCubit.get(context).increment();
                          },
                          child: const Text(
                            "+",
                            style: TextStyle(fontSize: 22),
                          )),
                      const SizedBox(width: 18),
                      Text("${CounterCubit.get(context).counter}",
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 18),
                      ElevatedButton(
                          onPressed: () {
                            CounterCubit.get(context).decrement();
                          },
                          child: const Text(
                            "-",
                            style: TextStyle(fontSize: 22),
                          )),
                    ],
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton(
                      onPressed: () {
                        CacheData.setData(
                          key: 'counter',
                          value: CounterCubit.get(context).counter,
                        );
                      },
                      child: const Text(
                        "save data",
                        style: TextStyle(fontSize: 22),
                      )),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        debugPrint(
                            "counter is ${CacheData.getData(key: 'counter')}");
                      },
                      child: const Text(
                        "get data",
                        style: TextStyle(fontSize: 22),
                      )),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        CacheData.deleteData(key: 'counter');
                        debugPrint(CacheData.getData(key: 'counter'));
                      },
                      child: const Text(
                        "delete data",
                        style: TextStyle(fontSize: 22),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
