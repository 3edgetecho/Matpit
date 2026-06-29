/// status : "success"
/// message : "Projects fetched successfully."
/// data : {"language":{"id":20,"name":"English","code":"en","direction":0,"is_default":1,"created_at":"2023-08-17T03:19:12.000000Z","updated_at":"2023-08-17T03:19:17.000000Z"},"langs":[{"id":20,"name":"English","code":"en","direction":0,"is_default":1,"created_at":"2023-08-17T03:19:12.000000Z","updated_at":"2023-08-17T03:19:17.000000Z"}],"projects":{"current_page":1,"data":[{"id":69,"vendor_id":47,"agent_id":0,"featured_image":"6840220aa0fda.jpeg","min_price":"1000.00","max_price":"2000.00","latitude":null,"longitude":null,"video_link":null,"banner_image":"6840220aa10e7.jpeg","project_pdf":null,"featured":0,"status":1,"state_id":"29","city_id":"1079","created_at":"2025-06-04T10:38:02.000000Z","updated_at":"2025-06-04T10:38:02.000000Z","approve_status":1,"proejct_contents":[{"id":107,"language_id":20,"project_id":69,"title":"test title","slug":"test-title","address":"jaipur","description":"<p>lorem ipsum doler sit amet</p>","meta_keyword":"project,projects","meta_description":"lorem ipsum doler sit amet","created_at":"2025-06-04T10:38:02.000000Z","updated_at":"2025-06-04T10:38:02.000000Z"}],"vendor":{"id":47,"photo":null,"email":"viren@test.com","phone":"8094962100","username":"viren","password":"$2y$10$Ywi/sqpujK.Hr4D2e/jGA.GulxHxbpJbTIgK/fVlWZcwEvDMJU2M.","status":1,"amount":0,"email_verified_at":"2025-05-08 15:26:51","avg_rating":0,"show_email_addresss":1,"show_phone_number":1,"show_contact_form":1,"type":0,"business_associate_id":null,"created_at":"2025-05-08T09:56:51.000000Z","updated_at":"2025-05-14T07:46:20.000000Z"}}],"first_page_url":"https://matpit.com/api/vendor/project-get/47?page=1","from":1,"last_page":1,"last_page_url":"https://matpit.com/api/vendor/project-get/47?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://matpit.com/api/vendor/project-get/47?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"https://matpit.com/api/vendor/project-get/47","per_page":10,"prev_page_url":null,"to":1,"total":1}}

class ProjectListResponse {
  ProjectListResponse({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ProjectListResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  Data? _data;
ProjectListResponse copyWith({  String? status,
  String? message,
  Data? data,
}) => ProjectListResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  String? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// language : {"id":20,"name":"English","code":"en","direction":0,"is_default":1,"created_at":"2023-08-17T03:19:12.000000Z","updated_at":"2023-08-17T03:19:17.000000Z"}
/// langs : [{"id":20,"name":"English","code":"en","direction":0,"is_default":1,"created_at":"2023-08-17T03:19:12.000000Z","updated_at":"2023-08-17T03:19:17.000000Z"}]
/// projects : {"current_page":1,"data":[{"id":69,"vendor_id":47,"agent_id":0,"featured_image":"6840220aa0fda.jpeg","min_price":"1000.00","max_price":"2000.00","latitude":null,"longitude":null,"video_link":null,"banner_image":"6840220aa10e7.jpeg","project_pdf":null,"featured":0,"status":1,"state_id":"29","city_id":"1079","created_at":"2025-06-04T10:38:02.000000Z","updated_at":"2025-06-04T10:38:02.000000Z","approve_status":1,"proejct_contents":[{"id":107,"language_id":20,"project_id":69,"title":"test title","slug":"test-title","address":"jaipur","description":"<p>lorem ipsum doler sit amet</p>","meta_keyword":"project,projects","meta_description":"lorem ipsum doler sit amet","created_at":"2025-06-04T10:38:02.000000Z","updated_at":"2025-06-04T10:38:02.000000Z"}],"vendor":{"id":47,"photo":null,"email":"viren@test.com","phone":"8094962100","username":"viren","password":"$2y$10$Ywi/sqpujK.Hr4D2e/jGA.GulxHxbpJbTIgK/fVlWZcwEvDMJU2M.","status":1,"amount":0,"email_verified_at":"2025-05-08 15:26:51","avg_rating":0,"show_email_addresss":1,"show_phone_number":1,"show_contact_form":1,"type":0,"business_associate_id":null,"created_at":"2025-05-08T09:56:51.000000Z","updated_at":"2025-05-14T07:46:20.000000Z"}}],"first_page_url":"https://matpit.com/api/vendor/project-get/47?page=1","from":1,"last_page":1,"last_page_url":"https://matpit.com/api/vendor/project-get/47?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://matpit.com/api/vendor/project-get/47?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"https://matpit.com/api/vendor/project-get/47","per_page":10,"prev_page_url":null,"to":1,"total":1}

class Data {
  Data({
      Language? language, 
      List<Langs>? langs, 
      Projects? projects,}){
    _language = language;
    _langs = langs;
    _projects = projects;
}

  Data.fromJson(dynamic json) {
    _language = json['language'] != null ? Language.fromJson(json['language']) : null;
    if (json['langs'] != null) {
      _langs = [];
      json['langs'].forEach((v) {
        _langs?.add(Langs.fromJson(v));
      });
    }
    _projects = json['projects'] != null ? Projects.fromJson(json['projects']) : null;
  }
  Language? _language;
  List<Langs>? _langs;
  Projects? _projects;
Data copyWith({  Language? language,
  List<Langs>? langs,
  Projects? projects,
}) => Data(  language: language ?? _language,
  langs: langs ?? _langs,
  projects: projects ?? _projects,
);
  Language? get language => _language;
  List<Langs>? get langs => _langs;
  Projects? get projects => _projects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_language != null) {
      map['language'] = _language?.toJson();
    }
    if (_langs != null) {
      map['langs'] = _langs?.map((v) => v.toJson()).toList();
    }
    if (_projects != null) {
      map['projects'] = _projects?.toJson();
    }
    return map;
  }

}

/// current_page : 1
/// data : [{"id":69,"vendor_id":47,"agent_id":0,"featured_image":"6840220aa0fda.jpeg","min_price":"1000.00","max_price":"2000.00","latitude":null,"longitude":null,"video_link":null,"banner_image":"6840220aa10e7.jpeg","project_pdf":null,"featured":0,"status":1,"state_id":"29","city_id":"1079","created_at":"2025-06-04T10:38:02.000000Z","updated_at":"2025-06-04T10:38:02.000000Z","approve_status":1,"proejct_contents":[{"id":107,"language_id":20,"project_id":69,"title":"test title","slug":"test-title","address":"jaipur","description":"<p>lorem ipsum doler sit amet</p>","meta_keyword":"project,projects","meta_description":"lorem ipsum doler sit amet","created_at":"2025-06-04T10:38:02.000000Z","updated_at":"2025-06-04T10:38:02.000000Z"}],"vendor":{"id":47,"photo":null,"email":"viren@test.com","phone":"8094962100","username":"viren","password":"$2y$10$Ywi/sqpujK.Hr4D2e/jGA.GulxHxbpJbTIgK/fVlWZcwEvDMJU2M.","status":1,"amount":0,"email_verified_at":"2025-05-08 15:26:51","avg_rating":0,"show_email_addresss":1,"show_phone_number":1,"show_contact_form":1,"type":0,"business_associate_id":null,"created_at":"2025-05-08T09:56:51.000000Z","updated_at":"2025-05-14T07:46:20.000000Z"}}]
/// first_page_url : "https://matpit.com/api/vendor/project-get/47?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "https://matpit.com/api/vendor/project-get/47?page=1"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://matpit.com/api/vendor/project-get/47?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}]
/// next_page_url : null
/// path : "https://matpit.com/api/vendor/project-get/47"
/// per_page : 10
/// prev_page_url : null
/// to : 1
/// total : 1

class Projects {
  Projects({
      num? currentPage, 
      List<ProjectData>? data,
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

  Projects.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ProjectData.fromJson(v));
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
  List<ProjectData>? _data;
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
Projects copyWith({  num? currentPage,
  List<ProjectData>? data,
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
}) => Projects(  currentPage: currentPage ?? _currentPage,
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
  List<ProjectData>? get data => _data;
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

/// id : 69
/// vendor_id : 47
/// agent_id : 0
/// featured_image : "6840220aa0fda.jpeg"
/// min_price : "1000.00"
/// max_price : "2000.00"
/// latitude : null
/// longitude : null
/// video_link : null
/// banner_image : "6840220aa10e7.jpeg"
/// project_pdf : null
/// featured : 0
/// status : 1
/// state_id : "29"
/// city_id : "1079"
/// created_at : "2025-06-04T10:38:02.000000Z"
/// updated_at : "2025-06-04T10:38:02.000000Z"
/// approve_status : 1
/// proejct_contents : [{"id":107,"language_id":20,"project_id":69,"title":"test title","slug":"test-title","address":"jaipur","description":"<p>lorem ipsum doler sit amet</p>","meta_keyword":"project,projects","meta_description":"lorem ipsum doler sit amet","created_at":"2025-06-04T10:38:02.000000Z","updated_at":"2025-06-04T10:38:02.000000Z"}]
/// vendor : {"id":47,"photo":null,"email":"viren@test.com","phone":"8094962100","username":"viren","password":"$2y$10$Ywi/sqpujK.Hr4D2e/jGA.GulxHxbpJbTIgK/fVlWZcwEvDMJU2M.","status":1,"amount":0,"email_verified_at":"2025-05-08 15:26:51","avg_rating":0,"show_email_addresss":1,"show_phone_number":1,"show_contact_form":1,"type":0,"business_associate_id":null,"created_at":"2025-05-08T09:56:51.000000Z","updated_at":"2025-05-14T07:46:20.000000Z"}

class ProjectData {
  ProjectData({
      num? id, 
      num? vendorId, 
      num? agentId, 
      String? featuredImage, 
      String? minPrice, 
      String? maxPrice, 
      dynamic latitude, 
      dynamic longitude, 
      dynamic videoLink, 
      String? bannerImage, 
      dynamic projectPdf, 
      num? featured, 
      num? status, 
      String? stateId, 
      String? cityId, 
      String? createdAt, 
      String? updatedAt, 
      num? approveStatus, 
      List<ProejctContents>? proejctContents, 
      Vendor? vendor,}){
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
    _proejctContents = proejctContents;
    _vendor = vendor;
}

  ProjectData.fromJson(dynamic json) {
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
    if (json['proejct_contents'] != null) {
      _proejctContents = [];
      json['proejct_contents'].forEach((v) {
        _proejctContents?.add(ProejctContents.fromJson(v));
      });
    }
    _vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
  }
  num? _id;
  num? _vendorId;
  num? _agentId;
  String? _featuredImage;
  String? _minPrice;
  String? _maxPrice;
  dynamic _latitude;
  dynamic _longitude;
  dynamic _videoLink;
  String? _bannerImage;
  dynamic _projectPdf;
  num? _featured;
  num? _status;
  String? _stateId;
  String? _cityId;
  String? _createdAt;
  String? _updatedAt;
  num? _approveStatus;
  List<ProejctContents>? _proejctContents;
  Vendor? _vendor;
  ProjectData copyWith({  num? id,
  num? vendorId,
  num? agentId,
  String? featuredImage,
  String? minPrice,
  String? maxPrice,
  dynamic latitude,
  dynamic longitude,
  dynamic videoLink,
  String? bannerImage,
  dynamic projectPdf,
  num? featured,
  num? status,
  String? stateId,
  String? cityId,
  String? createdAt,
  String? updatedAt,
  num? approveStatus,
  List<ProejctContents>? proejctContents,
  Vendor? vendor,
}) => ProjectData(  id: id ?? _id,
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
  proejctContents: proejctContents ?? _proejctContents,
  vendor: vendor ?? _vendor,
);
  num? get id => _id;
  num? get vendorId => _vendorId;
  num? get agentId => _agentId;
  String? get featuredImage => _featuredImage;
  String? get minPrice => _minPrice;
  String? get maxPrice => _maxPrice;
  dynamic get latitude => _latitude;
  dynamic get longitude => _longitude;
  dynamic get videoLink => _videoLink;
  String? get bannerImage => _bannerImage;
  dynamic get projectPdf => _projectPdf;
  num? get featured => _featured;
  num? get status => _status;
  String? get stateId => _stateId;
  String? get cityId => _cityId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get approveStatus => _approveStatus;
  List<ProejctContents>? get proejctContents => _proejctContents;
  Vendor? get vendor => _vendor;

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
    if (_proejctContents != null) {
      map['proejct_contents'] = _proejctContents?.map((v) => v.toJson()).toList();
    }
    if (_vendor != null) {
      map['vendor'] = _vendor?.toJson();
    }
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
/// type : 0
/// business_associate_id : null
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
      num? type, 
      dynamic businessAssociateId, 
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
    _type = type;
    _businessAssociateId = businessAssociateId;
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
    _type = json['type'];
    _businessAssociateId = json['business_associate_id'];
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
  num? _type;
  dynamic _businessAssociateId;
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
  num? type,
  dynamic businessAssociateId,
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
  type: type ?? _type,
  businessAssociateId: businessAssociateId ?? _businessAssociateId,
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
  num? get type => _type;
  dynamic get businessAssociateId => _businessAssociateId;
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
    map['type'] = _type;
    map['business_associate_id'] = _businessAssociateId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 107
/// language_id : 20
/// project_id : 69
/// title : "test title"
/// slug : "test-title"
/// address : "jaipur"
/// description : "<p>lorem ipsum doler sit amet</p>"
/// meta_keyword : "project,projects"
/// meta_description : "lorem ipsum doler sit amet"
/// created_at : "2025-06-04T10:38:02.000000Z"
/// updated_at : "2025-06-04T10:38:02.000000Z"

class ProejctContents {
  ProejctContents({
      num? id, 
      num? languageId, 
      num? projectId, 
      String? title, 
      String? slug, 
      String? address, 
      String? description, 
      String? metaKeyword, 
      String? metaDescription, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _languageId = languageId;
    _projectId = projectId;
    _title = title;
    _slug = slug;
    _address = address;
    _description = description;
    _metaKeyword = metaKeyword;
    _metaDescription = metaDescription;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ProejctContents.fromJson(dynamic json) {
    _id = json['id'];
    _languageId = json['language_id'];
    _projectId = json['project_id'];
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
  num? _languageId;
  num? _projectId;
  String? _title;
  String? _slug;
  String? _address;
  String? _description;
  String? _metaKeyword;
  String? _metaDescription;
  String? _createdAt;
  String? _updatedAt;
ProejctContents copyWith({  num? id,
  num? languageId,
  num? projectId,
  String? title,
  String? slug,
  String? address,
  String? description,
  String? metaKeyword,
  String? metaDescription,
  String? createdAt,
  String? updatedAt,
}) => ProejctContents(  id: id ?? _id,
  languageId: languageId ?? _languageId,
  projectId: projectId ?? _projectId,
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
  num? get languageId => _languageId;
  num? get projectId => _projectId;
  String? get title => _title;
  String? get slug => _slug;
  String? get address => _address;
  String? get description => _description;
  String? get metaKeyword => _metaKeyword;
  String? get metaDescription => _metaDescription;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['language_id'] = _languageId;
    map['project_id'] = _projectId;
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

/// id : 20
/// name : "English"
/// code : "en"
/// direction : 0
/// is_default : 1
/// created_at : "2023-08-17T03:19:12.000000Z"
/// updated_at : "2023-08-17T03:19:17.000000Z"

class Langs {
  Langs({
      num? id, 
      String? name, 
      String? code, 
      num? direction, 
      num? isDefault, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _code = code;
    _direction = direction;
    _isDefault = isDefault;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Langs.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _direction = json['direction'];
    _isDefault = json['is_default'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _code;
  num? _direction;
  num? _isDefault;
  String? _createdAt;
  String? _updatedAt;
Langs copyWith({  num? id,
  String? name,
  String? code,
  num? direction,
  num? isDefault,
  String? createdAt,
  String? updatedAt,
}) => Langs(  id: id ?? _id,
  name: name ?? _name,
  code: code ?? _code,
  direction: direction ?? _direction,
  isDefault: isDefault ?? _isDefault,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get code => _code;
  num? get direction => _direction;
  num? get isDefault => _isDefault;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['direction'] = _direction;
    map['is_default'] = _isDefault;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 20
/// name : "English"
/// code : "en"
/// direction : 0
/// is_default : 1
/// created_at : "2023-08-17T03:19:12.000000Z"
/// updated_at : "2023-08-17T03:19:17.000000Z"

class Language {
  Language({
      num? id, 
      String? name, 
      String? code, 
      num? direction, 
      num? isDefault, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _code = code;
    _direction = direction;
    _isDefault = isDefault;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Language.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _direction = json['direction'];
    _isDefault = json['is_default'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _code;
  num? _direction;
  num? _isDefault;
  String? _createdAt;
  String? _updatedAt;
Language copyWith({  num? id,
  String? name,
  String? code,
  num? direction,
  num? isDefault,
  String? createdAt,
  String? updatedAt,
}) => Language(  id: id ?? _id,
  name: name ?? _name,
  code: code ?? _code,
  direction: direction ?? _direction,
  isDefault: isDefault ?? _isDefault,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get code => _code;
  num? get direction => _direction;
  num? get isDefault => _isDefault;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['direction'] = _direction;
    map['is_default'] = _isDefault;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}