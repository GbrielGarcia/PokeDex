import 'package:flutter/material.dart';
import '../utils/constant/constant.dart';
import '../utils/model/model.dart';

class PokemonWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;
  final VoidCallback onTap;
  const PokemonWidget({Key? key, required this.pokemon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: getBackGroundColor(
            pokemon.types![0].type!.name!,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 1,
              right: 1,
              child: Image.network(
                pokemon.sprites!.other!.officialArtwork!.frontDefault!,
                fit: BoxFit.contain,
                height: 65,
                width: 65,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pokemon.name!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: pokemon.types!
                      .map(
                        (e) => Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: getBackGroundColor2(
                              pokemon.types![0].type!.name!,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            e.type!.name!,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
