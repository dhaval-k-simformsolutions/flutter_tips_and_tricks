import 'package:flutter/material.dart';

class LoopDemo extends StatefulWidget {
  const LoopDemo({Key? key}) : super(key: key);

  @override
  State<LoopDemo> createState() => _LoopDemoState();
}

class _LoopDemoState extends State<LoopDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loops'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          forEachLoop();
          forInLoop();
          forLoop();
          // checkOperators();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  final previousArrya = [88, 99, 111];
  var array = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    // ...[111, 112, 113],
  ];

  void checkOperators() {
    array.addAll([...previousArrya]);
    final take = array.takeWhile((value) => value > 5); //
    final skip = array.skipWhile((value) => value < 5);
    final every = array.every((value) => value > 5);
    final where = array.where((value) => value > 5);
    final firstWhere = array.firstWhere((element) => element == 5);
    final indexWhere = array.indexWhere((element) => element == 5);
    final join = array.join(',');

    array.map((e) => '$e,').toList(); // 1,2,3,4,5,6,7,8,9,

    debugPrint("Take while $take");
    debugPrint("skip while $skip");
    debugPrint("every $every");
    debugPrint("where $where");
    debugPrint("firstWhere $firstWhere");
    debugPrint("indexWhere $indexWhere");
    debugPrint("join $join");
  }

  void forInLoop() {
    for (var element in array) {
      if (element == 5) {
        return;
      }
      debugPrint('for in $element');
    }
  }

  void forLoop() {
    for (int i = 0; i < array.length; i++) {
      if (array[i] == 5) {
        return;
      }
      debugPrint('for loop ${array[i]}');
    }
  }

  void forEachLoop() {
    array.forEach((element) {
      if (element == 5) {
        return;
      }
      debugPrint('for each $element');
    });
  }
}
