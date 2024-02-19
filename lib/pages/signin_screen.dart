import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/authentication_provider.dart';
import 'package:go_router/go_router.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signin-Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _signin(context),
              child: const Text('Sign In'),
            ),
            ElevatedButton(
  onPressed: () {
    context.go('/signup'); // Stelle sicher, dass der Pfad korrekt ist
  },
  child: const Text('SignUp'),
),
          ],
          
        ),
      ),
    );
  }

Future<void> _signin(BuildContext context) async {
  try {
    await Provider.of<AuthenticationProvider>(context, listen: false)
        .signIn(email: _emailController.text, password: _passwordController.text);
    context.go('/home'); // Stelle sicher, dass der Pfad korrekt ist
  } on Exception catch (e) {
    setState(() {
      _errorMessage = e.toString();
    });
  }
}

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}