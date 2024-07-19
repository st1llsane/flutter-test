// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _inputController = TextEditingController();

  var _counter = 0;

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

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _addCounterNumber(int number) {
    setState(() {
      _counter += number;
    });

    _inputController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter: ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              _counter.toString(),
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.green.shade200),
              ),
              child: Text("Increment"),
            ),
            ElevatedButton(
              onPressed: _decrementCounter,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red.shade200),
              ),
              child: Text("Decrement"),
            ),
            ElevatedButton(
              onPressed: _resetCounter,
              child: Text("Reset"),
            ),
            Text("or"),
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintText: "Enter number",
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  var num = int.tryParse(value) ?? 0;

                  _addCounterNumber(num);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
