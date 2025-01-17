import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t2_jorge_urenia/models/card_model.dart';

class TeamViewWidget extends StatefulWidget {
  const TeamViewWidget({super.key, required this.team});
  final PokemonCard team;

  @override
  State<TeamViewWidget> createState() => _TeamViewWidgetState();
}

class _TeamViewWidgetState extends State<TeamViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.team.name),
      subtitle: Text(widget.team.maintype),
    );
  }
}