import 'package:flutter/material.dart';

class ConstDemo extends StatefulWidget {
  const ConstDemo({Key? key}) : super(key: key);

  @override
  State<ConstDemo> createState() => _ConstDemoState();
}

class _ConstDemoState extends State<ConstDemo> {
  @override
  Widget build(BuildContext context) {
    debugPrint('*************** Build Called ******************');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Const Use Case'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GreenContainer(),
            const RedContainer(),
            const SizedBox(
              height: 20,
            ),
            GenericBtn(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Generic Button Pressed'),
                ));
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class RedContainer extends StatelessWidget {
  const RedContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Red Container');
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
    debugPrint('Green Container');
    return Container(
      height: 200,
      width: 200,
      color: Colors.green,
    );
  }
}

class GenericBtn extends StatelessWidget {
  const GenericBtn({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: const Text(
        'I am Generic Btn',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue.shade900,
    );
  }
}
