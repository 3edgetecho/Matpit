/// id : 54
/// vendor_id : 60
/// agent_id : 0
/// featured_image : "68357ee6db31d.jpeg"
/// min_price : "3200000.00"
/// max_price : "3400000.00"
/// latitude : null
/// longitude : null
/// video_link : "https://youtu.be/JaTZOH_zqWU?feature=shared"
/// banner_image : "683e9c191f01e.jpeg"
/// project_pdf : null
/// featured : 0
/// status : 1
/// state_id : "29"
/// city_id : "1090"
/// created_at : "2025-05-27T08:59:18.000000Z"
/// updated_at : "2025-06-03T06:54:17.000000Z"
/// approve_status : 1

class HomeSlider {
  HomeSlider({
      num? id, 
      num? vendorId, 
      num? agentId, 
      String? featuredImage, 
      String? minPrice, 
      String? maxPrice, 
      dynamic latitude, 
      dynamic longitude, 
      String? videoLink, 
      String? bannerImage, 
      dynamic projectPdf, 
      num? featured, 
      num? status, 
      String? stateId, 
      String? cityId, 
      String? createdAt, 
      String? updatedAt, 
      num? approveStatus,}){
    _id = id;
    _vendorId = vendorId;
    _agentId = agentId;
    _featuredImage = featuredImage;
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    _latitude = latitude;
    _longitude = longitude;
    _videoLink = videoLink;
    _bannerImage = bannerImage;
    _projectPdf = projectPdf;
    _featured = featured;
    _status = status;
    _stateId = stateId;
    _cityId = cityId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _approveStatus = approveStatus;
}

  HomeSlider.fromJson(dynamic json) {
    _id = json['id'];
    _vendorId = json['vendor_id'];
    _agentId = json['agent_id'];
    _featuredImage = json['featured_image'];
    _minPrice = json['min_price'];
    _maxPrice = json['max_price'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _videoLink = json['video_link'];
    _bannerImage = json['banner_image'];
    _projectPdf = json['project_pdf'];
    _featured = json['featured'];
    _status = json['status'];
    _stateId = json['state_id'];
    _cityId = json['city_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _approveStatus = json['approve_status'];
  }
  num? _id;
  num? _vendorId;
  num? _agentId;
  String? _featuredImage;
  String? _minPrice;
  String? _maxPrice;
  dynamic _latitude;
  dynamic _longitude;
  String? _videoLink;
  String? _bannerImage;
  dynamic _projectPdf;
  num? _featured;
  num? _status;
  String? _stateId;
  String? _cityId;
  String? _createdAt;
  String? _updatedAt;
  num? _approveStatus;
HomeSlider copyWith({  num? id,
  num? vendorId,
  num? agentId,
  String? featuredImage,
  String? minPrice,
  String? maxPrice,
  dynamic latitude,
  dynamic longitude,
  String? videoLink,
  String? bannerImage,
  dynamic projectPdf,
  num? featured,
  num? status,
  String? stateId,
  String? cityId,
  String? createdAt,
  String? updatedAt,
  num? approveStatus,
}) => HomeSlider(  id: id ?? _id,
  vendorId: vendorId ?? _vendorId,
  agentId: agentId ?? _agentId,
  featuredImage: featuredImage ?? _featuredImage,
  minPrice: minPrice ?? _minPrice,
  maxPrice: maxPrice ?? _maxPrice,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  videoLink: videoLink ?? _videoLink,
  bannerImage: bannerImage ?? _bannerImage,
  projectPdf: projectPdf ?? _projectPdf,
  featured: featured ?? _featured,
  status: status ?? _status,
  stateId: stateId ?? _stateId,
  cityId: cityId ?? _cityId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  approveStatus: approveStatus ?? _approveStatus,
);
  num? get id => _id;
  num? get vendorId => _vendorId;
  num? get agentId => _agentId;
  String? get featuredImage => _featuredImage;
  String? get minPrice => _minPrice;
  String? get maxPrice => _maxPrice;
  dynamic get latitude => _latitude;
  dynamic get longitude => _longitude;
  String? get videoLink => _videoLink;
  String? get bannerImage => _bannerImage;
  dynamic get projectPdf => _projectPdf;
  num? get featured => _featured;
  num? get status => _status;
  String? get stateId => _stateId;
  String? get cityId => _cityId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get approveStatus => _approveStatus;

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
    map['video_link'] = _videoLink;
    map['banner_image'] = _bannerImage;
    map['project_pdf'] = _projectPdf;
    map['featured'] = _featured;
    map['status'] = _status;
    map['state_id'] = _stateId;
    map['city_id'] = _cityId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['approve_status'] = _approveStatus;
    return map;
  }

}