import 'package:flutter/material.dart';

import '../utils/constant/constant.dart';
import '../utils/model/model.dart';

class PokemonAboutPokemonWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;
  const PokemonAboutPokemonWidget({Key? key, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Height'),
            SizedBox(height: 20),
            Text('Weight'),
            SizedBox(height: 20),
            Text('Ability'),
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${pokemon.height! / 10} cm',
              ),
              const SizedBox(height: 20),
              Text(
                '${pokemon.weight! / 10} kg',
              ),
              const SizedBox(height: 20),
              Wrap(
                children: pokemon.abilities!
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.only(
                          right: 10,
                          bottom: 10,
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color: getBackGroundColor(
                            pokemon.types![0].type!.name!,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          e.ability!.name!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
