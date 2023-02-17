import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter_cubit.dart';
import '../blocs/counter_state.dart';

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
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {},
      builder: (context, state) {
        final CounterCubit cubit = context.read<CounterCubit>();
        //final int counterValue = cubit.counterValue;
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
                          //CounterCubit.get(context).incrementCounter();
                          cubit.incrementCounter;
                        },
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 22),
                        )),
                    const SizedBox(width: 18),
                    //Text("${CounterCubit.get(context).counterValue}",
                    Text("${cubit.counterValue}",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 18),
                    ElevatedButton(
                        onPressed: () {
                          //CounterCubit.get(context).decrementCounter();
                          cubit.decrementCounter;
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
                      /*CacheData.setData(
                      key: 'counter',
                      value: CounterCubit.get(context).counterValue,
                    );*/
                    },
                    child: const Text(
                      "save data",
                      style: TextStyle(fontSize: 22),
                    )),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      /*debugPrint(
                        "counter is ${CacheData.getData(key: 'counter')}");*/
                    },
                    child: const Text(
                      "get data",
                      style: TextStyle(fontSize: 22),
                    )),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      /*CacheData.deleteData(key: 'counter');
                    debugPrint(CacheData.getData(key: 'counter'));*/
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
    );
  }
}
