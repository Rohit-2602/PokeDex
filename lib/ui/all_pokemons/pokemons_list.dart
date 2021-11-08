import 'package:flutter/material.dart';
import 'package:poke_app/models/pokemon.dart';
import 'package:poke_app/ui/detail/pokemons_detail_screen.dart';
import 'package:poke_app/utils/constants.dart';
import 'package:velocity_x/velocity_x.dart';

class PokemonList extends StatelessWidget {
  final List<Pokemon> pokemonList;
  final ScrollController scrollController;
  const PokemonList(
      {Key? key, required this.scrollController, required this.pokemonList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemCount: pokemonList.length,
        controller: scrollController,
        itemBuilder: (context, index) {
          return PokemonListItem(
            pokemon: pokemonList[index],
          );
        });
  }
}

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PokemonDetail(
                  pokemon: pokemon,
                ),
              ));
        },
        child: Card(
          color: pokemonTypeMap[pokemon.types[0].types],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Hero(
                  tag: pokemon.id,
                  child: Image.network(pokemon.imageUrl).p(24)),
            ],
          ),
        ),
      ),
      footer: pokemon.name.text.xl2.makeCentered().pOnly(bottom: 10),
      header: "#${pokemon.id}".text.xl2.make().pOnly(left: 10, top: 10),
    );
  }
}
