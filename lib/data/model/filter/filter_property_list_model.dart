/// success : true
/// category : "Hotel"
/// properties : {"current_page":1,"data":[{"id":78,"vendor_id":0,"agent_id":25,"category_id":35,"country_id":11,"state_id":29,"city_id":1090,"featured_image":"6666df58bf5e7.jpg","floor_planning_image":"6666df58c00cc.png","video_image":"666be934dbdc7.png","price":"12587.00","purpose":"rent","type":"commercial","beds":null,"bath":null,"area":14945,"video_url":"https://www.youtube.com/watch?v=mrpiPK8_up0","property_pdf":null,"status":1,"latitude":"28.475741040586485","longitude":"-81.47406092316122","created_at":"2024-06-10T11:11:20.000000Z","updated_at":"2024-06-14T06:54:44.000000Z","approve_status":1,"title":"Elegant Home in Quiet Neighborhood","slug":"elegant-home-in-quiet-neighborhood","description":"<p>Own a lanai apartment with a delightful 97' patio, tax roll initially designated it as a 2/2 with 1409 sq ft, but it has been modified to a 1/1.5 with an extra den (bedroom). The updated kitchen features new appliances, and ample storage space with a hookup for a washer and dryer.<br />This meticulously maintained unit offers a flexible layout, providing an option to move in seamlessly. The open floor plan connects living and dining areas, creating an ideal space for entertainment or relaxation. Beyond the interior, the lanai apartment offers a unique outdoor experience. The 97' patio extends your living space, perfect for enjoying the tropical climate.<br />A private gateway to the pool and steps away from the beach provides convenient leisure opportunities. Paradise awaits in your new lanai!</p>","address":"5911 Turkey Lake Rd, Orlando, FL 32819, USA","category_content":{"id":34,"category_id":35,"language_id":20,"name":"Hotel","slug":"hotel","created_at":"2024-06-10T06:15:04.000000Z","updated_at":"2024-06-10T06:15:04.000000Z"}},{"id":76,"vendor_id":0,"agent_id":null,"category_id":35,"country_id":11,"state_id":29,"city_id":1090,"featured_image":"6666db80c26f7.jpg","floor_planning_image":"6666db80c2f6f.png","video_image":"666be95438dc4.png","price":"500.00","purpose":"rent","type":"commercial","beds":null,"bath":null,"area":400,"video_url":"https://www.youtube.com/watch?v=mrpiPK8_up0","property_pdf":null,"status":1,"latitude":"37.763023736519635","longitude":"-122.42377480576295","created_at":"2024-06-10T10:54:56.000000Z","updated_at":"2024-06-14T06:55:16.000000Z","approve_status":1,"title":"Luxury Condo with Stunning City Views","slug":"luxury-condo-with-stunning-city-views","description":"<p>BY APPOINTMENTS ONLY !! 2-bedroom, 2-bathroom manufactured home in the heart of Sweetwater, FL 33172. Nestled in a central location, this residence offers convenience to nearby shopping plazas, ensuring that daily errands and retail therapy are just moments away. The home itself boasts a cozy and welcoming ambiance, with ample space for relaxation and entertaining. The well-appointed bedrooms provide comfort and privacy, while the bathrooms are modern and stylish. Whether you're enjoying the local amenities or unwinding in your own oasis, this manufactured home offers the perfect blend of comfort and convenience in a desirable location.</p>","address":"501 Guerrero St, San Francisco, CA 94110, USA","category_content":{"id":34,"category_id":35,"language_id":20,"name":"Hotel","slug":"hotel","created_at":"2024-06-10T06:15:04.000000Z","updated_at":"2024-06-10T06:15:04.000000Z"}}],"first_page_url":"https://matpit.com/api/properties-by-category?page=1","from":1,"last_page":1,"last_page_url":"https://matpit.com/api/properties-by-category?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://matpit.com/api/properties-by-category?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"https://matpit.com/api/properties-by-category","per_page":12,"prev_page_url":null,"to":2,"total":2}
/// projects : [{"id":107,"vendor_id":47,"agent_id":0,"category_id":35,"featured_image":"6846d0d7d701e.jpg","min_price":"22111.00","max_price":"331111.00","latitude":null,"longitude":null,"video_link":null,"banner_image":null,"project_pdf":"6846d0d7d70d7.pdf","featured":0,"status":1,"state_id":"10","city_id":"325","created_at":"2025-06-09T12:17:27.000000Z","updated_at":"2025-06-23T06:43:34.000000Z","approve_status":1,"title":"JTMb","slug":"jtmb","address":"JTM"}]

class FilterPropertyListModel {
  FilterPropertyListModel({
      bool? success, 
      String? category, 
      Properties? properties, 
      List<Projects>? projects,}){
    _success = success;
    _category = category;
    _properties = properties;
    _projects = projects;
}

  FilterPropertyListModel.fromJson(dynamic json) {
    _success = json['success'];
    _category = json['category'];
    _properties = json['properties'] != null ? Properties.fromJson(json['properties']) : null;
    if (json['projects'] != null) {
      _projects = [];
      json['projects'].forEach((v) {
        _projects?.add(Projects.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _category;
  Properties? _properties;
  List<Projects>? _projects;
FilterPropertyListModel copyWith({  bool? success,
  String? category,
  Properties? properties,
  List<Projects>? projects,
}) => FilterPropertyListModel(  success: success ?? _success,
  category: category ?? _category,
  properties: properties ?? _properties,
  projects: projects ?? _projects,
);
  bool? get success => _success;
  String? get category => _category;
  Properties? get properties => _properties;
  List<Projects>? get projects => _projects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['category'] = _category;
    if (_properties != null) {
      map['properties'] = _properties?.toJson();
    }
    if (_projects != null) {
      map['projects'] = _projects?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 107
/// vendor_id : 47
/// agent_id : 0
/// category_id : 35
/// featured_image : "6846d0d7d701e.jpg"
/// min_price : "22111.00"
/// max_price : "331111.00"
/// latitude : null
/// longitude : null
/// video_link : null
/// banner_image : null
/// project_pdf : "6846d0d7d70d7.pdf"
/// featured : 0
/// status : 1
/// state_id : "10"
/// city_id : "325"
/// created_at : "2025-06-09T12:17:27.000000Z"
/// updated_at : "2025-06-23T06:43:34.000000Z"
/// approve_status : 1
/// title : "JTMb"
/// slug : "jtmb"
/// address : "JTM"

class Projects {
  Projects({
      num? id, 
      num? vendorId, 
      num? agentId, 
      String? categoryId,
      String? featuredImage, 
      String? minPrice, 
      String? maxPrice, 
      dynamic latitude, 
      dynamic longitude, 
      dynamic videoLink, 
      dynamic bannerImage, 
      String? projectPdf, 
      num? featured, 
      num? status, 
      String? stateId, 
      String? cityId, 
      String? createdAt, 
      String? updatedAt, 
      num? approveStatus, 
      String? title, 
      String? slug, 
      String? address,}){
    _id = id;
    _vendorId = vendorId;
    _agentId = agentId;
    _categoryId = categoryId;
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
    _title = title;
    _slug = slug;
    _address = address;
}

  Projects.fromJson(dynamic json) {
    _id = json['id'];
    _vendorId = json['vendor_id'];
    _agentId = json['agent_id'];
    _categoryId = json['category_id'].toString();
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
    _title = json['title'];
    _slug = json['slug'];
    _address = json['address'];
  }
  num? _id;
  num? _vendorId;
  num? _agentId;
  String? _categoryId;
  String? _featuredImage;
  String? _minPrice;
  String? _maxPrice;
  dynamic _latitude;
  dynamic _longitude;
  dynamic _videoLink;
  dynamic _bannerImage;
  String? _projectPdf;
  num? _featured;
  num? _status;
  String? _stateId;
  String? _cityId;
  String? _createdAt;
  String? _updatedAt;
  num? _approveStatus;
  String? _title;
  String? _slug;
  String? _address;
Projects copyWith({  num? id,
  num? vendorId,
  num? agentId,
  String? categoryId,
  String? featuredImage,
  String? minPrice,
  String? maxPrice,
  dynamic latitude,
  dynamic longitude,
  dynamic videoLink,
  dynamic bannerImage,
  String? projectPdf,
  num? featured,
  num? status,
  String? stateId,
  String? cityId,
  String? createdAt,
  String? updatedAt,
  num? approveStatus,
  String? title,
  String? slug,
  String? address,
}) => Projects(  id: id ?? _id,
  vendorId: vendorId ?? _vendorId,
  agentId: agentId ?? _agentId,
  categoryId: categoryId ?? _categoryId,
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
  title: title ?? _title,
  slug: slug ?? _slug,
  address: address ?? _address,
);
  num? get id => _id;
  num? get vendorId => _vendorId;
  num? get agentId => _agentId;
  String? get categoryId => _categoryId;
  String? get featuredImage => _featuredImage;
  String? get minPrice => _minPrice;
  String? get maxPrice => _maxPrice;
  dynamic get latitude => _latitude;
  dynamic get longitude => _longitude;
  dynamic get videoLink => _videoLink;
  dynamic get bannerImage => _bannerImage;
  String? get projectPdf => _projectPdf;
  num? get featured => _featured;
  num? get status => _status;
  String? get stateId => _stateId;
  String? get cityId => _cityId;
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
    map['category_id'] = _categoryId;
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
    map['title'] = _title;
    map['slug'] = _slug;
    map['address'] = _address;
    return map;
  }

}

/// current_page : 1
/// data : [{"id":78,"vendor_id":0,"agent_id":25,"category_id":35,"country_id":11,"state_id":29,"city_id":1090,"featured_image":"6666df58bf5e7.jpg","floor_planning_image":"6666df58c00cc.png","video_image":"666be934dbdc7.png","price":"12587.00","purpose":"rent","type":"commercial","beds":null,"bath":null,"area":14945,"video_url":"https://www.youtube.com/watch?v=mrpiPK8_up0","property_pdf":null,"status":1,"latitude":"28.475741040586485","longitude":"-81.47406092316122","created_at":"2024-06-10T11:11:20.000000Z","updated_at":"2024-06-14T06:54:44.000000Z","approve_status":1,"title":"Elegant Home in Quiet Neighborhood","slug":"elegant-home-in-quiet-neighborhood","description":"<p>Own a lanai apartment with a delightful 97' patio, tax roll initially designated it as a 2/2 with 1409 sq ft, but it has been modified to a 1/1.5 with an extra den (bedroom). The updated kitchen features new appliances, and ample storage space with a hookup for a washer and dryer.<br />This meticulously maintained unit offers a flexible layout, providing an option to move in seamlessly. The open floor plan connects living and dining areas, creating an ideal space for entertainment or relaxation. Beyond the interior, the lanai apartment offers a unique outdoor experience. The 97' patio extends your living space, perfect for enjoying the tropical climate.<br />A private gateway to the pool and steps away from the beach provides convenient leisure opportunities. Paradise awaits in your new lanai!</p>","address":"5911 Turkey Lake Rd, Orlando, FL 32819, USA","category_content":{"id":34,"category_id":35,"language_id":20,"name":"Hotel","slug":"hotel","created_at":"2024-06-10T06:15:04.000000Z","updated_at":"2024-06-10T06:15:04.000000Z"}},{"id":76,"vendor_id":0,"agent_id":null,"category_id":35,"country_id":11,"state_id":29,"city_id":1090,"featured_image":"6666db80c26f7.jpg","floor_planning_image":"6666db80c2f6f.png","video_image":"666be95438dc4.png","price":"500.00","purpose":"rent","type":"commercial","beds":null,"bath":null,"area":400,"video_url":"https://www.youtube.com/watch?v=mrpiPK8_up0","property_pdf":null,"status":1,"latitude":"37.763023736519635","longitude":"-122.42377480576295","created_at":"2024-06-10T10:54:56.000000Z","updated_at":"2024-06-14T06:55:16.000000Z","approve_status":1,"title":"Luxury Condo with Stunning City Views","slug":"luxury-condo-with-stunning-city-views","description":"<p>BY APPOINTMENTS ONLY !! 2-bedroom, 2-bathroom manufactured home in the heart of Sweetwater, FL 33172. Nestled in a central location, this residence offers convenience to nearby shopping plazas, ensuring that daily errands and retail therapy are just moments away. The home itself boasts a cozy and welcoming ambiance, with ample space for relaxation and entertaining. The well-appointed bedrooms provide comfort and privacy, while the bathrooms are modern and stylish. Whether you're enjoying the local amenities or unwinding in your own oasis, this manufactured home offers the perfect blend of comfort and convenience in a desirable location.</p>","address":"501 Guerrero St, San Francisco, CA 94110, USA","category_content":{"id":34,"category_id":35,"language_id":20,"name":"Hotel","slug":"hotel","created_at":"2024-06-10T06:15:04.000000Z","updated_at":"2024-06-10T06:15:04.000000Z"}}]
/// first_page_url : "https://matpit.com/api/properties-by-category?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "https://matpit.com/api/properties-by-category?page=1"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://matpit.com/api/properties-by-category?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}]
/// next_page_url : null
/// path : "https://matpit.com/api/properties-by-category"
/// per_page : 12
/// prev_page_url : null
/// to : 2
/// total : 2

class Properties {
  Properties({
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

  Properties.fromJson(dynamic json) {
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
Properties copyWith({  num? currentPage,
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
}) => Properties(  currentPage: currentPage ?? _currentPage,
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

/// id : 78
/// vendor_id : 0
/// agent_id : 25
/// category_id : 35
/// country_id : 11
/// state_id : 29
/// city_id : 1090
/// featured_image : "6666df58bf5e7.jpg"
/// floor_planning_image : "6666df58c00cc.png"
/// video_image : "666be934dbdc7.png"
/// price : "12587.00"
/// purpose : "rent"
/// type : "commercial"
/// beds : null
/// bath : null
/// area : 14945
/// video_url : "https://www.youtube.com/watch?v=mrpiPK8_up0"
/// property_pdf : null
/// status : 1
/// latitude : "28.475741040586485"
/// longitude : "-81.47406092316122"
/// created_at : "2024-06-10T11:11:20.000000Z"
/// updated_at : "2024-06-14T06:54:44.000000Z"
/// approve_status : 1
/// title : "Elegant Home in Quiet Neighborhood"
/// slug : "elegant-home-in-quiet-neighborhood"
/// description : "<p>Own a lanai apartment with a delightful 97' patio, tax roll initially designated it as a 2/2 with 1409 sq ft, but it has been modified to a 1/1.5 with an extra den (bedroom). The updated kitchen features new appliances, and ample storage space with a hookup for a washer and dryer.<br />This meticulously maintained unit offers a flexible layout, providing an option to move in seamlessly. The open floor plan connects living and dining areas, creating an ideal space for entertainment or relaxation. Beyond the interior, the lanai apartment offers a unique outdoor experience. The 97' patio extends your living space, perfect for enjoying the tropical climate.<br />A private gateway to the pool and steps away from the beach provides convenient leisure opportunities. Paradise awaits in your new lanai!</p>"
/// address : "5911 Turkey Lake Rd, Orlando, FL 32819, USA"
/// category_content : {"id":34,"category_id":35,"language_id":20,"name":"Hotel","slug":"hotel","created_at":"2024-06-10T06:15:04.000000Z","updated_at":"2024-06-10T06:15:04.000000Z"}

class Data {
  Data({
      num? id, 
      num? vendorId, 
      num? agentId, 
      num? categoryId, 
      num? countryId, 
      num? stateId, 
      num? cityId, 
      String? featuredImage, 
      String? floorPlanningImage, 
      String? videoImage, 
      String? price, 
      String? purpose, 
      String? type, 
      dynamic beds, 
      dynamic bath, 
      num? area, 
      String? videoUrl, 
      dynamic propertyPdf, 
      num? status, 
      String? latitude, 
      String? longitude, 
      String? createdAt, 
      String? updatedAt, 
      num? approveStatus, 
      String? title, 
      String? slug, 
      String? description, 
      String? address, 
      CategoryContent? categoryContent,}){
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
    _title = title;
    _slug = slug;
    _description = description;
    _address = address;
    _categoryContent = categoryContent;
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
    _title = json['title'];
    _slug = json['slug'];
    _description = json['description'];
    _address = json['address'];
    _categoryContent = json['category_content'] != null ? CategoryContent.fromJson(json['category_content']) : null;
  }
  num? _id;
  num? _vendorId;
  num? _agentId;
  num? _categoryId;
  num? _countryId;
  num? _stateId;
  num? _cityId;
  String? _featuredImage;
  String? _floorPlanningImage;
  String? _videoImage;
  String? _price;
  String? _purpose;
  String? _type;
  dynamic _beds;
  dynamic _bath;
  num? _area;
  String? _videoUrl;
  dynamic _propertyPdf;
  num? _status;
  String? _latitude;
  String? _longitude;
  String? _createdAt;
  String? _updatedAt;
  num? _approveStatus;
  String? _title;
  String? _slug;
  String? _description;
  String? _address;
  CategoryContent? _categoryContent;
Data copyWith({  num? id,
  num? vendorId,
  num? agentId,
  num? categoryId,
  num? countryId,
  num? stateId,
  num? cityId,
  String? featuredImage,
  String? floorPlanningImage,
  String? videoImage,
  String? price,
  String? purpose,
  String? type,
  dynamic beds,
  dynamic bath,
  num? area,
  String? videoUrl,
  dynamic propertyPdf,
  num? status,
  String? latitude,
  String? longitude,
  String? createdAt,
  String? updatedAt,
  num? approveStatus,
  String? title,
  String? slug,
  String? description,
  String? address,
  CategoryContent? categoryContent,
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
  title: title ?? _title,
  slug: slug ?? _slug,
  description: description ?? _description,
  address: address ?? _address,
  categoryContent: categoryContent ?? _categoryContent,
);
  num? get id => _id;
  num? get vendorId => _vendorId;
  num? get agentId => _agentId;
  num? get categoryId => _categoryId;
  num? get countryId => _countryId;
  num? get stateId => _stateId;
  num? get cityId => _cityId;
  String? get featuredImage => _featuredImage;
  String? get floorPlanningImage => _floorPlanningImage;
  String? get videoImage => _videoImage;
  String? get price => _price;
  String? get purpose => _purpose;
  String? get type => _type;
  dynamic get beds => _beds;
  dynamic get bath => _bath;
  num? get area => _area;
  String? get videoUrl => _videoUrl;
  dynamic get propertyPdf => _propertyPdf;
  num? get status => _status;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get approveStatus => _approveStatus;
  String? get title => _title;
  String? get slug => _slug;
  String? get description => _description;
  String? get address => _address;
  CategoryContent? get categoryContent => _categoryContent;

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
    map['title'] = _title;
    map['slug'] = _slug;
    map['description'] = _description;
    map['address'] = _address;
    if (_categoryContent != null) {
      map['category_content'] = _categoryContent?.toJson();
    }
    return map;
  }

}

/// id : 34
/// category_id : 35
/// language_id : 20
/// name : "Hotel"
/// slug : "hotel"
/// created_at : "2024-06-10T06:15:04.000000Z"
/// updated_at : "2024-06-10T06:15:04.000000Z"

class CategoryContent {
  CategoryContent({
      num? id, 
      num? categoryId, 
      num? languageId, 
      String? name, 
      String? slug, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _categoryId = categoryId;
    _languageId = languageId;
    _name = name;
    _slug = slug;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CategoryContent.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _languageId = json['language_id'];
    _name = json['name'];
    _slug = json['slug'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _categoryId;
  num? _languageId;
  String? _name;
  String? _slug;
  String? _createdAt;
  String? _updatedAt;
CategoryContent copyWith({  num? id,
  num? categoryId,
  num? languageId,
  String? name,
  String? slug,
  String? createdAt,
  String? updatedAt,
}) => CategoryContent(  id: id ?? _id,
  categoryId: categoryId ?? _categoryId,
  languageId: languageId ?? _languageId,
  name: name ?? _name,
  slug: slug ?? _slug,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get categoryId => _categoryId;
  num? get languageId => _languageId;
  String? get name => _name;
  String? get slug => _slug;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['language_id'] = _languageId;
    map['name'] = _name;
    map['slug'] = _slug;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}