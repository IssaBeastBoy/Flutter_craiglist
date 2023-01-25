import 'package:flutter/material.dart';

// Screens
import '../screens/loginScreen.dart';

class UserRegistre extends StatefulWidget {
  const UserRegistre({super.key});

  @override
  State<UserRegistre> createState() => _UserRegistreState();
}

class _UserRegistreState extends State<UserRegistre> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      height: 450,
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
                child: Text('Register'),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _name,
                decoration: InputDecoration(
                  labelText: 'Enter name',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _surname,
                decoration: InputDecoration(
                  labelText: 'Enter surname',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _email,
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
              TextFormField(
                obscureText: true,
                controller: _confirm,
                decoration: InputDecoration(
                  labelText: 'Confirm password',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (() {}), child: Text('Register')),
                  TextButton(
                      onPressed: (() {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      }),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.grey.shade400),
                      ))
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
