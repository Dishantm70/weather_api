// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
    bool error;
    String msg;
    List<Datum> data;

    Country({
        required this.error,
        required this.msg,
        required this.data,
    });

    Country copyWith({
        bool? error,
        String? msg,
        List<Datum>? data,
    }) => 
        Country(
            error: error ?? this.error,
            msg: msg ?? this.msg,
            data: data ?? this.data,
        );

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        error: json["error"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String name;
    String iso3;
    String iso2;
    List<State> states;

    Datum({
        required this.name,
        required this.iso3,
        required this.iso2,
        required this.states,
    });

    Datum copyWith({
        String? name,
        String? iso3,
        String? iso2,
        List<State>? states,
    }) => 
        Datum(
            name: name ?? this.name,
            iso3: iso3 ?? this.iso3,
            iso2: iso2 ?? this.iso2,
            states: states ?? this.states,
        );

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        iso3: json["iso3"],
        iso2: json["iso2"],
        states: List<State>.from(json["states"].map((x) => State.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "iso3": iso3,
        "iso2": iso2,
        "states": List<dynamic>.from(states.map((x) => x.toJson())),
    };
}

class State {
    String name;
    String? stateCode;

    State({
        required this.name,
        this.stateCode,
    });

    State copyWith({
        String? name,
        String? stateCode,
    }) => 
        State(
            name: name ?? this.name,
            stateCode: stateCode ?? this.stateCode,
        );

    factory State.fromJson(Map<String, dynamic> json) => State(
        name: json["name"],
        stateCode: json["state_code"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "state_code": stateCode,
    };
}
