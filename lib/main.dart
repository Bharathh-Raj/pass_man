import 'package:flutter/material.dart';

// import 'features/generate_password/presentation/pages/generate_password_page.dart';
import 'features/generate_password/presentation/pages/generate_password_page.dart';
// import 'features/login/presentation/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: LoginPage(),
      home: GeneratePasswordPage(),
    );
  }
}
