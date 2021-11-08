import 'package:flutter/material.dart';
import 'package:poke_app/models/pokemon.dart';
import 'package:poke_app/utils/constants.dart';
import 'package:velocity_x/velocity_x.dart';

class PokemonTypeList extends StatelessWidget {
  final List<Types> types;
  const PokemonTypeList({Key? key, required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 20,
          );
        },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: types.length,
        itemBuilder: (context, index) {
          return PokemonTypeContainer(type: types[index].types);
        });
  }
}

class PokemonTypeContainer extends StatelessWidget {
  final String type;
  const PokemonTypeContainer({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getBackGroundColor(type),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: type.text.xl.white.makeCentered(),
    ).wh(120, 10);
  }
}
