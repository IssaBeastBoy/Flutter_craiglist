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

Widget _buildText(double fontSize, String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: fontSize,
      ),
    );
  }

  Widget _buildTextForm(TextEditingController controller,
      TextInputType inputType, String text, bool onbscure) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      obscureText: onbscure,
      decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Color.fromARGB(255, 235, 210, 165))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      _buildText(30, "All"),
                      SizedBox(
                        height: 10,
                      ),
                      _buildText(30, "IN ONE"),
                      SizedBox(
                        height: 10,
                      ),
                      _buildText(30, "Convenience")
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RotatedBox(
                    quarterTurns: -1,
                    child: _buildText(40, 'Sign up'),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              _buildTextForm(_name, TextInputType.text, 'Enter name', false),
              _buildTextForm(
                  _surname, TextInputType.text, 'Enter surname', false),
              _buildTextForm(
                  _email, TextInputType.emailAddress, 'Enter email', false),
              _buildTextForm(_password, TextInputType.emailAddress,
                  'Enter password', true),
              _buildTextForm(_confirm, TextInputType.emailAddress,
                  'Confirm password', true),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [                  
                  TextButton(
                      onPressed: (() {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      }),
                      child: Text(
                        'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color.fromARGB(255, 235, 210, 165),
                          ))),
                  ElevatedButton(
                    onPressed: (() {}),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Color.fromARGB(255, 6, 159, 175),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        )),
                  ),
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
