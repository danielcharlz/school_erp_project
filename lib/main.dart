import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'loginpage.dart';

void main() {
  runApp(const StudentERPApp());
}

class StudentERPApp extends StatelessWidget {
  const StudentERPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student ERP",
      theme: AppTheme.lightTheme,
      home: LoginPage(),
    );
  }
}
