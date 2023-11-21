import 'dart:convert';

class SearchLocation {
  final List<SLocation> locations;

  SearchLocation({
    required this.locations,
  });

  factory SearchLocation.fromRawJson(String str) =>
      SearchLocation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchLocation.fromJson(List<dynamic> json) => SearchLocation(
        locations: List<SLocation>.from(json.map((x) => SLocation.fromJson(x))),
      );

  List<dynamic> toJson() =>
      List<dynamic>.from(locations.map((x) => x.toJson()));
}

class SLocation {
  final int id;
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String url;

  SLocation({
    required this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.url,
  });

  factory SLocation.fromRawJson(String str) =>
      SLocation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SLocation.fromJson(
    Map<String, dynamic> json,
  ) =>
      SLocation(
        id: json["id"],
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "url": url,
      };
}
