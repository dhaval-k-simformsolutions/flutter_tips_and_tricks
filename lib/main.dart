import 'package:flutter/material.dart';
import 'package:flutter_goal_demo/activity_screen.dart';
import 'package:flutter_goal_demo/loop_demo.dart';

import 'const_demo.dart';
import 'extension_demo.dart';
import 'future_await_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ExtensionDemo(
                      appBarTitle: 'Extensions',
                    ),
                  ),
                );
              },
              child: const Text(
                'Extensions & Assert',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green.shade900,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ConstDemo(),
                  ),
                );
              },
              child: const Text('Const Keyword'),
              color: Colors.yellow.shade600,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoopDemo()));
              },
              child: const Text(
                'Loop Demo',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red.shade900,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FutureAwaitDemo()));
              },
              child: const Text(
                'Future Calls',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlue.shade900,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ActivityScreen()));
              },
              child: const Text(
                'Activity',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.purpleAccent.shade700,
            )
          ],
        ),
      ),
    );
  }
}

class SingleTonClass {
  static final SingleTonClass _singleton = SingleTonClass._internal();

  factory SingleTonClass() {
    return _singleton;
  }

  SingleTonClass._internal();
}

class RedContainer extends StatelessWidget {
  const RedContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Red Container');
    return Container(
      height: 200,
      width: 200,
      color: Colors.red,
    );
  }
}

class GreenContainer extends StatelessWidget {
  const GreenContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Green Container');
    return Container(
      height: 200,
      width: 200,
      color: Colors.green,
      child: ListView.builder(
        itemBuilder: (context, index) => Card(),
        itemCount: 5,
      ),
    );
  }
}
