import 'package:flutter/material.dart';

// Widgets
import '../widgets/userlogin.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UserLogin(),
      ],
    ));
  }
}
