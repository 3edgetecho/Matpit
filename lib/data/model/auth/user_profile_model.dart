import 'dart:convert';
import 'package:equatable/equatable.dart';

class UserProfileModel extends Equatable {
  final int id;
  final String? name;
  final String? userName;
  final String? email;
  final String? image;
  final String? phone;
  final String? city;
  final String? state;
  final String? address;
  final int? status;

  const UserProfileModel({
    required this.id,
    this.name,
    this.userName,
    this.email,
    this.image,
    this.phone,
    this.city,
    this.state,
    this.address,
    this.status,
  });

  UserProfileModel copyWith({
    int? id,
    String? name,
    String? userName,
    String? email,
    String? image,
    String? phone,
    String? city,
    String? state,
    String? address,
    int? status,
  }) {
    return UserProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      image: image ?? this.image,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      state: state ?? this.state,
      address: address ?? this.address,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': userName,
      'email': email,
      'image': image,
      'phone': phone,
      'city': city,
      'state': state,
      'address': address,
      'status': status,
    };
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      id: map['id'] ?? 0,
      name: map['name'],
      userName: map['username'],
      email: map['email'],
      image: map['image'],
      phone: map['phone'],
      city: map['city'],
      state: map['state'],
      address: map['address'],
      status: map['status'] != null ? int.tryParse(map['status'].toString()) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromJson(String source) =>
      UserProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
    id,
    name,
    userName,
    email,
    image,
    phone,
    city,
    state,
    address,
    status,
  ];
}
