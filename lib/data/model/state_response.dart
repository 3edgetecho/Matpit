/// states : [{"state_id":1,"name":"Andaman & Nicobar Islands"},{"state_id":2,"name":"Andhra Pradesh"},{"state_id":3,"name":"Arunachal Pradesh"},{"state_id":4,"name":"Assam"},{"state_id":5,"name":"Bihar"},{"state_id":6,"name":"Chandigarh"},{"state_id":7,"name":"Chhattisgarh"},{"state_id":8,"name":"Dadra & Nagar Haveli"},{"state_id":9,"name":"Daman & Diu"},{"state_id":10,"name":"Delhi"},{"state_id":11,"name":"Goa"},{"state_id":12,"name":"Gujarat"},{"state_id":13,"name":"Haryana"},{"state_id":14,"name":"Himachal Pradesh"},{"state_id":15,"name":"Jammu & Kashmir"},{"state_id":16,"name":"Jharkhand"},{"state_id":17,"name":"Karnataka"},{"state_id":18,"name":"Kerala"},{"state_id":19,"name":"Lakshadweep"},{"state_id":20,"name":"Madhya Pradesh"},{"state_id":21,"name":"Maharashtra"},{"state_id":22,"name":"Manipur"},{"state_id":23,"name":"Meghalaya"},{"state_id":24,"name":"Mizoram"},{"state_id":25,"name":"Nagaland"},{"state_id":26,"name":"Odisha"},{"state_id":27,"name":"Puducherry"},{"state_id":28,"name":"Punjab"},{"state_id":29,"name":"Rajasthan"},{"state_id":30,"name":"Sikkim"},{"state_id":31,"name":"Tamil Nadu"},{"state_id":32,"name":"Telangana"},{"state_id":33,"name":"Tripura"},{"state_id":34,"name":"Uttar Pradesh"},{"state_id":35,"name":"Uttarakhand"},{"state_id":36,"name":"West Bengal"}]

class StateResponse {
  StateResponse({
      List<States>? states,}){
    _states = states;
}

  StateResponse.fromJson(dynamic json) {
    if (json['states'] != null) {
      _states = [];
      json['states'].forEach((v) {
        _states?.add(States.fromJson(v));
      });
    }
  }
  List<States>? _states;
StateResponse copyWith({  List<States>? states,
}) => StateResponse(  states: states ?? _states,
);
  List<States>? get states => _states;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_states != null) {
      map['states'] = _states?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// state_id : 1
/// name : "Andaman & Nicobar Islands"

class States {
  States({
      String? stateId,
      String? name,}){
    _stateId = stateId;
    _name = name;
}

  States.fromJson(dynamic json) {
    _stateId = json['state_id'].toString();
    _name = json['name'].toString();
  }
  String? _stateId;
  String? _name;
States copyWith({  String? stateId,
  String? name,
}) => States(  stateId: stateId ?? _stateId,
  name: name ?? _name,
);
  String? get stateId => _stateId;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['state_id'] = _stateId;
    map['name'] = _name;
    return map;
  }

}