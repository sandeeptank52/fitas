import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitas/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'login/auth_service.dart';
import 'home/screen/home_screen.dart';
import 'login/screen/login_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService _auth = AuthService();
  User? _user;

  @override
  void initState() {
    super.initState();
    _authCheck();
  }

  Future<void> _authCheck() async {
    final User? user = _auth.getCurrentUser();
    if (user != null) {
      setState(() {
        _user = user;
      });
    }
  }

  void _signIn() async {
    final User? user = await _auth.signInWithGoogle();
    setState(() {
      _user = user;
    });
  }

  void _signOut() async {
    await _auth.signOut();
    setState(() {
      _user = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: AppTheme.myDarkTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.myDarkTheme,
      home: _user == null
          ? LoginPage(onSignIn: _signIn)
          : HomePage(onSignOut: _signOut),
    );
  }
}
