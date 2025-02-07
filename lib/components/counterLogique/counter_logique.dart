import 'package:flutter/material.dart';


class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<ParentWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Compteur : $_counter"),
        SizedBox(height: 15),
        ChildWidget(
          onIncrementCounter: _incrementCounter,
          onDecrementCounter: _decrementCounter,
        )
      ],
    );
  }
}

//Widget Enfant
class ChildWidget extends StatefulWidget {
  final VoidCallback onIncrementCounter;
  final VoidCallback onDecrementCounter;

  const ChildWidget(
      {super.key,
      required this.onIncrementCounter,
      required this.onDecrementCounter});

  @override
  State<ChildWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: widget.onIncrementCounter, child: Text("Incrémenter")),
        SizedBox(height: 15),
        ElevatedButton(
            onPressed: widget.onDecrementCounter, child: Text("Decrémenter")),
      ],
    );
  }
}
