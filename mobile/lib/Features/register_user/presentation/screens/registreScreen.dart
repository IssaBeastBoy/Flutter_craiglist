import 'package:flutter/material.dart';

// Widgets
import '../widgets/userRegistre.dart';

class RegistreScreen extends StatelessWidget {
  static const routeName = '/registre';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 151, 12, 89),
            Color.fromARGB(255, 159, 114, 45),
            Color.fromARGB(255, 6, 159, 175),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserRegistre(),
          ],
        ),
      ),
    ));
  }
}
