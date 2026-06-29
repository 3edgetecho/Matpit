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
/// totalProperties : 2
/// totalProjects : 0
/// totalAgents : 0
/// vendor_info : {"id":73,"vendor_id":47,"language_id":20,"name":"Viren","country":"ndia","city":"Jaipur","state":"Rajasthan","zip_code":"302017","address":"Flat no 305, jeet Apartment , Ratanada , Jodhpur 342001","details":"We are a reputed vendor","created_at":"2025-05-08T09:56:51.000000Z","updated_at":"2025-05-14T07:45:49.000000Z"}

class AgentProfileModel {
  AgentProfileModel({
      num? id, 
      dynamic photo, 
      String? email, 
      String? phone, 
      String? username, 
      String? password,
    String? status,
      num? amount, 
      String? emailVerifiedAt, 
      num? avgRating, 
      num? showEmailAddresss, 
      num? showPhoneNumber, 
      num? showContactForm, 
      String? createdAt, 
      String? updatedAt, 
      num? totalProperties, 
      num? totalProjects, 
      num? totalAgents, 
      VendorInfo? vendorInfo,}){
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
    _totalProperties = totalProperties;
    _totalProjects = totalProjects;
    _totalAgents = totalAgents;
    _vendorInfo = vendorInfo;
}

  AgentProfileModel.fromJson(dynamic json) {
    _id = json['id'];
    _photo = json['photo'];
    _email = json['email'];
    _phone = json['phone'];
    _username = json['username'];
    _password = json['password'];
    _status = json['status'].toString();
    _amount = json['amount'];
    _emailVerifiedAt = json['email_verified_at'];
    _avgRating = json['avg_rating'];
    _showEmailAddresss = json['show_email_addresss'];
    _showPhoneNumber = json['show_phone_number'];
    _showContactForm = json['show_contact_form'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _totalProperties = json['totalProperties'];
    _totalProjects = json['totalProjects'];
    _totalAgents = json['totalAgents'];
    _vendorInfo = json['vendor_info'] != null ? VendorInfo.fromJson(json['vendor_info']) : null;
  }
  num? _id;
  dynamic _photo;
  String? _email;
  String? _phone;
  String? _username;
  String? _password;
  String? _status;
  num? _amount;
  String? _emailVerifiedAt;
  num? _avgRating;
  num? _showEmailAddresss;
  num? _showPhoneNumber;
  num? _showContactForm;
  String? _createdAt;
  String? _updatedAt;
  num? _totalProperties;
  num? _totalProjects;
  num? _totalAgents;
  VendorInfo? _vendorInfo;
AgentProfileModel copyWith({  num? id,
  dynamic photo,
  String? email,
  String? phone,
  String? username,
  String? password,
  String? status,
  num? amount,
  String? emailVerifiedAt,
  num? avgRating,
  num? showEmailAddresss,
  num? showPhoneNumber,
  num? showContactForm,
  String? createdAt,
  String? updatedAt,
  num? totalProperties,
  num? totalProjects,
  num? totalAgents,
  VendorInfo? vendorInfo,
}) => AgentProfileModel(  id: id ?? _id,
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
  totalProperties: totalProperties ?? _totalProperties,
  totalProjects: totalProjects ?? _totalProjects,
  totalAgents: totalAgents ?? _totalAgents,
  vendorInfo: vendorInfo ?? _vendorInfo,
);
  num? get id => _id;
  dynamic get photo => _photo;
  String? get email => _email;
  String? get phone => _phone;
  String? get username => _username;
  String? get password => _password;
  String? get status => _status;
  num? get amount => _amount;
  String? get emailVerifiedAt => _emailVerifiedAt;
  num? get avgRating => _avgRating;
  num? get showEmailAddresss => _showEmailAddresss;
  num? get showPhoneNumber => _showPhoneNumber;
  num? get showContactForm => _showContactForm;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get totalProperties => _totalProperties;
  num? get totalProjects => _totalProjects;
  num? get totalAgents => _totalAgents;
  VendorInfo? get vendorInfo => _vendorInfo;

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
    map['totalProperties'] = _totalProperties;
    map['totalProjects'] = _totalProjects;
    map['totalAgents'] = _totalAgents;
    if (_vendorInfo != null) {
      map['vendor_info'] = _vendorInfo?.toJson();
    }
    return map;
  }

}

/// id : 73
/// vendor_id : 47
/// language_id : 20
/// name : "Viren"
/// country : "ndia"
/// city : "Jaipur"
/// state : "Rajasthan"
/// zip_code : "302017"
/// address : "Flat no 305, jeet Apartment , Ratanada , Jodhpur 342001"
/// details : "We are a reputed vendor"
/// created_at : "2025-05-08T09:56:51.000000Z"
/// updated_at : "2025-05-14T07:45:49.000000Z"

class VendorInfo {
  VendorInfo({
      num? id, 
      num? vendorId, 
      num? languageId, 
      String? name, 
      String? country, 
      String? city, 
      String? state, 
      String? zipCode, 
      String? address, 
      String? details, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _vendorId = vendorId;
    _languageId = languageId;
    _name = name;
    _country = country;
    _city = city;
    _state = state;
    _zipCode = zipCode;
    _address = address;
    _details = details;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  VendorInfo.fromJson(dynamic json) {
    _id = json['id'];
    _vendorId = json['vendor_id'];
    _languageId = json['language_id'];
    _name = json['name'];
    _country = json['country'];
    _city = json['city'];
    _state = json['state'];
    _zipCode = json['zip_code'];
    _address = json['address'];
    _details = json['details'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _vendorId;
  num? _languageId;
  String? _name;
  String? _country;
  String? _city;
  String? _state;
  String? _zipCode;
  String? _address;
  String? _details;
  String? _createdAt;
  String? _updatedAt;
VendorInfo copyWith({  num? id,
  num? vendorId,
  num? languageId,
  String? name,
  String? country,
  String? city,
  String? state,
  String? zipCode,
  String? address,
  String? details,
  String? createdAt,
  String? updatedAt,
}) => VendorInfo(  id: id ?? _id,
  vendorId: vendorId ?? _vendorId,
  languageId: languageId ?? _languageId,
  name: name ?? _name,
  country: country ?? _country,
  city: city ?? _city,
  state: state ?? _state,
  zipCode: zipCode ?? _zipCode,
  address: address ?? _address,
  details: details ?? _details,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get vendorId => _vendorId;
  num? get languageId => _languageId;
  String? get name => _name;
  String? get country => _country;
  String? get city => _city;
  String? get state => _state;
  String? get zipCode => _zipCode;
  String? get address => _address;
  String? get details => _details;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['vendor_id'] = _vendorId;
    map['language_id'] = _languageId;
    map['name'] = _name;
    map['country'] = _country;
    map['city'] = _city;
    map['state'] = _state;
    map['zip_code'] = _zipCode;
    map['address'] = _address;
    map['details'] = _details;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}