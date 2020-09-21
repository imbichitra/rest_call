import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:http/io_client.dart';

class LoginService2 {
  static final String url = 'https://aztrackapiqa.asiczen.com/api/user/login';

  static Future<void> getToken(var user) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      'Accept': 'application/json'
    };
    try {
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      final http = new IOClient(ioc);

      var response = await http.post(url, body: user, headers: headers);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print(json['access_token']);
        print(json['expires_in']);
        print(json['refresh_token']);
        print(json['role']);
        print(json['preferredName']);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
