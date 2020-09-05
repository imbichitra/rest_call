import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rest_call/data/user.dart';
import 'package:rest_call/screens/alluser.dart';
import 'package:rest_call/services/auth/login_service.dart';
import 'package:rest_call/utils/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controller = TextEditingController();
  bool isLoading = false;
  User user;
  BuildContext mcontext;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future _fetchData(var id) async {
    setState(() => isLoading = true);
    try {
      user = await LoginService.authUser(id);
      SharedPrefrences.saveUser(user);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DisplayAllUser()),
      );
    } catch (e) {
      print(e);
      shoeSnakBar(e.toString());
    }
    setState(() => isLoading = false);
  }

  shoeSnakBar(var msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Id',
                    hintText: 'Enter Id',
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    _fetchData(controller.text.toString());
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(20.0, 10, 20.0, 0),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
