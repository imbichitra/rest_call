class Token {
  String token;
  String refreshtoken;
  

  Token.fromJson(Map<String, dynamic> json) {
    this.token = json['access_token'];
    this.refreshtoken = json['refresh_token'];
  }
}