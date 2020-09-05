class User{
  int userId;
  int id;
  String title;
  String body;

  User({this.userId, this.id, this.title, this.body});

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      userId : json['userId'],
      id : json['id'],
      title : json['title'],
      body : json['body']
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["userId"] = userId;
    map["title"] = title;
    map["body"] = body;

    return map;
  }
}