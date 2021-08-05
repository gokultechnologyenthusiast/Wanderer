/// country : "Indonesia"
/// name : "Kebonan"
/// wikipediaLink : "https://en.wikipedia.org/wiki/Kebonan"
/// googleMapsLink : "https://maps.google.com/maps?ll=-8.3122,113.4079&spn=0.1,0.1&t=h&q=-8.3122,113.4079"
/// id : 63153
/// asciiName : "Kebonan"
/// state : "08"
/// countryDigraph : "ID"

class LocationDataModel {
  String? _country;
  String? _name;
  String? _wikipediaLink;
  String? _googleMapsLink;
  int? _id;
  String? _asciiName;
  String? _state;
  String? _countryDigraph;

  String? get country => _country;
  String? get name => _name;
  String? get wikipediaLink => _wikipediaLink;
  String? get googleMapsLink => _googleMapsLink;
  int? get id => _id;
  String? get asciiName => _asciiName;
  String? get state => _state;
  String? get countryDigraph => _countryDigraph;

  LocationDataModel(
      {String? country,
      String? name,
      String? wikipediaLink,
      String? googleMapsLink,
      int? id,
      String? asciiName,
      String? state,
      String? countryDigraph}) {
    _country = country;
    _name = name;
    _wikipediaLink = wikipediaLink;
    _googleMapsLink = googleMapsLink;
    _id = id;
    _asciiName = asciiName;
    _state = state;
    _countryDigraph = countryDigraph;
  }

  LocationDataModel.fromJson(dynamic json) {
    _country = json["country"];
    _name = json["name"];
    _wikipediaLink = json["wikipediaLink"];
    _googleMapsLink = json["googleMapsLink"];
    _id = json["id"];
    _asciiName = json["asciiName"];
    _state = json["state"];
    _countryDigraph = json["countryDigraph"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["country"] = _country;
    map["name"] = _name;
    map["wikipediaLink"] = _wikipediaLink;
    map["googleMapsLink"] = _googleMapsLink;
    map["id"] = _id;
    map["asciiName"] = _asciiName;
    map["state"] = _state;
    map["countryDigraph"] = _countryDigraph;
    return map;
  }
}
