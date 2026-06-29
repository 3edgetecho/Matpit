/// current_page : 1
/// data : [{"id":126,"vendor_id":47,"agent_id":null,"category_id":45,"country_id":null,"state_id":4,"city_id":147,"featured_image":"683591e9c5c66.png","floor_planning_image":"683591e9c5e2a.jpg","video_image":"683591e9c5eab.png","price":"45000.00","purpose":"rent","type":"commercial","beds":0,"bath":0,"area":30,"video_url":"ffggg","property_pdf":null,"status":1,"latitude":null,"longitude":null,"created_at":"2025-05-27T10:20:25.000000Z","updated_at":"2025-05-27T10:20:25.000000Z","approve_status":0,"property_contents":[{"id":127,"property_id":126,"language_id":20,"title":"505 JTM","slug":"505-jtm","address":"JTM 505 Jagtpura","description":"Only Office Base","meta_keyword":null,"meta_description":null,"created_at":"2025-05-27T10:20:25.000000Z","updated_at":"2025-05-27T10:20:25.000000Z"}],"vendor":{"id":47,"photo":null,"email":"viren@test.com","phone":"8094962100","username":"viren","password":"$2y$10$Ywi/sqpujK.Hr4D2e/jGA.GulxHxbpJbTIgK/fVlWZcwEvDMJU2M.","status":1,"amount":0,"email_verified_at":"2025-05-08 15:26:51","avg_rating":0,"show_email_addresss":1,"show_phone_number":1,"show_contact_form":1,"created_at":"2025-05-08T09:56:51.000000Z","updated_at":"2025-05-14T07:46:20.000000Z"},"featured_properties":[],"city_content":{"id":147,"city_id":147,"language_id":20,"name":"Bilasipara","slug":"","created_at":null,"updated_at":null}},{"id":125,"vendor_id":47,"agent_id":null,"category_id":45,"country_id":null,"state_id":4,"city_id":147,"featured_image":"68358664b7302.png","floor_planning_image":"68358664b7420.jpg","video_image":"68358664b7494.png","price":"45000.00","purpose":"rent","type":"commercial","beds":0,"bath":0,"area":30,"video_url":"ffggg","property_pdf":null,"status":1,"latitude":null,"longitude":null,"created_at":"2025-05-27T09:31:16.000000Z","updated_at":"2025-05-27T09:31:16.000000Z","approve_status":0,"property_contents":[{"id":126,"property_id":125,"language_id":20,"title":"505 JTM","slug":"505-jtm","address":"JTM 505 Jagtpura","description":"Only Office Base","meta_keyword":null,"meta_description":null,"created_at":"2025-05-27T09:31:16.000000Z","updated_at":"2025-05-27T09:31:16.000000Z"}],"vendor":{"id":47,"photo":null,"email":"viren@test.com","phone":"8094962100","username":"viren","password":"$2y$10$Ywi/sqpujK.Hr4D2e/jGA.GulxHxbpJbTIgK/fVlWZcwEvDMJU2M.","status":1,"amount":0,"email_verified_at":"2025-05-08 15:26:51","avg_rating":0,"show_email_addresss":1,"show_phone_number":1,"show_contact_form":1,"created_at":"2025-05-08T09:56:51.000000Z","updated_at":"2025-05-14T07:46:20.000000Z"},"featured_properties":[],"city_content":{"id":147,"city_id":147,"language_id":20,"name":"Bilasipara","slug":"","created_at":null,"updated_at":null}}]
/// first_page_url : "https://matpit.com/api/vendor/property-get/47?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "https://matpit.com/api/vendor/property-get/47?page=1"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://matpit.com/api/vendor/property-get/47?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}]
/// next_page_url : null
/// path : "https://matpit.com/api/vendor/property-get/47"
/// per_page : 10
/// prev_page_url : null
/// to : 2
/// total : 2

class PropertyListResponse {
  PropertyListResponse({
      num? currentPage, 
      List<Data>? data, 
      String? firstPageUrl, 
      num? from, 
      num? lastPage, 
      String? lastPageUrl, 
      List<Links>? links, 
      dynamic nextPageUrl, 
      String? path, 
      num? perPage, 
      dynamic prevPageUrl, 
      num? to, 
      num? total,}){
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _links = links;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
}

  PropertyListResponse.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  num? _currentPage;
  List<Data>? _data;
  String? _firstPageUrl;
  num? _from;
  num? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  dynamic _nextPageUrl;
  String? _path;
  num? _perPage;
  dynamic _prevPageUrl;
  num? _to;
  num? _total;
PropertyListResponse copyWith({  num? currentPage,
  List<Data>? data,
  String? firstPageUrl,
  num? from,
  num? lastPage,
  String? lastPageUrl,
  List<Links>? links,
  dynamic nextPageUrl,
  String? path,
  num? perPage,
  dynamic prevPageUrl,
  num? to,
  num? total,
}) => PropertyListResponse(  currentPage: currentPage ?? _currentPage,
  data: data ?? _data,
  firstPageUrl: firstPageUrl ?? _firstPageUrl,
  from: from ?? _from,
  lastPage: lastPage ?? _lastPage,
  lastPageUrl: lastPageUrl ?? _lastPageUrl,
  links: links ?? _links,
  nextPageUrl: nextPageUrl ?? _nextPageUrl,
  path: path ?? _path,
  perPage: perPage ?? _perPage,
  prevPageUrl: prevPageUrl ?? _prevPageUrl,
  to: to ?? _to,
  total: total ?? _total,
);
  num? get currentPage => _currentPage;
  List<Data>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  num? get from => _from;
  num? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  List<Links>? get links => _links;
  dynamic get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  num? get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  num? get to => _to;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

/// url : null
/// label : "&laquo; Previous"
/// active : false

class Links {
  Links({
      dynamic url, 
      String? label, 
      bool? active,}){
    _url = url;
    _label = label;
    _active = active;
}

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }
  dynamic _url;
  String? _label;
  bool? _active;
Links copyWith({  dynamic url,
  String? label,
  bool? active,
}) => Links(  url: url ?? _url,
  label: label ?? _label,
  active: active ?? _active,
);
  dynamic get url => _url;
  String? get label => _label;
  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }

}

/// id : 126
/// vendor_id : 47
/// agent_id : null
/// category_id : 45
/// country_id : null
/// state_id : 4
/// city_id : 147
/// featured_image : "683591e9c5c66.png"
/// floor_planning_image : "683591e9c5e2a.jpg"
/// video_image : "683591e9c5eab.png"
/// price : "45000.00"
/// purpose : "rent"
/// type : "commercial"
/// beds : 0
/// bath : 0
/// area : 30
/// video_url : "ffggg"
/// property_pdf : null
/// status : 1
/// latitude : null
/// longitude : null
/// created_at : "2025-05-27T10:20:25.000000Z"
/// updated_at : "2025-05-27T10:20:25.000000Z"
/// approve_status : 0
/// property_contents : [{"id":127,"property_id":126,"language_id":20,"title":"505 JTM","slug":"505-jtm","address":"JTM 505 Jagtpura","description":"Only Office Base","meta_keyword":null,"meta_description":null,"created_at":"2025-05-27T10:20:25.000000Z","updated_at":"2025-05-27T10:20:25.000000Z"}]
/// vendor : {"id":47,"photo":null,"email":"viren@test.com","phone":"8094962100","username":"viren","password":"$2y$10$Ywi/sqpujK.Hr4D2e/jGA.GulxHxbpJbTIgK/fVlWZcwEvDMJU2M.","status":1,"amount":0,"email_verified_at":"2025-05-08 15:26:51","avg_rating":0,"show_email_addresss":1,"show_phone_number":1,"show_contact_form":1,"created_at":"2025-05-08T09:56:51.000000Z","updated_at":"2025-05-14T07:46:20.000000Z"}
/// featured_properties : []
/// city_content : {"id":147,"city_id":147,"language_id":20,"name":"Bilasipara","slug":"","created_at":null,"updated_at":null}

class Data {
  Data({
      num? id, 
      num? vendorId, 
      dynamic agentId, 
      num? categoryId, 
      dynamic countryId, 
      num? stateId, 
      num? cityId, 
      String? featuredImage, 
      String? floorPlanningImage, 
      String? videoImage, 
      String? price, 
      String? purpose, 
      String? type, 
      num? beds, 
      num? bath, 
      num? area, 
      String? videoUrl, 
      dynamic propertyPdf, 
      num? status, 
      dynamic latitude, 
      dynamic longitude, 
      String? createdAt, 
      String? updatedAt, 
      num? approveStatus, 
      List<PropertyContents>? propertyContents, 
      Vendor? vendor, 
      List<dynamic>? featuredProperties, 
      CityContent? cityContent,}){
    _id = id;
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
    _type = type;
    _beds = beds;
    _bath = bath;
    _area = area;
    _videoUrl = videoUrl;
    _propertyPdf = propertyPdf;
    _status = status;
    _latitude = latitude;
    _longitude = longitude;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _approveStatus = approveStatus;
    _propertyContents = propertyContents;
    _vendor = vendor;
    _featuredProperties = featuredProperties;
    _cityContent = cityContent;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
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
    _type = json['type'];
    _beds = json['beds'];
    _bath = json['bath'];
    _area = json['area'];
    _videoUrl = json['video_url'];
    _propertyPdf = json['property_pdf'];
    _status = json['status'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _approveStatus = json['approve_status'];
    if (json['property_contents'] != null) {
      _propertyContents = [];
      json['property_contents'].forEach((v) {
        _propertyContents?.add(PropertyContents.fromJson(v));
      });
    }
    _vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
    // if (json['featured_properties'] != null) {
    //   _featuredProperties = [];
    //   json['featured_properties'].forEach((v) {
    //     _featuredProperties?.add(Dynamic.fromJson(v));
    //   });
    // }
    _cityContent = json['city_content'] != null ? CityContent.fromJson(json['city_content']) : null;
  }
  num? _id;
  num? _vendorId;
  dynamic _agentId;
  num? _categoryId;
  dynamic _countryId;
  num? _stateId;
  num? _cityId;
  String? _featuredImage;
  String? _floorPlanningImage;
  String? _videoImage;
  String? _price;
  String? _purpose;
  String? _type;
  num? _beds;
  num? _bath;
  num? _area;
  String? _videoUrl;
  dynamic _propertyPdf;
  num? _status;
  dynamic _latitude;
  dynamic _longitude;
  String? _createdAt;
  String? _updatedAt;
  num? _approveStatus;
  List<PropertyContents>? _propertyContents;
  Vendor? _vendor;
  List<dynamic>? _featuredProperties;
  CityContent? _cityContent;
Data copyWith({  num? id,
  num? vendorId,
  dynamic agentId,
  num? categoryId,
  dynamic countryId,
  num? stateId,
  num? cityId,
  String? featuredImage,
  String? floorPlanningImage,
  String? videoImage,
  String? price,
  String? purpose,
  String? type,
  num? beds,
  num? bath,
  num? area,
  String? videoUrl,
  dynamic propertyPdf,
  num? status,
  dynamic latitude,
  dynamic longitude,
  String? createdAt,
  String? updatedAt,
  num? approveStatus,
  List<PropertyContents>? propertyContents,
  Vendor? vendor,
  List<dynamic>? featuredProperties,
  CityContent? cityContent,
}) => Data(  id: id ?? _id,
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
  type: type ?? _type,
  beds: beds ?? _beds,
  bath: bath ?? _bath,
  area: area ?? _area,
  videoUrl: videoUrl ?? _videoUrl,
  propertyPdf: propertyPdf ?? _propertyPdf,
  status: status ?? _status,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  approveStatus: approveStatus ?? _approveStatus,
  propertyContents: propertyContents ?? _propertyContents,
  vendor: vendor ?? _vendor,
  featuredProperties: featuredProperties ?? _featuredProperties,
  cityContent: cityContent ?? _cityContent,
);
  num? get id => _id;
  num? get vendorId => _vendorId;
  dynamic get agentId => _agentId;
  num? get categoryId => _categoryId;
  dynamic get countryId => _countryId;
  num? get stateId => _stateId;
  num? get cityId => _cityId;
  String? get featuredImage => _featuredImage;
  String? get floorPlanningImage => _floorPlanningImage;
  String? get videoImage => _videoImage;
  String? get price => _price;
  String? get purpose => _purpose;
  String? get type => _type;
  num? get beds => _beds;
  num? get bath => _bath;
  num? get area => _area;
  String? get videoUrl => _videoUrl;
  dynamic get propertyPdf => _propertyPdf;
  num? get status => _status;
  dynamic get latitude => _latitude;
  dynamic get longitude => _longitude;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get approveStatus => _approveStatus;
  List<PropertyContents>? get propertyContents => _propertyContents;
  Vendor? get vendor => _vendor;
  List<dynamic>? get featuredProperties => _featuredProperties;
  CityContent? get cityContent => _cityContent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
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
    map['type'] = _type;
    map['beds'] = _beds;
    map['bath'] = _bath;
    map['area'] = _area;
    map['video_url'] = _videoUrl;
    map['property_pdf'] = _propertyPdf;
    map['status'] = _status;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['approve_status'] = _approveStatus;
    if (_propertyContents != null) {
      map['property_contents'] = _propertyContents?.map((v) => v.toJson()).toList();
    }
    if (_vendor != null) {
      map['vendor'] = _vendor?.toJson();
    }
    if (_featuredProperties != null) {
      map['featured_properties'] = _featuredProperties?.map((v) => v.toJson()).toList();
    }
    if (_cityContent != null) {
      map['city_content'] = _cityContent?.toJson();
    }
    return map;
  }

}

/// id : 147
/// city_id : 147
/// language_id : 20
/// name : "Bilasipara"
/// slug : ""
/// created_at : null
/// updated_at : null

class CityContent {
  CityContent({
      num? id, 
      num? cityId, 
      num? languageId, 
      String? name, 
      String? slug, 
      dynamic createdAt, 
      dynamic updatedAt,}){
    _id = id;
    _cityId = cityId;
    _languageId = languageId;
    _name = name;
    _slug = slug;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CityContent.fromJson(dynamic json) {
    _id = json['id'];
    _cityId = json['city_id'];
    _languageId = json['language_id'];
    _name = json['name'];
    _slug = json['slug'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _cityId;
  num? _languageId;
  String? _name;
  String? _slug;
  dynamic _createdAt;
  dynamic _updatedAt;
CityContent copyWith({  num? id,
  num? cityId,
  num? languageId,
  String? name,
  String? slug,
  dynamic createdAt,
  dynamic updatedAt,
}) => CityContent(  id: id ?? _id,
  cityId: cityId ?? _cityId,
  languageId: languageId ?? _languageId,
  name: name ?? _name,
  slug: slug ?? _slug,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get cityId => _cityId;
  num? get languageId => _languageId;
  String? get name => _name;
  String? get slug => _slug;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['city_id'] = _cityId;
    map['language_id'] = _languageId;
    map['name'] = _name;
    map['slug'] = _slug;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 47
/// photo : null
/// email : "viren@test.com"
/// phone : "8094962100"
/// username : "viren"
/// password : "$2y$10$Ywi/sqpujK.Hr4D2e/jGA.GulxHxbpJbTIgK/fVlWZcwEvDMJU2M."
/// status : 1
/// amount : 0
/// email_verified_at : "2025-05-08 15:26:51"
/// avg_rating : 0
/// show_email_addresss : 1
/// show_phone_number : 1
/// show_contact_form : 1
/// created_at : "2025-05-08T09:56:51.000000Z"
/// updated_at : "2025-05-14T07:46:20.000000Z"

class Vendor {
  Vendor({
      num? id, 
      dynamic photo, 
      String? email, 
      String? phone, 
      String? username, 
      String? password, 
      num? status, 
      num? amount, 
      String? emailVerifiedAt, 
      num? avgRating, 
      num? showEmailAddresss, 
      num? showPhoneNumber, 
      num? showContactForm, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _photo = photo;
    _email = email;
    _phone = phone;
    _username = username;
    _password = password;
    _status = status;
    _amount = amount;
    _emailVerifiedAt = emailVerifiedAt;
    _avgRating = avgRating;
    _showEmailAddresss = showEmailAddresss;
    _showPhoneNumber = showPhoneNumber;
    _showContactForm = showContactForm;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Vendor.fromJson(dynamic json) {
    _id = json['id'];
    _photo = json['photo'];
    _email = json['email'];
    _phone = json['phone'];
    _username = json['username'];
    _password = json['password'];
    _status = json['status'];
    _amount = json['amount'];
    _emailVerifiedAt = json['email_verified_at'];
    _avgRating = json['avg_rating'];
    _showEmailAddresss = json['show_email_addresss'];
    _showPhoneNumber = json['show_phone_number'];
    _showContactForm = json['show_contact_form'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  dynamic _photo;
  String? _email;
  String? _phone;
  String? _username;
  String? _password;
  num? _status;
  num? _amount;
  String? _emailVerifiedAt;
  num? _avgRating;
  num? _showEmailAddresss;
  num? _showPhoneNumber;
  num? _showContactForm;
  String? _createdAt;
  String? _updatedAt;
Vendor copyWith({  num? id,
  dynamic photo,
  String? email,
  String? phone,
  String? username,
  String? password,
  num? status,
  num? amount,
  String? emailVerifiedAt,
  num? avgRating,
  num? showEmailAddresss,
  num? showPhoneNumber,
  num? showContactForm,
  String? createdAt,
  String? updatedAt,
}) => Vendor(  id: id ?? _id,
  photo: photo ?? _photo,
  email: email ?? _email,
  phone: phone ?? _phone,
  username: username ?? _username,
  password: password ?? _password,
  status: status ?? _status,
  amount: amount ?? _amount,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  avgRating: avgRating ?? _avgRating,
  showEmailAddresss: showEmailAddresss ?? _showEmailAddresss,
  showPhoneNumber: showPhoneNumber ?? _showPhoneNumber,
  showContactForm: showContactForm ?? _showContactForm,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  dynamic get photo => _photo;
  String? get email => _email;
  String? get phone => _phone;
  String? get username => _username;
  String? get password => _password;
  num? get status => _status;
  num? get amount => _amount;
  String? get emailVerifiedAt => _emailVerifiedAt;
  num? get avgRating => _avgRating;
  num? get showEmailAddresss => _showEmailAddresss;
  num? get showPhoneNumber => _showPhoneNumber;
  num? get showContactForm => _showContactForm;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['photo'] = _photo;
    map['email'] = _email;
    map['phone'] = _phone;
    map['username'] = _username;
    map['password'] = _password;
    map['status'] = _status;
    map['amount'] = _amount;
    map['email_verified_at'] = _emailVerifiedAt;
    map['avg_rating'] = _avgRating;
    map['show_email_addresss'] = _showEmailAddresss;
    map['show_phone_number'] = _showPhoneNumber;
    map['show_contact_form'] = _showContactForm;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 127
/// property_id : 126
/// language_id : 20
/// title : "505 JTM"
/// slug : "505-jtm"
/// address : "JTM 505 Jagtpura"
/// description : "Only Office Base"
/// meta_keyword : null
/// meta_description : null
/// created_at : "2025-05-27T10:20:25.000000Z"
/// updated_at : "2025-05-27T10:20:25.000000Z"

class PropertyContents {
  PropertyContents({
      num? id, 
      num? propertyId, 
      num? languageId, 
      String? title, 
      String? slug, 
      String? address, 
      String? description, 
      dynamic metaKeyword, 
      dynamic metaDescription, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _propertyId = propertyId;
    _languageId = languageId;
    _title = title;
    _slug = slug;
    _address = address;
    _description = description;
    _metaKeyword = metaKeyword;
    _metaDescription = metaDescription;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  PropertyContents.fromJson(dynamic json) {
    _id = json['id'];
    _propertyId = json['property_id'];
    _languageId = json['language_id'];
    _title = json['title'];
    _slug = json['slug'];
    _address = json['address'];
    _description = json['description'];
    _metaKeyword = json['meta_keyword'];
    _metaDescription = json['meta_description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _propertyId;
  num? _languageId;
  String? _title;
  String? _slug;
  String? _address;
  String? _description;
  dynamic _metaKeyword;
  dynamic _metaDescription;
  String? _createdAt;
  String? _updatedAt;
PropertyContents copyWith({  num? id,
  num? propertyId,
  num? languageId,
  String? title,
  String? slug,
  String? address,
  String? description,
  dynamic metaKeyword,
  dynamic metaDescription,
  String? createdAt,
  String? updatedAt,
}) => PropertyContents(  id: id ?? _id,
  propertyId: propertyId ?? _propertyId,
  languageId: languageId ?? _languageId,
  title: title ?? _title,
  slug: slug ?? _slug,
  address: address ?? _address,
  description: description ?? _description,
  metaKeyword: metaKeyword ?? _metaKeyword,
  metaDescription: metaDescription ?? _metaDescription,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get propertyId => _propertyId;
  num? get languageId => _languageId;
  String? get title => _title;
  String? get slug => _slug;
  String? get address => _address;
  String? get description => _description;
  dynamic get metaKeyword => _metaKeyword;
  dynamic get metaDescription => _metaDescription;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['property_id'] = _propertyId;
    map['language_id'] = _languageId;
    map['title'] = _title;
    map['slug'] = _slug;
    map['address'] = _address;
    map['description'] = _description;
    map['meta_keyword'] = _metaKeyword;
    map['meta_description'] = _metaDescription;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}