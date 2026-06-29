/// id : 49
/// vendor_id : 57
/// agent_id : 0
/// featured_image : "682715950dc72.jpeg"
/// min_price : "3500000.00"
/// max_price : "5500000.00"
/// latitude : "26.196712"
/// longitude : "72.948081"
/// featured : 1
/// status : 1
/// state_id : null
/// city_id : null
/// created_at : "2025-05-16T10:38:13.000000Z"
/// updated_at : "2025-05-16T10:39:30.000000Z"
/// approve_status : 1
/// title : "VALLORA HEIGHTS"
/// slug : "vallora-heights"
/// address : "Suncity Farm, Boranada, Jodhpur"

class ProjectResponse {
  ProjectResponse({
      num? id, 
      num? vendorId, 
      num? agentId, 
      String? featuredImage, 
      String? minPrice, 
      String? maxPrice, 
      String? latitude, 
      String? longitude, 
      num? featured, 
      num? status, 
      dynamic stateId, 
      dynamic cityId, 
      String? createdAt, 
      String? updatedAt, 
      num? approveStatus, 
      String? title, 
      String? slug, 
      String? address,}){
    _id = id;
    _vendorId = vendorId;
    _agentId = agentId;
    _featuredImage = featuredImage;
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    _latitude = latitude;
    _longitude = longitude;
    _featured = featured;
    _status = status;
    _stateId = stateId;
    _cityId = cityId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _approveStatus = approveStatus;
    _title = title;
    _slug = slug;
    _address = address;
}

  ProjectResponse.fromJson(dynamic json) {
    _id = json['id'];
    _vendorId = json['vendor_id'];
    _agentId = json['agent_id'];
    _featuredImage = json['featured_image'];
    _minPrice = json['min_price'];
    _maxPrice = json['max_price'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _featured = json['featured'];
    _status = json['status'];
    _stateId = json['state_id'];
    _cityId = json['city_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _approveStatus = json['approve_status'];
    _title = json['title'];
    _slug = json['slug'];
    _address = json['address'];
  }
  num? _id;
  num? _vendorId;
  num? _agentId;
  String? _featuredImage;
  String? _minPrice;
  String? _maxPrice;
  String? _latitude;
  String? _longitude;
  num? _featured;
  num? _status;
  dynamic _stateId;
  dynamic _cityId;
  String? _createdAt;
  String? _updatedAt;
  num? _approveStatus;
  String? _title;
  String? _slug;
  String? _address;
ProjectResponse copyWith({  num? id,
  num? vendorId,
  num? agentId,
  String? featuredImage,
  String? minPrice,
  String? maxPrice,
  String? latitude,
  String? longitude,
  num? featured,
  num? status,
  dynamic stateId,
  dynamic cityId,
  String? createdAt,
  String? updatedAt,
  num? approveStatus,
  String? title,
  String? slug,
  String? address,
}) => ProjectResponse(  id: id ?? _id,
  vendorId: vendorId ?? _vendorId,
  agentId: agentId ?? _agentId,
  featuredImage: featuredImage ?? _featuredImage,
  minPrice: minPrice ?? _minPrice,
  maxPrice: maxPrice ?? _maxPrice,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  featured: featured ?? _featured,
  status: status ?? _status,
  stateId: stateId ?? _stateId,
  cityId: cityId ?? _cityId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  approveStatus: approveStatus ?? _approveStatus,
  title: title ?? _title,
  slug: slug ?? _slug,
  address: address ?? _address,
);
  num? get id => _id;
  num? get vendorId => _vendorId;
  num? get agentId => _agentId;
  String? get featuredImage => _featuredImage;
  String? get minPrice => _minPrice;
  String? get maxPrice => _maxPrice;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  num? get featured => _featured;
  num? get status => _status;
  dynamic get stateId => _stateId;
  dynamic get cityId => _cityId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get approveStatus => _approveStatus;
  String? get title => _title;
  String? get slug => _slug;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['vendor_id'] = _vendorId;
    map['agent_id'] = _agentId;
    map['featured_image'] = _featuredImage;
    map['min_price'] = _minPrice;
    map['max_price'] = _maxPrice;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['featured'] = _featured;
    map['status'] = _status;
    map['state_id'] = _stateId;
    map['city_id'] = _cityId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['approve_status'] = _approveStatus;
    map['title'] = _title;
    map['slug'] = _slug;
    map['address'] = _address;
    return map;
  }

}