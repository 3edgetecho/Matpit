/// status : "success"
/// message : "Message fetched successfully"
/// property : [{"id":70,"property_id":127,"title":"Plot","address":"BANAR JODPUR","price":"1666000.00","area":1250,"beds":0,"baths":0,"image":"6836e3d946e0d.jpeg","message":"this is best for me","name":"Nitesh","email":"niteshjaat0859@gmail.com","phone":"7073310859","created_at":"2025-06-11T12:34:25.000000Z"}]
/// project : [{"id":9,"project_id":107,"title":"JTMb","address":"JTM","min_price":"22111.00","max_price":"331111.00","image":"6846d0d7d701e.jpg","message":"testing and buy this property","name":"sanjay","email":"sanjayjangid2773@gmail.com","phone":"6377290236","created_at":"2025-06-11T12:33:37.000000Z"}]

class MyEnquiryResponse {
  MyEnquiryResponse({
      String? status, 
      String? message, 
      List<Property>? property, 
      List<Project>? project,}){
    _status = status;
    _message = message;
    _property = property;
    _project = project;
}

  MyEnquiryResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['property'] != null) {
      _property = [];
      json['property'].forEach((v) {
        _property?.add(Property.fromJson(v));
      });
    }
    if (json['project'] != null) {
      _project = [];
      json['project'].forEach((v) {
        _project?.add(Project.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  List<Property>? _property;
  List<Project>? _project;
MyEnquiryResponse copyWith({  String? status,
  String? message,
  List<Property>? property,
  List<Project>? project,
}) => MyEnquiryResponse(  status: status ?? _status,
  message: message ?? _message,
  property: property ?? _property,
  project: project ?? _project,
);
  String? get status => _status;
  String? get message => _message;
  List<Property>? get property => _property;
  List<Project>? get project => _project;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_property != null) {
      map['property'] = _property?.map((v) => v.toJson()).toList();
    }
    if (_project != null) {
      map['project'] = _project?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 9
/// project_id : 107
/// title : "JTMb"
/// address : "JTM"
/// min_price : "22111.00"
/// max_price : "331111.00"
/// image : "6846d0d7d701e.jpg"
/// message : "testing and buy this property"
/// name : "sanjay"
/// email : "sanjayjangid2773@gmail.com"
/// phone : "6377290236"
/// created_at : "2025-06-11T12:33:37.000000Z"

class Project {
  Project({
      num? id, 
      num? projectId, 
      String? title, 
      String? address, 
      String? minPrice, 
      String? maxPrice, 
      String? image, 
      String? message, 
      String? name, 
      String? email, 
      String? phone, 
      String? createdAt,}){
    _id = id;
    _projectId = projectId;
    _title = title;
    _address = address;
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    _image = image;
    _message = message;
    _name = name;
    _email = email;
    _phone = phone;
    _createdAt = createdAt;
}

  Project.fromJson(dynamic json) {
    _id = json['id'];
    _projectId = json['project_id'];
    _title = json['title'];
    _address = json['address'];
    _minPrice = json['min_price'];
    _maxPrice = json['max_price'];
    _image = json['image'];
    _message = json['message'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _createdAt = json['created_at'];
  }
  num? _id;
  num? _projectId;
  String? _title;
  String? _address;
  String? _minPrice;
  String? _maxPrice;
  String? _image;
  String? _message;
  String? _name;
  String? _email;
  String? _phone;
  String? _createdAt;
Project copyWith({  num? id,
  num? projectId,
  String? title,
  String? address,
  String? minPrice,
  String? maxPrice,
  String? image,
  String? message,
  String? name,
  String? email,
  String? phone,
  String? createdAt,
}) => Project(  id: id ?? _id,
  projectId: projectId ?? _projectId,
  title: title ?? _title,
  address: address ?? _address,
  minPrice: minPrice ?? _minPrice,
  maxPrice: maxPrice ?? _maxPrice,
  image: image ?? _image,
  message: message ?? _message,
  name: name ?? _name,
  email: email ?? _email,
  phone: phone ?? _phone,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  num? get projectId => _projectId;
  String? get title => _title;
  String? get address => _address;
  String? get minPrice => _minPrice;
  String? get maxPrice => _maxPrice;
  String? get image => _image;
  String? get message => _message;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['project_id'] = _projectId;
    map['title'] = _title;
    map['address'] = _address;
    map['min_price'] = _minPrice;
    map['max_price'] = _maxPrice;
    map['image'] = _image;
    map['message'] = _message;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['created_at'] = _createdAt;
    return map;
  }

}

/// id : 70
/// property_id : 127
/// title : "Plot"
/// address : "BANAR JODPUR"
/// price : "1666000.00"
/// area : 1250
/// beds : 0
/// baths : 0
/// image : "6836e3d946e0d.jpeg"
/// message : "this is best for me"
/// name : "Nitesh"
/// email : "niteshjaat0859@gmail.com"
/// phone : "7073310859"
/// created_at : "2025-06-11T12:34:25.000000Z"

class Property {
  Property({
      num? id, 
      num? propertyId, 
      String? title, 
      String? address, 
      String? price, 
      num? area, 
      num? beds, 
      num? baths, 
      String? image, 
      String? message, 
      String? name, 
      String? email, 
      String? phone, 
      String? createdAt,}){
    _id = id;
    _propertyId = propertyId;
    _title = title;
    _address = address;
    _price = price;
    _area = area;
    _beds = beds;
    _baths = baths;
    _image = image;
    _message = message;
    _name = name;
    _email = email;
    _phone = phone;
    _createdAt = createdAt;
}

  Property.fromJson(dynamic json) {
    _id = json['id'];
    _propertyId = json['property_id'];
    _title = json['title'];
    _address = json['address'];
    _price = json['price']??"0";
    _area = json['area'];
    _beds = json['beds'];
    _baths = json['baths'];
    _image = json['image'];
    _message = json['message'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _createdAt = json['created_at'];
  }
  num? _id;
  num? _propertyId;
  String? _title;
  String? _address;
  String? _price;
  num? _area;
  num? _beds;
  num? _baths;
  String? _image;
  String? _message;
  String? _name;
  String? _email;
  String? _phone;
  String? _createdAt;
Property copyWith({  num? id,
  num? propertyId,
  String? title,
  String? address,
  String? price,
  num? area,
  num? beds,
  num? baths,
  String? image,
  String? message,
  String? name,
  String? email,
  String? phone,
  String? createdAt,
}) => Property(  id: id ?? _id,
  propertyId: propertyId ?? _propertyId,
  title: title ?? _title,
  address: address ?? _address,
  price: price ?? _price,
  area: area ?? _area,
  beds: beds ?? _beds,
  baths: baths ?? _baths,
  image: image ?? _image,
  message: message ?? _message,
  name: name ?? _name,
  email: email ?? _email,
  phone: phone ?? _phone,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  num? get propertyId => _propertyId;
  String? get title => _title;
  String? get address => _address;
  String? get price => _price;
  num? get area => _area;
  num? get beds => _beds;
  num? get baths => _baths;
  String? get image => _image;
  String? get message => _message;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['property_id'] = _propertyId;
    map['title'] = _title;
    map['address'] = _address;
    map['price'] = _price;
    map['area'] = _area;
    map['beds'] = _beds;
    map['baths'] = _baths;
    map['image'] = _image;
    map['message'] = _message;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['created_at'] = _createdAt;
    return map;
  }

}