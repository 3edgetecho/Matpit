import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user_profile_model.dart';

class UserLoginResponseModel extends Equatable {
  final UserProfileModel user;
  final String accessToken;
  final String type;
  final int expiresIn;
  final String tokenType;
  const UserLoginResponseModel({
    required this.user,
    required this.accessToken,
    required this.expiresIn,
    required this.type,
    required this.tokenType,
  });

  UserLoginResponseModel copyWith({
    UserProfileModel? user,
    String? accessToken,
    String? type,
    int? expiresIn,
    String? tokenType,
  }) {
    return UserLoginResponseModel(
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
      expiresIn: expiresIn ?? this.expiresIn,
      type: type ?? this.type,
      tokenType: tokenType ?? this.tokenType,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'user': user.toMap()});
    result.addAll({'access_token': accessToken});
    result.addAll({'expires_in': expiresIn});
    result.addAll({'type': type});
    result.addAll({'token_type': tokenType});

    return result;
  }

  factory UserLoginResponseModel.fromMap(Map<String, dynamic> map) {
    return UserLoginResponseModel(
      user: UserProfileModel.fromMap(map['user']),
      accessToken: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2hvbWVjby5tYW11bnVpdXguY29tL2FwaS9zdG9yZS1sb2dpbiIsImlhdCI6MTc0NzI5NDcwOSwiZXhwIjoxNzQ3MzYzMTA5LCJuYmYiOjE3NDcyOTQ3MDksImp0aSI6IjREdFMyTVk2RFMzRmRJaW8iLCJzdWIiOiIxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.hLfb_7hN8E_wmc4frnqxL8-xPivcIkIe9p-TsPbOwJo',
      expiresIn: 68400,
      type: map["type"],
      tokenType:  'bearer',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginResponseModel.fromJson(String source) =>
      UserLoginResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserLoginResponseModel(user: $user, access_token: $accessToken, expires_in: $expiresIn, token_type: $tokenType)';
  }

  @override
  List<Object> get props => [
        user,
        expiresIn,
        tokenType,
        accessToken,
      ];
}
