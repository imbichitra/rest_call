import 'package:rest_call/data/constant.dart';
import 'package:rest_call/data/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrences {
  //static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(Constant.userId, user.userId);
    prefs.setInt(Constant.id, user.id);
    prefs.setString(Constant.title, user.title);
    prefs.setString(Constant.body, user.body);
  }

  static Future<User> getUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return User(
        userId: prefs.getInt(Constant.userId),
        id:prefs.getInt(Constant.id),
        title: prefs.getString(Constant.title),
        body: prefs.getString(Constant.body),
    );
  }
}
