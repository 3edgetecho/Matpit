import 'dart:convert';

import 'package:equatable/equatable.dart';

class PropertyTypeModel extends Equatable {
  final int id;
  final String image;
  final int serialNumber;
  final String name;

  const PropertyTypeModel({
    required this.id,
    required this.image,
    required this.serialNumber,
    required this.name,
  });

  factory PropertyTypeModel.fromMap(Map<String, dynamic> map) {
    return PropertyTypeModel(
      id: map['id'] as int,
      image: map['image'] as String,
      serialNumber: map['serial_number'] as int,
      name: map['name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'serial_number': serialNumber,
      'name': name,
    };
  }

  factory PropertyTypeModel.fromJson(String source) =>
      PropertyTypeModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  @override
  List<Object> get props => [id, image, serialNumber, name];
}
