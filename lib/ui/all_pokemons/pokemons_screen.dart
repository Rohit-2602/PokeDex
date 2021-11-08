import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke_app/models/pokemon.dart';
import 'package:poke_app/models/pokemon_result.dart';
import 'package:poke_app/ui/all_pokemons/pokemons_list.dart';
import 'package:poke_app/ui/all_pokemons/bottom_progress_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class AllPokemon extends StatefulWidget {
  const AllPokemon({Key? key}) : super(key: key);

  @override
  State<AllPokemon> createState() => _AllPokemonState();
}

class _AllPokemonState extends State<AllPokemon> {
  List<Pokemon> pokemons = [];
  String url = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=20";
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadPokemons();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!isLoading) {
          setState(() {
            loadPokemons();
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void loadPokemons() async {
    setState(() {
      isLoading = true;
    });
    var response = await http.get(Uri.parse(url));
    var decodedJson = jsonDecode(response.body);

    var results = decodedJson["results"];
    url = decodedJson["next"];

    var pokemons = List.from(results)
        .map((pokemonResult) => PokemonResult.fromMap(pokemonResult))
        .toList();

    for (var result in pokemons) {
      getPokemonData(result.url);
    }

    setState(() {
      isLoading = false;
    });
  }

  void getPokemonData(String url) async {
    var response = await http.get(Uri.parse(url));
    var decodedJson = jsonDecode(response.body);

    var pokemon = Pokemon.fromMap(decodedJson);
    setState(() {
      pokemons.add(pokemon);
      pokemons.sort((a, b) => a.id.compareTo(b.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: "Poke App".text.black.make(),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: pokemons.isEmpty
                    ? const CircularProgressIndicator().centered()
                    : PokemonList(
                        scrollController: _scrollController,
                        pokemonList: pokemons,
                      ).p12(),
              ),
              BottomProgressBar(isLoading: isLoading),
            ],
          ),
        ),
      ),
    );
  }
}
