/// status : "success"
/// message : " your wishlist successfully."
/// wishlist_id : [{"id":73,"user_id":47,"property_id":73,"type":"commercial","created_at":"2024-06-10T08:42:25.000000Z","updated_at":"2024-06-14T06:56:16.000000Z","vendor_id":0,"agent_id":null,"category_id":39,"country_id":11,"state_id":29,"city_id":1090,"featured_image":"6666bc711a6c9.jpg","floor_planning_image":"666be99013654.png","video_image":"666be9901435b.png","price":"38545.00","purpose":"rent","beds":null,"bath":null,"area":12578,"video_url":"https://www.youtube.com/watch?v=mrpiPK8_up0","property_pdf":null,"status":1,"latitude":"29.74566059605579","longitude":"-95.36594176541463","approve_status":1,"featured_id":115,"slug":"fully-furnished-floor-ready-for-move-in","title":"Fully Furnished Floor Ready for Move-In","address":"2019 Crawford St, Houston, TX 77002, United States","language_id":20}]

class WishlistModel {
  WishlistModel({
      String? status, 
      String? message, 
      List<WishlistId>? wishlistId,}){
    _status = status;
    _message = message;
    _wishlistId = wishlistId;
}

  WishlistModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['wishlist_id'] != null) {
      _wishlistId = [];
      json['wishlist_id'].forEach((v) {
        _wishlistId?.add(WishlistId.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  List<WishlistId>? _wishlistId;
WishlistModel copyWith({  String? status,
  String? message,
  List<WishlistId>? wishlistId,
}) => WishlistModel(  status: status ?? _status,
  message: message ?? _message,
  wishlistId: wishlistId ?? _wishlistId,
);
  String? get status => _status;
  String? get message => _message;
  List<WishlistId>? get wishlistId => _wishlistId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_wishlistId != null) {
      map['wishlist_id'] = _wishlistId?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 73
/// user_id : 47
/// property_id : 73
/// type : "commercial"
/// created_at : "2024-06-10T08:42:25.000000Z"
/// updated_at : "2024-06-14T06:56:16.000000Z"
/// vendor_id : 0
/// agent_id : null
/// category_id : 39
/// country_id : 11
/// state_id : 29
/// city_id : 1090
/// featured_image : "6666bc711a6c9.jpg"
/// floor_planning_image : "666be99013654.png"
/// video_image : "666be9901435b.png"
/// price : "38545.00"
/// purpose : "rent"
/// beds : null
/// bath : null
/// area : 12578
/// video_url : "https://www.youtube.com/watch?v=mrpiPK8_up0"
/// property_pdf : null
/// status : 1
/// latitude : "29.74566059605579"
/// longitude : "-95.36594176541463"
/// approve_status : 1
/// featured_id : 115
/// slug : "fully-furnished-floor-ready-for-move-in"
/// title : "Fully Furnished Floor Ready for Move-In"
/// address : "2019 Crawford St, Houston, TX 77002, United States"
/// language_id : 20

class WishlistId {
  WishlistId({
      num? id, 
      num? userId, 
      num? propertyId, 
      String? type, 
      String? createdAt, 
      String? updatedAt, 
      num? vendorId, 
      dynamic agentId, 
      num? categoryId, 
      num? countryId, 
      num? stateId, 
      num? cityId, 
      String? featuredImage, 
      String? floorPlanningImage, 
      String? videoImage, 
      String? price, 
      String? purpose, 
      dynamic beds, 
      dynamic bath, 
      num? area, 
      String? videoUrl, 
      dynamic propertyPdf, 
      num? status, 
      String? latitude, 
      String? longitude, 
      num? approveStatus, 
      num? featuredId, 
      String? slug, 
      String? title, 
      String? address, 
      num? languageId,}){
    _id = id;
    _userId = userId;
    _propertyId = propertyId;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _vendorId = vendorId;
    _agentId = agentId;
    _categoryId = categoryId;
    _countryId = countryId;
    _stateId = stateId;
    _cityId = cityId;
    _featuredImage = featuredImage;
    _floorPlanningImage = floorPlanningImage;
    _videoImage = videoImage;
    _price = price;
    _purpose = purpose;
    _beds = beds;
    _bath = bath;
    _area = area;
    _videoUrl = videoUrl;
    _propertyPdf = propertyPdf;
    _status = status;
    _latitude = latitude;
    _longitude = longitude;
    _approveStatus = approveStatus;
    _featuredId = featuredId;
    _slug = slug;
    _title = title;
    _address = address;
    _languageId = languageId;
}

  WishlistId.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _propertyId = json['property_id'];
    _type = json['type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _vendorId = json['vendor_id'];
    _agentId = json['agent_id'];
    _categoryId = json['category_id'];
    _countryId = json['country_id'];
    _stateId = json['state_id'];
    _cityId = json['city_id'];
    _featuredImage = json['featured_image'];
    _floorPlanningImage = json['floor_planning_image'];
    _videoImage = json['video_image'];
    _price = json['price']??"0";
    _purpose = json['purpose'];
    _beds = json['beds'];
    _bath = json['bath'];
    _area = json['area'];
    _videoUrl = json['video_url'];
    _propertyPdf = json['property_pdf'];
    _status = json['status'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _approveStatus = json['approve_status'];
    _featuredId = json['featured_id'];
    _slug = json['slug'];
    _title = json['title'];
    _address = json['address'];
    _languageId = json['language_id'];
  }
  num? _id;
  num? _userId;
  num? _propertyId;
  String? _type;
  String? _createdAt;
  String? _updatedAt;
  num? _vendorId;
  dynamic _agentId;
  num? _categoryId;
  num? _countryId;
  num? _stateId;
  num? _cityId;
  String? _featuredImage;
  String? _floorPlanningImage;
  String? _videoImage;
  String? _price;
  String? _purpose;
  dynamic _beds;
  dynamic _bath;
  num? _area;
  String? _videoUrl;
  dynamic _propertyPdf;
  num? _status;
  String? _latitude;
  String? _longitude;
  num? _approveStatus;
  num? _featuredId;
  String? _slug;
  String? _title;
  String? _address;
  num? _languageId;
WishlistId copyWith({  num? id,
  num? userId,
  num? propertyId,
  String? type,
  String? createdAt,
  String? updatedAt,
  num? vendorId,
  dynamic agentId,
  num? categoryId,
  num? countryId,
  num? stateId,
  num? cityId,
  String? featuredImage,
  String? floorPlanningImage,
  String? videoImage,
  String? price,
  String? purpose,
  dynamic beds,
  dynamic bath,
  num? area,
  String? videoUrl,
  dynamic propertyPdf,
  num? status,
  String? latitude,
  String? longitude,
  num? approveStatus,
  num? featuredId,
  String? slug,
  String? title,
  String? address,
  num? languageId,
}) => WishlistId(  id: id ?? _id,
  userId: userId ?? _userId,
  propertyId: propertyId ?? _propertyId,
  type: type ?? _type,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  vendorId: vendorId ?? _vendorId,
  agentId: agentId ?? _agentId,
  categoryId: categoryId ?? _categoryId,
  countryId: countryId ?? _countryId,
  stateId: stateId ?? _stateId,
  cityId: cityId ?? _cityId,
  featuredImage: featuredImage ?? _featuredImage,
  floorPlanningImage: floorPlanningImage ?? _floorPlanningImage,
  videoImage: videoImage ?? _videoImage,
  price: price ?? _price,
  purpose: purpose ?? _purpose,
  beds: beds ?? _beds,
  bath: bath ?? _bath,
  area: area ?? _area,
  videoUrl: videoUrl ?? _videoUrl,
  propertyPdf: propertyPdf ?? _propertyPdf,
  status: status ?? _status,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  approveStatus: approveStatus ?? _approveStatus,
  featuredId: featuredId ?? _featuredId,
  slug: slug ?? _slug,
  title: title ?? _title,
  address: address ?? _address,
  languageId: languageId ?? _languageId,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get propertyId => _propertyId;
  String? get type => _type;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get vendorId => _vendorId;
  dynamic get agentId => _agentId;
  num? get categoryId => _categoryId;
  num? get countryId => _countryId;
  num? get stateId => _stateId;
  num? get cityId => _cityId;
  String? get featuredImage => _featuredImage;
  String? get floorPlanningImage => _floorPlanningImage;
  String? get videoImage => _videoImage;
  String? get price => _price;
  String? get purpose => _purpose;
  dynamic get beds => _beds;
  dynamic get bath => _bath;
  num? get area => _area;
  String? get videoUrl => _videoUrl;
  dynamic get propertyPdf => _propertyPdf;
  num? get status => _status;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  num? get approveStatus => _approveStatus;
  num? get featuredId => _featuredId;
  String? get slug => _slug;
  String? get title => _title;
  String? get address => _address;
  num? get languageId => _languageId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['property_id'] = _propertyId;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['vendor_id'] = _vendorId;
    map['agent_id'] = _agentId;
    map['category_id'] = _categoryId;
    map['country_id'] = _countryId;
    map['state_id'] = _stateId;
    map['city_id'] = _cityId;
    map['featured_image'] = _featuredImage;
    map['floor_planning_image'] = _floorPlanningImage;
    map['video_image'] = _videoImage;
    map['price'] = _price;
    map['purpose'] = _purpose;
    map['beds'] = _beds;
    map['bath'] = _bath;
    map['area'] = _area;
    map['video_url'] = _videoUrl;
    map['property_pdf'] = _propertyPdf;
    map['status'] = _status;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['approve_status'] = _approveStatus;
    map['featured_id'] = _featuredId;
    map['slug'] = _slug;
    map['title'] = _title;
    map['address'] = _address;
    map['language_id'] = _languageId;
    return map;
  }

}