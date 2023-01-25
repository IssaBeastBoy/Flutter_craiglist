import 'package:flutter/material.dart';

// Screens
import '../screens/registreScreen.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      height: 300,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300, //color of border
            width: 2, //width of border
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
              child: Column(
            children: [
              Center(
                child: Text('Login'),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailAddress,
                decoration: InputDecoration(
                  labelText: 'Enter email',
                ),
              ),
              TextFormField(
                obscureText: true,
                controller: _password,
                decoration: InputDecoration(
                  labelText: 'Enter password',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (() {}), child: Text('Submit')),
                  TextButton(
                      onPressed: (() {
                        Navigator.pushNamed(context, RegistreScreen.routeName);
                      }),
                      child: Text('Register'))
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
