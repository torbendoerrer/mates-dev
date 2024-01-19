import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firestore Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyFirestorePage(),
    );
  }
}

class MyFirestorePage extends StatelessWidget {
  const MyFirestorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Demo'),
      ),
      body: Center(
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('default').doc('Namen').get(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Fehler: ${snapshot.error}");
            } else if (snapshot.hasData) {
              return Text("Name: ${snapshot.data?.get('Name') ?? 'Nicht gefunden'}",
                          style: Theme.of(context).textTheme.headline6);
            } else {
              return const Text('Keine Daten gefunden');
            }
          },
        ),
      ),
    );
  }
}