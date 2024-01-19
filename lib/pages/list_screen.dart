import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List-Screen'),
      ),
      body: const Center(
        child: Text('List-Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}