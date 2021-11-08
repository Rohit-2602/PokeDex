import 'package:flutter/material.dart';
import 'package:poke_app/models/pokemon.dart';
import 'package:velocity_x/velocity_x.dart';

class BaseStatsList extends StatelessWidget {
  final List<Stats> stats;
  const BaseStatsList({Key? key, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: stats.length,
        itemBuilder: (context, index) {
          return BaseStatsContainer(stats: stats[index]);
        }).px(16);
  }
}

class BaseStatsContainer extends StatelessWidget {
  final Stats stats;
  const BaseStatsContainer({Key? key, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        stats.name.text.white.make().py(5),
        Container(
            width: 270,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            alignment: Alignment.topLeft,
            child: Stack(
              children: [
                Container(
                    width: stats.stat * 1,
                    child: "".text.makeCentered(),
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                "${stats.stat}/270".text.makeCentered()
              ],
            )).pOnly(left: 20),
      ],
    );
  }
}