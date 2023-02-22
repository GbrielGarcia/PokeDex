import 'dart:convert';

PokemonsModel pokemonsModelFromJson(String str) =>
    PokemonsModel.fromJson(json.decode(str));
String pokemonsModelToJson(PokemonsModel data) => json.encode(data.toJson());

class PokemonsModel {
  int? count;
  String? next;
  List<Result>? results;

  PokemonsModel({
    this.count,
    this.next,
    this.results,
  });

  factory PokemonsModel.fromJson(Map<String, dynamic> json) => PokemonsModel(
        count: json["count"],
        next: json["next"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  String? name;
  String? url;

  Result({
    this.name,
    this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
