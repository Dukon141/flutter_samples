import 'package:flutter/material.dart';
import 'package:flutter_samples/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: [CustomButton(text: 'Notes', onPressed: () {})],
        ),
      ),
    );
  }
}
