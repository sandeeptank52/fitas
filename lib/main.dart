import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'myapp.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
