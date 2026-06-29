/// id : 60
/// photo : "683175782963f.jpeg"
/// email : "man300preet@gmail.com"
/// phone : "7014382254"
/// username : "Chenpal Singh"
/// password : "$2y$10$/JXEFPWxJXMphY4JStTr.emYMyQVckTDttvOcdMmiwgol5k4xdQKi"
/// status : 1
/// amount : 0
/// email_verified_at : "2025-05-24 13:00:00"
/// avg_rating : 0
/// show_email_addresss : 0
/// show_phone_number : 1
/// show_contact_form : 0
/// type : 0
/// business_associate_id : null
/// created_at : "2025-05-24T07:30:00.000000Z"
/// updated_at : "2025-05-27T08:09:43.000000Z"
/// vendor_info : {"id":86,"vendor_id":60,"language_id":20,"name":"Chenpal Singh","country":"India","city":"Jodhpur","state":null,"zip_code":"342013","address":"House No-09, Radha Krishna Vihar Colony, \r\nSalawas Road Sangriya Fata","details":"Jodhpur Sales","created_at":"2025-05-24T07:30:00.000000Z","updated_at":"2025-05-24T07:30:00.000000Z"}

class Vendor {
  Vendor({
      num? id, 
      String? photo, 
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
    _type = type;
    _businessAssociateId = businessAssociateId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _vendorInfo = vendorInfo;
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
    _vendorInfo = json['vendor_info'] != null ? VendorInfo.fromJson(json['vendor_info']) : null;
  }
  num? _id;
  String? _photo;
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
  VendorInfo? _vendorInfo;
  Vendor copyWith({  num? id,
  String? photo,
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
  VendorInfo? vendorInfo,
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
  vendorInfo: vendorInfo ?? _vendorInfo,
);
  num? get id => _id;
  String? get photo => _photo;
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
    map['type'] = _type;
    map['business_associate_id'] = _businessAssociateId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_vendorInfo != null) {
      map['vendor_info'] = _vendorInfo?.toJson();
    }
    return map;
  }

}

/// id : 86
/// vendor_id : 60
/// language_id : 20
/// name : "Chenpal Singh"
/// country : "India"
/// city : "Jodhpur"
/// state : null
/// zip_code : "342013"
/// address : "House No-09, Radha Krishna Vihar Colony, \r\nSalawas Road Sangriya Fata"
/// details : "Jodhpur Sales"
/// created_at : "2025-05-24T07:30:00.000000Z"
/// updated_at : "2025-05-24T07:30:00.000000Z"

class VendorInfo {
  VendorInfo({
      num? id, 
      num? vendorId, 
      num? languageId, 
      String? name, 
      String? country, 
      String? city, 
      dynamic state, 
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
  dynamic _state;
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
  dynamic state,
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
  dynamic get state => _state;
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