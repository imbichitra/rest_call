import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:rest_call/data/token.dart';
import 'package:rest_call/utils/dio_logging_interceptors.dart';

class ApiAuthProvider {
  final Dio _dio = new Dio();
  final String _baseUrl = 'https://aztrackapiqa.asiczen.com/api/';

  ApiAuthProvider() {
    _dio.options.baseUrl = _baseUrl;
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Future<Token> getTokenDio(var user) async {
    try {
      final response = await _dio.post(
        'user/login',
        data: user,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      Token t =Token.fromJson(response.data);
      //print(t.refreshtoken);
      //print(t.token);
      return t;
    } catch (error) {
      print(error.toString());
    }
  }

  Future<Token> getRefreshToken(String token,String refreshToken) async {
    //String url = "https://aztrackapiqa.asiczen.com/api/user/refreshtoken?refreshToken=$refreshToken";
    try{
     final response = await _dio.get(
        'user/refreshtoken?refreshToken=$refreshToken',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      Token t =Token.fromJson(response.data);
      print(t.refreshtoken);
      print(t.token);
      return t;
    }catch(e){
      print(e);
    }
  }

  Future<void> getlastLocation() async{
    //https://aztrackapiqa.asiczen.com/api/user/currentuser
  //String url = "https://aztrackapiqa.asiczen.com/api/analytics/lastpositiondtl";
      try{
      final response = await _dio.get(
        'user/currentuser',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );
      
      print(response.toString());
     
    }catch(e){
      print(e);
    }


  }

}
