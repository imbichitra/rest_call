import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_call/services/login2_service.dart';
import 'package:rest_call/services/user/user.dart';

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User user = User();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onSaved: (String value) {
                  user.username = value;
                },
                decoration: InputDecoration(
                    hintText: 'Enter User id',
                    labelText: 'User id',
                    border: OutlineInputBorder()),
              ),
              TextFormField(
                onSaved: (String value) {
                  user.password = value;
                },
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    labelText: 'Password',
                    border: OutlineInputBorder()),
              ),
              RaisedButton(
                onPressed: () {
                  _formKey.currentState.save();
                  LoginService2.getToken(jsonEncode(user.toJson()));
                },
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
