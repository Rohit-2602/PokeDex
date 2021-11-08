import 'package:flutter/material.dart';
import 'package:poke_app/ui/all_pokemons/pokemons_screen.dart';
import 'package:poke_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        PokeAppRoutes.pokemonScreen: (context) => const AllPokemon(),
      },
      initialRoute: PokeAppRoutes.pokemonScreen,
    );
  }
}
