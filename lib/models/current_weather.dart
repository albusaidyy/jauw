import 'dart:convert';

class CurrentWeather {
    final Coord? coord;
    final List<Weather>? weather;
    final String? base;
    final Mmain? mMain;
    final int? visibility;
    final Wind? wind;
    final Rain? rain;
    final Clouds? clouds;
    final int? dt;
    final Sys? sys;
    final int? timezone;
    final int? id;
    final String? name;
    final int? cod;

    CurrentWeather({
        this.coord,
        this.weather,
        this.base,
        this.mMain,
        this.visibility,
        this.wind,
        this.rain,
        this.clouds,
        this.dt,
        this.sys,
        this.timezone,
        this.id,
        this.name,
        this.cod,
    });

    factory CurrentWeather.fromRawJson(String str) => CurrentWeather.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
        weather: json["weather"] == null ? [] : List<Weather>.from(json["weather"]!.map((x) => Weather.fromJson(x))),
        base: json["base"],
        mMain: json["main"] == null ? null : Mmain.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
    );

    Map<String, dynamic> toJson() => {
        "coord": coord?.toJson(),
        "weather": weather == null ? [] : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "base": base,
        "main": mMain?.toJson(),
        "visibility": visibility,
        "wind": wind?.toJson(),
        "rain": rain?.toJson(),
        "clouds": clouds?.toJson(),
        "dt": dt,
        "sys": sys?.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
    };
}

class Clouds {
    final int? all;

    Clouds({
        this.all,
    });

    factory Clouds.fromRawJson(String str) => Clouds.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
    };
}

class Coord {
    final double? lon;
    final double? lat;

    Coord({
        this.lon,
        this.lat,
    });

    factory Coord.fromRawJson(String str) => Coord.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
    };
}

class Mmain {
    final double? temp;
    final double? feelsLike;
    final double? tempMin;
    final double? tempMax;
    final int? pressure;
    final int? humidity;

    Mmain({
        this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.humidity,
    });

    factory Mmain.fromRawJson(String str) => Mmain.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Mmain.fromJson(Map<String, dynamic> json) => Mmain(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
    };
}

class Rain {
    final double? the1H;

    Rain({
        this.the1H,
    });

    factory Rain.fromRawJson(String str) => Rain.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "1h": the1H,
    };
}

class Sys {
    final int? type;
    final int? id;
    final String? country;
    final int? sunrise;
    final int? sunset;

    Sys({
        this.type,
        this.id,
        this.country,
        this.sunrise,
        this.sunset,
    });

    factory Sys.fromRawJson(String str) => Sys.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"],
        id: json["id"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
    };
}

class Weather {
    final int? id;
    final String? wMain;
    final String? description;
    final String? icon;

    Weather({
        this.id,
        this.wMain,
        this.description,
        this.icon,
    });

    factory Weather.fromRawJson(String str) => Weather.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        wMain: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": wMain,
        "description": description,
        "icon": icon,
    };
}

class Wind {
    final double? speed;
    final int? deg;

    Wind({
        this.speed,
        this.deg,
    });

    factory Wind.fromRawJson(String str) => Wind.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
    };
}
