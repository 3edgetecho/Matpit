class VenderProfileModel {
  String? status;
  Data? data;

  VenderProfileModel({this.status, this.data});

  VenderProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Vendor? vendor;

  Data({this.vendor});

  Data.fromJson(Map<String, dynamic> json) {
    vendor =
    json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    return data;
  }
}

class Vendor {
  int? id;
  String? photo;
  String? email;
  String? phone;
  String? username;
  String? password;
  int? status;
  int? amount;
  Null? emailVerifiedAt;
  int? avgRating;
  int? showEmailAddresss;
  int? showPhoneNumber;
  int? showContactForm;
  int? type;
  Null? businessAssociateId;
  String? createdAt;
  String? updatedAt;
  int? totalProperties;
  int? totalProjects;
  int? totalAgents;
  VendorInfo? vendorInfo;

  Vendor(
      {this.id,
        this.photo,
        this.email,
        this.phone,
        this.username,
        this.password,
        this.status,
        this.amount,
        this.emailVerifiedAt,
        this.avgRating,
        this.showEmailAddresss,
        this.showPhoneNumber,
        this.showContactForm,
        this.type,
        this.businessAssociateId,
        this.createdAt,
        this.updatedAt,
        this.totalProperties,
        this.totalProjects,
        this.totalAgents,
        this.vendorInfo});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
    status = json['status'];
    amount = json['amount'];
    emailVerifiedAt = json['email_verified_at'];
    avgRating = json['avg_rating'];
    showEmailAddresss = json['show_email_addresss'];
    showPhoneNumber = json['show_phone_number'];
    showContactForm = json['show_contact_form'];
    type = json['type'];
    businessAssociateId = json['business_associate_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalProperties = json['totalProperties'];
    totalProjects = json['totalProjects'];
    totalAgents = json['totalAgents'];
    vendorInfo = json['vendor_info'] != null
        ? new VendorInfo.fromJson(json['vendor_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['username'] = this.username;
    data['password'] = this.password;
    data['status'] = this.status;
    data['amount'] = this.amount;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['avg_rating'] = this.avgRating;
    data['show_email_addresss'] = this.showEmailAddresss;
    data['show_phone_number'] = this.showPhoneNumber;
    data['show_contact_form'] = this.showContactForm;
    data['type'] = this.type;
    data['business_associate_id'] = this.businessAssociateId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['totalProperties'] = this.totalProperties;
    data['totalProjects'] = this.totalProjects;
    data['totalAgents'] = this.totalAgents;
    if (this.vendorInfo != null) {
      data['vendor_info'] = this.vendorInfo!.toJson();
    }
    return data;
  }
}

class VendorInfo {
  int? id;
  int? vendorId;
  int? languageId;
  String? name;
  Null? country;
  Null? city;
  Null? state;
  Null? zipCode;
  Null? address;
  Null? details;
  String? createdAt;
  String? updatedAt;

  VendorInfo(
      {this.id,
        this.vendorId,
        this.languageId,
        this.name,
        this.country,
        this.city,
        this.state,
        this.zipCode,
        this.address,
        this.details,
        this.createdAt,
        this.updatedAt});

  VendorInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    languageId = json['language_id'];
    name = json['name'];
    country = json['country'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    address = json['address'];
    details = json['details'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['language_id'] = this.languageId;
    data['name'] = this.name;
    data['country'] = this.country;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['address'] = this.address;
    data['details'] = this.details;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
