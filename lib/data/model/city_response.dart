/// cities : [{"city_id":1079,"name":"Bali"},{"city_id":1080,"name":"Banswara"},{"city_id":1081,"name":"Ajmer"},{"city_id":1082,"name":"Alwar"},{"city_id":1083,"name":"Bandikui"},{"city_id":1084,"name":"Baran"},{"city_id":1085,"name":"Barmer"},{"city_id":1086,"name":"Bikaner"},{"city_id":1087,"name":"Fatehpur"},{"city_id":1088,"name":"Jaipur"},{"city_id":1089,"name":"Jaisalmer"},{"city_id":1090,"name":"Jodhpur"},{"city_id":1091,"name":"Kota"},{"city_id":1092,"name":"Lachhmangarh"},{"city_id":1093,"name":"Ladnu"},{"city_id":1094,"name":"Lakheri"},{"city_id":1095,"name":"Lalsot"},{"city_id":1096,"name":"Losal"},{"city_id":1097,"name":"Makrana"},{"city_id":1098,"name":"Malpura"},{"city_id":1099,"name":"Mandalgarh"},{"city_id":1100,"name":"Mandawa"},{"city_id":1101,"name":"Mangrol"},{"city_id":1102,"name":"Merta City"},{"city_id":1103,"name":"Mount Abu"},{"city_id":1104,"name":"Nadbai"},{"city_id":1105,"name":"Nagar"},{"city_id":1106,"name":"Nagaur"},{"city_id":1107,"name":"Nargund"},{"city_id":1108,"name":"Nasirabad"},{"city_id":1109,"name":"Nathdwara"},{"city_id":1110,"name":"Navalgund"},{"city_id":1111,"name":"Nawalgarh"},{"city_id":1112,"name":"Neem-Ka-Thana"},{"city_id":1113,"name":"Nelamangala"},{"city_id":1114,"name":"Nimbahera"},{"city_id":1115,"name":"Nipani"},{"city_id":1116,"name":"Niwai"},{"city_id":1117,"name":"Nohar"},{"city_id":1118,"name":"Nokha"},{"city_id":1119,"name":"Pali"},{"city_id":1120,"name":"Phalodi"},{"city_id":1121,"name":"Phulera"},{"city_id":1122,"name":"Pilani"},{"city_id":1123,"name":"Pilibanga"},{"city_id":1124,"name":"Pindwara"},{"city_id":1125,"name":"Pipar City"},{"city_id":1126,"name":"Prantij"},{"city_id":1127,"name":"Pratapgarh"},{"city_id":1128,"name":"Raisinghnagar"},{"city_id":1129,"name":"Rajakhera"},{"city_id":1130,"name":"Rajaldesar"},{"city_id":1131,"name":"Rajgarh (Alwar)"},{"city_id":1132,"name":"Rajgarh (Churu"},{"city_id":1133,"name":"Rajsamand"},{"city_id":1134,"name":"Ramganj Mandi"},{"city_id":1135,"name":"Ramngarh"},{"city_id":1136,"name":"Ratangarh"},{"city_id":1137,"name":"Rawatbhata"},{"city_id":1138,"name":"Rawatsar"},{"city_id":1139,"name":"Reengus"},{"city_id":1140,"name":"Sadri"},{"city_id":1141,"name":"Sadulshahar"},{"city_id":1142,"name":"Sagwara"},{"city_id":1143,"name":"Sambhar"},{"city_id":1144,"name":"Sanchore"},{"city_id":1145,"name":"Sangaria"},{"city_id":1146,"name":"Sardarshahar"},{"city_id":1147,"name":"Sawai Madhopur"},{"city_id":1148,"name":"Shahpura"},{"city_id":1149,"name":"Shahpura"},{"city_id":1150,"name":"Sheoganj"},{"city_id":1151,"name":"Sikar"},{"city_id":1152,"name":"Sirohi"},{"city_id":1153,"name":"Sojat"},{"city_id":1154,"name":"Sri Madhopur"},{"city_id":1155,"name":"Sujangarh"},{"city_id":1156,"name":"Sumerpur"},{"city_id":1157,"name":"Suratgarh"},{"city_id":1158,"name":"Taranagar"},{"city_id":1159,"name":"Todabhim"},{"city_id":1160,"name":"Todaraisingh"},{"city_id":1161,"name":"Tonk"},{"city_id":1162,"name":"Udaipur"},{"city_id":1163,"name":"Udaipurwati"},{"city_id":1164,"name":"Vijainagar"}]

class CityResponse {
  CityResponse({
      List<Cities>? cities,}){
    _cities = cities;
}

  CityResponse.fromJson(dynamic json) {
    if (json['cities'] != null) {
      _cities = [];
      json['cities'].forEach((v) {
        _cities?.add(Cities.fromJson(v));
      });
    }
  }
  List<Cities>? _cities;
CityResponse copyWith({  List<Cities>? cities,
}) => CityResponse(  cities: cities ?? _cities,
);
  List<Cities>? get cities => _cities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cities != null) {
      map['cities'] = _cities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// city_id : 1079
/// name : "Bali"

class Cities {
  Cities({
      String? cityId,
      String? name,}){
    _cityId = cityId;
    _name = name;
}

  Cities.fromJson(dynamic json) {
    _cityId = json['city_id'].toString();
    _name = json['name'].toString();
  }
  String? _cityId;
  String? _name;
Cities copyWith({  String? cityId,
  String? name,
}) => Cities(  cityId: cityId ?? _cityId,
  name: name ?? _name,
);
  String? get cityId => _cityId;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city_id'] = _cityId;
    map['name'] = _name;
    return map;
  }

}