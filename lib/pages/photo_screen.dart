import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo-Screen'),
      ),
      body: const Center(
        child: Text('Photo-Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}