import 'package:flutter/material.dart';
import 'package:flutter_first/shared/ui/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Button(
            text: 'Go Back',
            isPushBack: true,
          ),
        ],
      ),
    );
  }
}
