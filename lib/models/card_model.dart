// To parse this JSON data, do
//
//     final cardResponse = cardResponseFromJson(jsonString);

import 'dart:convert';

CardResponse cardResponseFromJson(String str) => CardResponse.fromJson(json.decode(str));
class CardResponse {
    List<PokemonCard> data;
    

    CardResponse({
        required this.data,
    });

    factory CardResponse.fromJson(Map<String, dynamic> json) => CardResponse(
        data: List<PokemonCard>.from(json["data"].map((x) => PokemonCard.fromJson(x))),
    );
}

class PokemonCard {
    String id;
    String name;
    String supertype;
    String maintype;
    String images;
    String series;
    String releasedate;

    PokemonCard({
        required this.id,
        required this.name,
        required this.supertype,
        required this.maintype,
        required this.images,
        required this.series,
        required this.releasedate,
    });

    factory PokemonCard.fromJson(Map<String, dynamic> json) => PokemonCard(
        id: json["id"],
        name: json["name"],
        supertype: json["supertype"],
        maintype: json["types"][0],
        images: json["images"]["small"],
        series: json["set"]["name"],
        releasedate: json["set"]["releaseDate"]
    );
}
