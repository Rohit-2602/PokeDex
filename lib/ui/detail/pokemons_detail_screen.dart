import 'package:flutter/material.dart';
import 'package:poke_app/models/pokemon.dart';
import 'package:poke_app/ui/detail/base_stats_list.dart';
import 'package:poke_app/ui/detail/pokemon_type_list.dart';
import 'package:poke_app/utils/constants.dart';
import 'package:velocity_x/velocity_x.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetail({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: getBackGroundColor(pokemon.types[0].types),
        elevation: 0,
        title: "PokeDex".text.bold.make(),
        actions: [
          "#${pokemon.id}".text.bold.xl2.makeCentered().pOnly(right: 20)
        ],
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            color: getBackGroundColor(pokemon.types[0].types),
            child:
                Hero(tag: pokemon.id, child: Image.network(pokemon.imageUrl)),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
          ).wh(context.screenWidth, 200),
          pokemon.name.text.xl4.bold.white.makeCentered().pOnly(top: 20),
          PokemonTypeList(types: pokemon.types).h(40).pOnly(top: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WieghtHeightContainer(
                  title: "Weight", value: "${pokemon.weight / 10} KG"),
              WieghtHeightContainer(
                  title: "Height", value: "${pokemon.height / 10} M")
            ],
          ).pOnly(top: 20),
          "Base Stats".text.xl2.white.makeCentered().pOnly(top: 20),
          BaseStatsList(stats: pokemon.stats).expand(),
        ],
      ),
    ));
  }
}

class WieghtHeightContainer extends StatelessWidget {
  final String title;
  final String value;
  const WieghtHeightContainer(
      {Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        value.text.white.xl2.bold.make(),
        const SizedBox(
          height: 10,
        ),
        title.text.gray500.make()
      ],
    );
  }
}
