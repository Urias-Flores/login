import 'package:flutter/material.dart';
import 'package:login/src/constants/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 35, 125, 181)),
        useMaterial3: true,
      ),
      initialRoute: myRoutes.login.name,
      routes: routes,
    );
  }
}
