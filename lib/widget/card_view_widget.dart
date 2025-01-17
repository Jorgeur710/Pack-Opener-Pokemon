import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t2_jorge_urenia/models/card_model.dart';
import 'package:practica_obligatoria_t2_jorge_urenia/services/cards_service.dart';

class CardViewWidget extends StatefulWidget {
  const CardViewWidget({super.key, required this.card});
  final PokemonCard card;

  @override
  State<CardViewWidget> createState() => _CardViewWidgetState();
}

class _CardViewWidgetState extends State<CardViewWidget> {
  CardsServices cs = CardsServices();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
           Text(widget.card.name ,style: const TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
           const SizedBox(height: 20,),
           Text('Type: ${widget.card.maintype}',style: const TextStyle(fontSize: 18)),
           const SizedBox(height: 20,),
           Text('Card type: ${widget.card.supertype}',style: const TextStyle(fontSize: 18)),
           const SizedBox(height: 20,),
           Text('Colection: ${widget.card.series}',style: const TextStyle(fontSize: 18)),
           const SizedBox(height: 20,),
           Text('Release date: ${widget.card.releasedate}',style: const TextStyle(fontSize: 18)),
           const SizedBox(height: 20,),
           Image.network(widget.card.images)
        ],
      ),
    );
  }
}