
class UserModel {
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? v;
 UserModel({this.address, this.id, this.email, this.username, this.password, this.name, this.phone, this.v});

  UserModel.fromJson(Map<String, dynamic> json) {
    address = json["address"] == null ? null : Address.fromJson(json["address"]);
    id = json["id"];
    email = json["email"];
    username = json["username"];
    password = json["password"];
    name = json["name"] == null ? null : Name.fromJson(json["name"]);
    phone = json["phone"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(address != null) {
      _data["address"] = address?.toJson();
    }
    _data["id"] = id;
    _data["email"] = email;
    _data["username"] = username;
    _data["password"] = password;
    if(name != null) {
      _data["name"] = name?.toJson();
    }
    _data["phone"] = phone;
    _data["__v"] = v;
    return _data;
  }
}

class Name {
  String? firstname;
  String? lastname;

  Name({this.firstname, this.lastname});

  Name.fromJson(Map<String, dynamic> json) {
    firstname = json["firstname"];
    lastname = json["lastname"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["firstname"] = firstname;
    _data["lastname"] = lastname;
    return _data;
  }
}

class Address {
  Geolocation? geolocation;
  String? city;
  String? street;
  int? number;
  String? zipcode;

  Address({this.geolocation, this.city, this.street, this.number, this.zipcode});

  Address.fromJson(Map<String, dynamic> json) {
    geolocation = json["geolocation"] == null ? null : Geolocation.fromJson(json["geolocation"]);
    city = json["city"];
    street = json["street"];
    number = json["number"];
    zipcode = json["zipcode"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(geolocation != null) {
      _data["geolocation"] = geolocation?.toJson();
    }
    _data["city"] = city;
    _data["street"] = street;
    _data["number"] = number;
    _data["zipcode"] = zipcode;
    return _data;
  }
}

class Geolocation {
  String? lat;
  String? long;

  Geolocation({this.lat, this.long});

  Geolocation.fromJson(Map<String, dynamic> json) {
    lat = json["lat"];
    long = json["long"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lat"] = lat;
    _data["long"] = long;
    return _data;
  }
}
