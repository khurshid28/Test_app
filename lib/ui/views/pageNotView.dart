import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Page Not found",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
