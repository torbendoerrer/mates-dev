import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mates/pages/home_screen.dart';
import 'package:mates/pages/signin_screen.dart';


class RoutingService {
  final router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ),
      GoRoute(
        path: '/signIn',
        builder: (BuildContext context, GoRouterState state) =>
            const SigninScreen(),
      ),
    ],

    // redirect to the login page if the user is not logged in
    redirect: (BuildContext context, GoRouterState state) async {
      final bool loggedIn = FirebaseAuth.instance.currentUser != null;
      final bool loggingIn = state.matchedLocation == '/signIn';
      if (!loggedIn) return '/signIn';
      if (loggingIn) return '/';
      return null;
    },
  );
}