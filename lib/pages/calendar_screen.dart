import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar-Screen'),
      ),
      body: const Center(
        child: Text('Calendar-Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}