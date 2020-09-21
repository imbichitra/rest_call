import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_call/injector/injector.dart';
import 'package:rest_call/services/auth/api/api_auth_repository.dart';
import 'package:rest_call/services/user/user.dart';
import 'package:rest_call/storage/sharedpreferences/shared_preferences_manager.dart';

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User user = User();
  ApiAuthRepository repo = ApiAuthRepository();
  
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
                onPressed: ()async {
                  _formKey.currentState.save();
                  //LoginService2.getToken(jsonEncode(user.toJson()));
                final SharedPreferencesManager _sharedPreferencesManager = await SharedPreferencesManager.getInstance();
                 var data = await repo.loginUser(user.toJson());
                 await _sharedPreferencesManager.putString(SharedPreferencesManager.keyAccessToken, data.token);
                 await _sharedPreferencesManager.putString(SharedPreferencesManager.keyRefreshToken, data.refreshtoken);
                },
                child: Text('Login'),
              ),
              RaisedButton(
                onPressed: ()async {
                  repo.getlastLocation();
               
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
