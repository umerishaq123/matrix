import 'package:flutter/material.dart';

class Students extends StatelessWidget {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
        Center(child: Text("students"))
      ],),
    );
  }
}