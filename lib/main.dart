import 'package:architecture_proposal/modules/auth/presenter/pages/auth_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Architecture Proposal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(),
    );
  }
}
