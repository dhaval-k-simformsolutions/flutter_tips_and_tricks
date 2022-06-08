import 'package:flutter/material.dart';
import 'package:flutter_goal_demo/debouncer.dart';
import 'package:flutter_goal_demo/extensions.dart';

class ExtensionDemo extends StatelessWidget {
  final textEditController = TextEditingController(text: "Dhaval".ifDebugging);

  final String appBarTitle;

  final debouncer = Debouncer(milliseconds: 1000);

  ExtensionDemo({Key? key, required this.appBarTitle})
      : assert(
          appBarTitle.isNotEmpty,
          'A non-null String must be provided as App bar title.',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
                controller: textEditController,
                onChanged: (val) {
                  debouncer.run(() {
                    debugPrint('Text field content is $val');
                  });
                  // debugPrint('Text field content is $val');
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 200,
                  width: 10,
                  color: Colors.yellow,
                ),
                Container(
                  height: 200,
                  width: 10,
                  color: Colors.blue,
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    width: 100,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    width: 10,
                    color: Colors.green,
                  ),
                ),
              ] /*.expandedEqually().toList()*/,
            )
          ],
        ),
      ),
    );
  }
}
