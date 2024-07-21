import 'package:flutter/material.dart';
import 'package:flutter_first/shared/ui/button.dart' as button;
import 'package:flutter_first/shared/ui/logo.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              const SizedBox(height: 100),
              Column(
                children: [
                  Text(
                    "Just Do It",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Brand new sneakers and custom kicks made with premium quality!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  const SizedBox(height: 35),
                  const button.Button(
                    text: "Shop Now!",
                    theme: button.ButtonTheme.dark,
                    path: '/home-page',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
