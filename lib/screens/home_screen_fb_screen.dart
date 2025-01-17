import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t2_jorge_urenia/models/card_model.dart';
import 'package:practica_obligatoria_t2_jorge_urenia/services/cards_service.dart';
import 'package:practica_obligatoria_t2_jorge_urenia/widget/team_view_widget.dart';
import '../widget/card_view_widget.dart';

class HomeScreenFbScreen extends StatefulWidget {
  HomeScreenFbScreen({super.key});

  @override
  State<HomeScreenFbScreen> createState() => _HomeScreenFbScreenState();
}

class _HomeScreenFbScreenState extends State<HomeScreenFbScreen> {
  CardsServices cs = CardsServices();
  int counter = 0;
  bool showContent = false;
  bool showTeam = false;
  int pokemon = Random().nextInt(250);
  List<PokemonCard> team = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Padding(
          padding:  EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              'Pokemon Pack Simulator',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold, 
              ),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              if(showTeam) {
                showTeam = false;
              }else{
                showTeam = true;
              } 
            });
          }, icon: ((showTeam)
          ?
          const Icon(Icons.radio_button_off,color: Colors.white,size: 35)
          :const Icon(Icons.radio_button_checked_rounded,color: Colors.white,size: 35,)
          ),
          tooltip: 'Collection',)
        ],
        backgroundColor: const Color.fromRGBO(255, 193, 7, 1.0),
      ),
      body: showContent
          ? 
          showTeam ?
          SingleChildScrollView(
            child: Column(
              children: team.map((card){
                return TeamViewWidget(team: card);
              }).toList(),
            ),
          )
          :
          FutureBuilder(
              future: cs.getCards(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<PokemonCard>> snapshot) {
                return snapshot.hasData
                    ? SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CardViewWidget(card: snapshot.data![pokemon]),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (counter < snapshot.data!.length - 1) {
                                        team.add(snapshot.data![pokemon]);
                                        counter++;
                                        pokemon = Random().nextInt(250);
                                      }
                                      if (counter == 5) {
                                        showContent = false;
                                        counter = 0;
                                      }
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.navigate_next_rounded,
                                    color: Color.fromRGBO(255, 193, 7, 1.0), // Rojo brillante
                                  ),
                                  iconSize: 60.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(255, 193, 7, 1.0), // Rojo brillante
                        ),
                      );
              })
          : showTeam 
          ?
          SingleChildScrollView(
            child: Column(
              children: team.map((card){
                return TeamViewWidget(team: card);
              }).toList(),
            ),
          ): 
          Center(
              child: SizedBox(
                width: 150.0,
                height: 100.0,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      showContent = true;
                    });
                  },
                  backgroundColor: const Color.fromRGBO(0, 150, 136, 1.0), // Verde Pokémon
                  child: const Text(
                    '¡Open your pack!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  tooltip: 'Click to open your pack',
                ),
              ),
            ),
    );
  }
}
