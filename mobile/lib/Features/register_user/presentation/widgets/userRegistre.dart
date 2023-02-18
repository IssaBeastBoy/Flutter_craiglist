import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Feature
import '../../../user_login/Presentation/screens/loginScreen.dart';

// Provider
import '../../../../providers/auth_user.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _name.dispose();
    _surname.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
      await Provider.of<Auth>(context, listen: false)
          .registerUser(_name.text, _surname.text, _email.text, _password.text);
    } catch (error) {
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Center(
                  child: Text('Ooops!'),
                ),
                content: Text(error.toString()),
                actions: [
                  TextButton(
                      onPressed: (() {
                        Navigator.of(context).pop();
                      }),
                      child: Text('Okay'))
                ],
              )));
    }
  }

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
      TextInputType inputType, String text, bool onbscure, String field) {
    return TextFormField(
      keyboardType: inputType,
      style: TextStyle(color: Colors.white),
      controller: controller,
      obscureText: onbscure,
      validator: (value) {
        if (field == "name") {
          if (value!.isEmpty) {
            return "Please enter name";
          }
          return null;
        } else if (field == "surname") {
          if (value!.isEmpty) {
            return "Please enter name";
          }
          return null;
        } else if (field == "email") {
          if (value!.isEmpty || !value!.contains('@')) {
            return "Invalid email";
          }
          return null;
        } else if (field == "password") {
          if (value!.isEmpty || value!.length < 5) {
            return "Password too short";
          }
          return null;
        } else if (field == "confirm") {
          if (value!.isEmpty || value!.trim() != _password.text.trim()) {
            return "Password does not match";
          }
          return null;
        }
      },
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
            key: _formKey,
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
                _buildTextForm(
                    _name, TextInputType.text, 'Enter name', false, "name"),
                _buildTextForm(_surname, TextInputType.text, 'Enter surname',
                    false, "surname"),
                _buildTextForm(_email, TextInputType.emailAddress,
                    'Enter email', false, "email"),
                _buildTextForm(_password, TextInputType.emailAddress,
                    'Enter password', true, "password"),
                _buildTextForm(_confirm, TextInputType.emailAddress,
                    'Confirm password', true, "confirm"),
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
                        child: Text('Login',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Color.fromARGB(255, 235, 210, 165),
                            ))),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _submit();
                        }
                      },
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
            ),
          )
        ],
      ),
    );
  }
}
