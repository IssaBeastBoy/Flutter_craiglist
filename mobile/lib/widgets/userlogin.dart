import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screens
import '../screens/registreScreen.dart';

// Provider
import '../providers/auth_user.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailAddress.dispose();
    _password.dispose();
    super.dispose();
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

  Future<void> _submit() async {
    try {
      await Provider.of<Auth>(context, listen: false)
          .signIn(_emailAddress.text, _password.text);
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
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: _buildText(40, 'Sign in'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      _buildText(25, 'Be a buyer'),
                      _buildText(25, 'A vendor'),
                      _buildText(25, 'ALL IN ONE APP!'),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailAddress,
                validator: (value) {
                  if (value!.isEmpty || !value!.contains('@')) {
                    return "Invalid email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Enter email',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color.fromARGB(255, 235, 210, 165))
                ),
              ),
              TextFormField(
                obscureText: true,
                controller: _password,
                validator: (value) {
                  if (value!.isEmpty || value!.length < 5) {
                    return "Password too short";
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Enter password',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color.fromARGB(255, 235, 210, 165))
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: (() {}),
                    child: Container(
                      width: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Ok',
                            style: TextStyle(
                                color: Color.fromARGB(255, 6, 159, 175),
                                fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Color.fromARGB(255, 6, 159, 175),
                          )
                        ],
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [                                        
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'forgot Password',
                            style: TextStyle(
                                color: Color.fromARGB(255, 239, 224, 209),
                                fontSize: 16),
                          )),
                      TextButton(
                      onPressed: (() {
                        Navigator.pushNamed(context, RegistreScreen.routeName);
                      }),
                          child: Text('Register',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 239, 224, 209),
                                  fontSize: 16)))
                    ],
                  )
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
