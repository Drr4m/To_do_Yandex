import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyDismissibleWidget<T> extends StatelessWidget {
  final Widget child;
  final DismissDirectionCallback onDismissed;

  const MyDismissibleWidget({
    required this.child,
    required this.onDismissed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      child: child,
      background: SwipeActionLeft(),
      secondaryBackground: SwipeActionRight(),
    );
  }
}

Widget SwipeActionLeft() => Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
      color: const Color.fromRGBO(52, 199, 89, 1),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 24,
      ),
    );
Widget SwipeActionRight() => Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
      color: const Color.fromRGBO(255, 59, 48, 1),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
        size: 24,
      ),
    );
