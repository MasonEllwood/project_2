import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'test@email.com'
      ),
      validator:(String value) {
        if (!value.contains('@')) {
          return 'Please enter a valid email';
        }

        return null;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password'
      ),
      validator: (String value) {
        if (value.length < 4) {
          return 'make password longer';
        }

        return null;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.deepOrangeAccent,
      onPressed: () {
        print(formKey.currentState.validate());
      },
      child: Text('Submit'),
    );
  }
}