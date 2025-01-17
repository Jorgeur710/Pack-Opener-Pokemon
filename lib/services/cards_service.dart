
import 'package:practica_obligatoria_t2_jorge_urenia/models/card_model.dart';
import 'package:http/http.dart';

class CardsServices {
  final String _endpoint='https://api.pokemontcg.io/v2/cards';
  final String apikey ='';//Rellenar con tu api

  Future<List<PokemonCard>> getCards() async {
    List<PokemonCard> cards = [];
    Uri uri = Uri.parse(_endpoint);
    Response response = await get(uri);
    final cardsresponse = cardResponseFromJson(response.body);
    cards = cardsresponse.data;
    Future.delayed(Duration(seconds: 2));
    return cards; 
  }

}