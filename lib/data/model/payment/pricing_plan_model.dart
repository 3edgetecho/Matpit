/// id : 25
/// icon : "fas fa-home"
/// title : "Single Property"
/// price : 100
/// term : "monthly"
/// number_of_agent : 0
/// number_of_property : 1
/// number_of_property_gallery_images : 5
/// number_of_property_adittionl_specifications : 5
/// number_of_projects : 0
/// number_of_project_types : 0
/// number_of_project_gallery_images : 0
/// number_of_project_additionl_specifications : 0
/// is_trial : 0
/// trial_days : 0
/// status : 1
/// created_at : "2025-05-08T09:54:51.000000Z"
/// updated_at : "2025-05-12T05:33:07.000000Z"
/// is_featured : true

class PricePlan {
  PricePlan({
      num? id, 
      String? icon, 
      String? title, 
      num? price, 
      String? term, 
      num? numberOfAgent, 
      num? numberOfProperty, 
      num? numberOfPropertyGalleryImages, 
      num? numberOfPropertyAdittionlSpecifications, 
      num? numberOfProjects, 
      num? numberOfProjectTypes, 
      num? numberOfProjectGalleryImages, 
      num? numberOfProjectAdditionlSpecifications, 
      num? isTrial, 
      num? trialDays, 
      num? status, 
      String? createdAt, 
      String? updatedAt, 
      bool? isFeatured,}){
    _id = id;
    _icon = icon;
    _title = title;
    _price = price;
    _term = term;
    _numberOfAgent = numberOfAgent;
    _numberOfProperty = numberOfProperty;
    _numberOfPropertyGalleryImages = numberOfPropertyGalleryImages;
    _numberOfPropertyAdittionlSpecifications = numberOfPropertyAdittionlSpecifications;
    _numberOfProjects = numberOfProjects;
    _numberOfProjectTypes = numberOfProjectTypes;
    _numberOfProjectGalleryImages = numberOfProjectGalleryImages;
    _numberOfProjectAdditionlSpecifications = numberOfProjectAdditionlSpecifications;
    _isTrial = isTrial;
    _trialDays = trialDays;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _isFeatured = isFeatured;
}

  PricePlan.fromJson(dynamic json) {
    _id = json['id'];
    _icon = json['icon'];
    _title = json['title'];
    _price = json['price']??"0";
    _term = json['term'];
    _numberOfAgent = json['number_of_agent'];
    _numberOfProperty = json['number_of_property'];
    _numberOfPropertyGalleryImages = json['number_of_property_gallery_images'];
    _numberOfPropertyAdittionlSpecifications = json['number_of_property_adittionl_specifications'];
    _numberOfProjects = json['number_of_projects'];
    _numberOfProjectTypes = json['number_of_project_types'];
    _numberOfProjectGalleryImages = json['number_of_project_gallery_images'];
    _numberOfProjectAdditionlSpecifications = json['number_of_project_additionl_specifications'];
    _isTrial = json['is_trial'];
    _trialDays = json['trial_days'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isFeatured = json['is_featured'];
  }
  num? _id;
  String? _icon;
  String? _title;
  num? _price;
  String? _term;
  num? _numberOfAgent;
  num? _numberOfProperty;
  num? _numberOfPropertyGalleryImages;
  num? _numberOfPropertyAdittionlSpecifications;
  num? _numberOfProjects;
  num? _numberOfProjectTypes;
  num? _numberOfProjectGalleryImages;
  num? _numberOfProjectAdditionlSpecifications;
  num? _isTrial;
  num? _trialDays;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  bool? _isFeatured;
PricePlan copyWith({  num? id,
  String? icon,
  String? title,
  num? price,
  String? term,
  num? numberOfAgent,
  num? numberOfProperty,
  num? numberOfPropertyGalleryImages,
  num? numberOfPropertyAdittionlSpecifications,
  num? numberOfProjects,
  num? numberOfProjectTypes,
  num? numberOfProjectGalleryImages,
  num? numberOfProjectAdditionlSpecifications,
  num? isTrial,
  num? trialDays,
  num? status,
  String? createdAt,
  String? updatedAt,
  bool? isFeatured,
}) => PricePlan(  id: id ?? _id,
  icon: icon ?? _icon,
  title: title ?? _title,
  price: price ?? _price,
  term: term ?? _term,
  numberOfAgent: numberOfAgent ?? _numberOfAgent,
  numberOfProperty: numberOfProperty ?? _numberOfProperty,
  numberOfPropertyGalleryImages: numberOfPropertyGalleryImages ?? _numberOfPropertyGalleryImages,
  numberOfPropertyAdittionlSpecifications: numberOfPropertyAdittionlSpecifications ?? _numberOfPropertyAdittionlSpecifications,
  numberOfProjects: numberOfProjects ?? _numberOfProjects,
  numberOfProjectTypes: numberOfProjectTypes ?? _numberOfProjectTypes,
  numberOfProjectGalleryImages: numberOfProjectGalleryImages ?? _numberOfProjectGalleryImages,
  numberOfProjectAdditionlSpecifications: numberOfProjectAdditionlSpecifications ?? _numberOfProjectAdditionlSpecifications,
  isTrial: isTrial ?? _isTrial,
  trialDays: trialDays ?? _trialDays,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  isFeatured: isFeatured ?? _isFeatured,
);
  num? get id => _id;
  String? get icon => _icon;
  String? get title => _title;
  num? get price => _price;
  String? get term => _term;
  num? get numberOfAgent => _numberOfAgent;
  num? get numberOfProperty => _numberOfProperty;
  num? get numberOfPropertyGalleryImages => _numberOfPropertyGalleryImages;
  num? get numberOfPropertyAdittionlSpecifications => _numberOfPropertyAdittionlSpecifications;
  num? get numberOfProjects => _numberOfProjects;
  num? get numberOfProjectTypes => _numberOfProjectTypes;
  num? get numberOfProjectGalleryImages => _numberOfProjectGalleryImages;
  num? get numberOfProjectAdditionlSpecifications => _numberOfProjectAdditionlSpecifications;
  num? get isTrial => _isTrial;
  num? get trialDays => _trialDays;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  bool? get isFeatured => _isFeatured;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['icon'] = _icon;
    map['title'] = _title;
    map['price'] = _price;
    map['term'] = _term;
    map['number_of_agent'] = _numberOfAgent;
    map['number_of_property'] = _numberOfProperty;
    map['number_of_property_gallery_images'] = _numberOfPropertyGalleryImages;
    map['number_of_property_adittionl_specifications'] = _numberOfPropertyAdittionlSpecifications;
    map['number_of_projects'] = _numberOfProjects;
    map['number_of_project_types'] = _numberOfProjectTypes;
    map['number_of_project_gallery_images'] = _numberOfProjectGalleryImages;
    map['number_of_project_additionl_specifications'] = _numberOfProjectAdditionlSpecifications;
    map['is_trial'] = _isTrial;
    map['trial_days'] = _trialDays;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['is_featured'] = _isFeatured;
    return map;
  }

}