import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rest_call/data/user.dart';
import 'package:rest_call/services/auth/login_service.dart';
import 'package:rest_call/utils/shared_preferences.dart';

class DisplayAllUser extends StatefulWidget {
  @override
  _DisplayAllUserState createState() => _DisplayAllUserState();
}

class _DisplayAllUserState extends State<DisplayAllUser> {
  List<User> users;

  Future getUser() async {
    try {
      User user = await SharedPrefrences.getUser();
      List<User> data = await LoginService.getAllPost(user.userId.toString());
      setState(() {
        users = data;
      });
    } catch (e) {
      print(e);
    }
  }

  Future getUserData(var userId) async {
    try {
      List<User> data = await LoginService.getAllPost(userId);
      setState(() {
        users = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Post"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      users = null;
                    });
                    getUserData("1");
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.teal,
                            Colors.teal[200],
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(5, 5),
                              blurRadius: 10)
                        ]),
                    child: Center(
                      child: Text(
                        'Get one',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      users = null;
                    });
                    getUserData("2");
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.teal,
                            Colors.teal[200],
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(5, 5),
                              blurRadius: 10)
                        ]),
                    child: Center(
                      child: Text(
                        'Get two',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      users = null;
                    });
                    getUserData("3");
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.teal,
                            Colors.teal[200],
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(5, 5),
                              blurRadius: 10)
                        ]),
                    child: Center(
                      child: Text(
                        'Get Three',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: users == null
                ? Container(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SpinKitFoldingCube(
                            color: Colors.black,
                            size: 50.0,
                          )
                        ],
                      ),
                    ],
                  ))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: users == null ? 0 : users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                getText("User Id", users[index].userId),
                                SizedBox(
                                  height: 10,
                                ),
                                getText("Title", users[index].title),
                                SizedBox(
                                  height: 10,
                                ),
                                getText("Data", users[index].body),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget getText(var key, var msg) {
    return Text(
      '$key : $msg',
      style: TextStyle(
        fontSize: 25,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
