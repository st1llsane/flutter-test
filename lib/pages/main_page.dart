import 'package:flutter/material.dart';
import 'package:flutter_first/shared/ui/logo.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
          child: Column(
            children: [
              const Logo(),
              const SizedBox(height: 80),
              Text(
                "Just Do It",
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Brand new sneakers and custom kicks made with premium quality!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
