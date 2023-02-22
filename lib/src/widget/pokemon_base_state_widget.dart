import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../utils/model/model.dart';

class PokemonBaseStatsWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;
  const PokemonBaseStatsWidget({Key? key, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: pokemon.stats!
          .map((e) => Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.stat!.name!),
                    Row(
                      children: [
                        Text(e.baseStat.toString()),
                        LinearPercentIndicator(
                          width: 175,
                          lineHeight: 10,
                          percent: (e.baseStat! / 100).toDouble() > 1
                              ? 1
                              : (e.baseStat! / 100).toDouble(),
                          backgroundColor: Colors.grey.shade300,
                          progressColor: (e.baseStat! / 100).toDouble() < 0.50
                              ? Colors.red
                              : Colors.green,
                          barRadius: const Radius.circular(10),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
