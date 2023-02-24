import 'package:flutter/material.dart';
import 'package:pokedex/src/home/screen/screen.dart';
import 'package:provider/provider.dart';

import '../utils/provider/provider.dart';
import '../widget/widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<PokemonProvider>().getMorePokemons();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Pokemon',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: context.read<PokemonProvider>().getPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingWidget(size: size);
          } else {
            return Consumer<PokemonProvider>(
              builder: (context, pokemon, _) => GridView.count(
                padding: const EdgeInsets.all(20),
                controller: _scrollController,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: pokemon.pokemonsDetail
                    .map(
                      (pokemon) => PokemonWidget(
                        pokemon: pokemon,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PokemonScreen(pokemon: pokemon),
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/gif/pikachu.gif",
            width: size.width / 2,
            scale: 1.0,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'loading..',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
