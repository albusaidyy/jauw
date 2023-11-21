import 'dart:convert';

class CurrentWeather {
    final Location location;
    final Current current;

    CurrentWeather({
        required this.location,
        required this.current,
    });

    factory CurrentWeather.fromRawJson(String str) => CurrentWeather.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
    };
}

class Current {
    final int lastUpdatedEpoch;
    final String lastUpdated;
    final int tempC;
    final double tempF;
    final int isDay;
    final Condition condition;
    final double windMph;
    final double windKph;
    final int windDegree;
    final String windDir;
    final int pressureMb;
    final double pressureIn;
    final int precipMm;
    final int precipIn;
    final int humidity;
    final int cloud;
    final double feelslikeC;
    final double feelslikeF;
    final int visKm;
    final int visMiles;
    final int uv;
    final int gustMph;
    final double gustKph;

    Current({
        required this.lastUpdatedEpoch,
        required this.lastUpdated,
        required this.tempC,
        required this.tempF,
        required this.isDay,
        required this.condition,
        required this.windMph,
        required this.windKph,
        required this.windDegree,
        required this.windDir,
        required this.pressureMb,
        required this.pressureIn,
        required this.precipMm,
        required this.precipIn,
        required this.humidity,
        required this.cloud,
        required this.feelslikeC,
        required this.feelslikeF,
        required this.visKm,
        required this.visMiles,
        required this.uv,
        required this.gustMph,
        required this.gustKph,
    });

    factory Current.fromRawJson(String str) => Current.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"],
        tempF: json["temp_f"]?.toDouble(),
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"]?.toDouble(),
        windKph: json["wind_kph"]?.toDouble(),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"],
        pressureIn: json["pressure_in"]?.toDouble(),
        precipMm: json["precip_mm"],
        precipIn: json["precip_in"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"]?.toDouble(),
        feelslikeF: json["feelslike_f"]?.toDouble(),
        visKm: json["vis_km"],
        visMiles: json["vis_miles"],
        uv: json["uv"],
        gustMph: json["gust_mph"],
        gustKph: json["gust_kph"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
    };
}

class Condition {
    final String text;
    final String icon;
    final int code;

    Condition({
        required this.text,
        required this.icon,
        required this.code,
    });

    factory Condition.fromRawJson(String str) => Condition.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
    };
}

class Location {
    final String name;
    final String region;
    final String country;
    final double lat;
    final double lon;
    final String tzId;
    final int localtimeEpoch;
    final String localtime;

    Location({
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.tzId,
        required this.localtimeEpoch,
        required this.localtime,
    });

    factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
    };
}
