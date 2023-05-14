import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/src/widgets/framework.dart';

class TestFuture extends StatefulWidget {
  const TestFuture({super.key});

  @override
  State<TestFuture> createState() => _TestFutureState();
}

class _TestFutureState extends State<TestFuture> {
  String text = 'Textti alip kel';
  void getText() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'text',
              style: TextStyle(fontSize: 35),
            ),
            Text(
              'Salam',
              style: TextStyle(fontSize: 35),
            )
          ],
        ),
      ),
    );
  }
}
