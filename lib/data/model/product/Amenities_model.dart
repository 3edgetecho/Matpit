/// id : 10
/// icon : "fas fa-parking"
/// status : 1
/// serial_number : 1
/// created_at : "2024-03-23T23:12:16.000000Z"
/// updated_at : "2024-03-23T23:12:16.000000Z"
/// amenity_content : {"id":20,"amenity_id":10,"language_id":20,"name":"Parking","created_at":"2024-03-23T23:12:16.000000Z","updated_at":"2024-03-23T23:12:16.000000Z"}

class AmenitiesModel {
  AmenitiesModel({
      num? id, 
      String? icon, 
      num? status, 
      num? serialNumber, 
      String? createdAt, 
      String? updatedAt, 
      AmenityContent? amenityContent,}){
    _id = id;
    _icon = icon;
    _status = status;
    _serialNumber = serialNumber;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _amenityContent = amenityContent;
}

  AmenitiesModel.fromJson(dynamic json) {
    _id = json['id'];
    _icon = json['icon'];
    _status = json['status'];
    _serialNumber = json['serial_number'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _amenityContent = json['amenity_content'] != null ? AmenityContent.fromJson(json['amenity_content']) : null;
  }
  num? _id;
  String? _icon;
  num? _status;
  num? _serialNumber;
  String? _createdAt;
  String? _updatedAt;
  AmenityContent? _amenityContent;
AmenitiesModel copyWith({  num? id,
  String? icon,
  num? status,
  num? serialNumber,
  String? createdAt,
  String? updatedAt,
  AmenityContent? amenityContent,
}) => AmenitiesModel(  id: id ?? _id,
  icon: icon ?? _icon,
  status: status ?? _status,
  serialNumber: serialNumber ?? _serialNumber,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  amenityContent: amenityContent ?? _amenityContent,
);
  num? get id => _id;
  String? get icon => _icon;
  num? get status => _status;
  num? get serialNumber => _serialNumber;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  AmenityContent? get amenityContent => _amenityContent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['icon'] = _icon;
    map['status'] = _status;
    map['serial_number'] = _serialNumber;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_amenityContent != null) {
      map['amenity_content'] = _amenityContent?.toJson();
    }
    return map;
  }

}

/// id : 20
/// amenity_id : 10
/// language_id : 20
/// name : "Parking"
/// created_at : "2024-03-23T23:12:16.000000Z"
/// updated_at : "2024-03-23T23:12:16.000000Z"

class AmenityContent {
  AmenityContent({
      num? id, 
      num? amenityId, 
      num? languageId, 
      String? name, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _amenityId = amenityId;
    _languageId = languageId;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  AmenityContent.fromJson(dynamic json) {
    _id = json['id'];
    _amenityId = json['amenity_id'];
    _languageId = json['language_id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _amenityId;
  num? _languageId;
  String? _name;
  String? _createdAt;
  String? _updatedAt;
AmenityContent copyWith({  num? id,
  num? amenityId,
  num? languageId,
  String? name,
  String? createdAt,
  String? updatedAt,
}) => AmenityContent(  id: id ?? _id,
  amenityId: amenityId ?? _amenityId,
  languageId: languageId ?? _languageId,
  name: name ?? _name,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get amenityId => _amenityId;
  num? get languageId => _languageId;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['amenity_id'] = _amenityId;
    map['language_id'] = _languageId;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}