import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension IfDebugging on String {
  String? get ifDebugging => kDebugMode ? this : null;
}


extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandedEqually() => map(
        (w) => Expanded(
      flex: 1,
      child: w,
    ),
  );
}
