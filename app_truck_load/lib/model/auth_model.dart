import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  String accessToken;
  String tokenType;
  int expiresIn;

  Auth({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
