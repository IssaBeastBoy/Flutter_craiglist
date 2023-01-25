import 'package:flutter/material.dart';

// Widgets
import '../widgets/userRegistre.dart';

class RegistreScreen extends StatelessWidget {
  static const routeName = '/registre';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UserRegistre(),
      ],
    ));
  }
}
