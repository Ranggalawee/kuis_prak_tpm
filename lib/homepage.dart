import 'dart:js';

import 'package:flutter/material.dart';
import 'package:quizpraktpm/pokemon_data.dart';
import 'detail_pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: listPokemon.length,
          itemBuilder: (context, index) {
            final PokemonData pokemon = listPokemon[index];
            return InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>DetailedPage(pokemon: pokemon,),
                  ),
                );
              },
              child: Card(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 4,
                      child: Image.network(pokemon.image),
                    ),
                    Text(
                      pokemon.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
