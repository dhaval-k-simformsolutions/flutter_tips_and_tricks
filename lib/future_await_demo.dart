import 'dart:async';

import 'package:flutter/material.dart';

class FutureAwaitDemo extends StatefulWidget {
  const FutureAwaitDemo({Key? key}) : super(key: key);

  @override
  State<FutureAwaitDemo> createState() => _FutureAwaitDemoState();
}

class _FutureAwaitDemoState extends State<FutureAwaitDemo> {
  bool _result1 = false;
  bool _result2 = false;
  bool _result3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Corona Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Vatsal Tanna ${_result1 ? 'Positive' : 'Negative'}'),
            Text('Devarsh Ranpara ${_result2 ? 'Positive' : 'Negative'}'),
            Text('Ankit Panchal ${_result3 ? 'Positive' : 'Negative'}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          // final r1 = await doCoronaTest();
          //
          // setState(() {
          //   _result1 = r1;
          // });
          // final r2 = await doCoronaTest();
          //
          // setState(() {
          //   _result2 = r2;
          // });
          // final r3 = await doCoronaTest();
          //
          // setState(() {
          //   _result3 = r3;
          // });


          final results = await Future.wait([doCoronaTest(),doCoronaTest(),doCoronaTest()]);
          setState((){
            _result1 = results[0];
            _result2 = results[0];
            _result3 = results[0];
          });
          debugPrint('APi Calls Completes');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<bool> doCoronaTest() async {
    await Future.delayed(const Duration(seconds: 2));
    debugPrint('Corona Test Completed');
    return true;
  }
}
