import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialmedia/providers/auth_provider.dart';
import 'package:socialmedia/providers/post_provider.dart';
import 'package:socialmedia/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> PostProvider()),
        ChangeNotifierProvider(create: (context)=>AuthProvider())
      ],
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
        home: LoginScreen()
      ),
    );
  }
}
