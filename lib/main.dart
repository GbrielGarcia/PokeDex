import 'package:flutter/material.dart';
import 'package:pokedex/src/utils/provider/provider.dart';
import 'package:pokedex/src/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonProvider>(
          create: (_) => PokemonProvider(),
        )
      ],
      child: const MaterialApp(home: Home()),
    );
  }
}
