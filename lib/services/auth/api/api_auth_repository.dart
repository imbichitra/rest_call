import 'package:rest_call/data/token.dart';

import 'api_auth_provider.dart';

class ApiAuthRepository {
  final ApiAuthProvider _apiAuthProvider = ApiAuthProvider();

  Future<Token> loginUser(user)=>_apiAuthProvider.getTokenDio(user);

  Future<Token> refreshToken(acc,ref)=>_apiAuthProvider.getRefreshToken(acc,ref);

  Future<void> getlastLocation()=>_apiAuthProvider.getlastLocation();
}