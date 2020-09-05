import 'dart:convert';

import 'package:rest_call/data/constant.dart';
import 'package:rest_call/data/user.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<User> authUser(var id) async {
    var url = Constant.baseUrl + "posts/" + id;
    return http.get(url).then((http.Response response) {
      final int statusCode = response.statusCode;

      // if (statusCode < 200 || statusCode > 400 || json == null) {
      //   throw new Exception("Error while fetching data");
      // }
      if (statusCode == 404) {
        throw new Exception("No data found with given id =" + id);
      }

      return User.fromJson(json.decode(response.body));
    });
  }

  static Future<List<User>> getAllPost(var userId) async {
    var url = Constant.baseUrl + "posts?userId=" + userId;
    return http.get(url).then((http.Response response) {
      final int statusCode = response.statusCode;

      // if (statusCode < 200 || statusCode > 400 || json == null) {
      //   throw new Exception("Error while fetching data");
      // }
      if (statusCode == 404) {
        throw new Exception("No data found with given userId =" + userId);
      }
      final parsed = json.decode(response.body);
      return parsed.map<User>((json) => User.fromJson(json)).toList();
    });
  }
}
