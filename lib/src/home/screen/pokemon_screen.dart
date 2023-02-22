import 'package:flutter/material.dart';
import '../../utils/constant/constant.dart';
import '../../utils/model/model.dart';
import '../../widget/widget.dart';

class PokemonScreen extends StatefulWidget {
  final PokemonDetailModel pokemon;
  const PokemonScreen({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  void init(TickerProvider tickerProvider) {
    _tabController = TabController(length: 2, vsync: tickerProvider);
  }

  @override
  void initState() {
    super.initState();
    init(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Pokemon',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 250,
                width: double.infinity,
                color: getBackGroundColor(widget.pokemon.types![0].type!.name!),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.pokemon.name!,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: widget.pokemon.types!
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                color: getBackGroundColor2(
                                  widget.pokemon.types![0].type!.name!,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(e.type!.name!),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color:
                      getBackGroundColor(widget.pokemon.types![0].type!.name!),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: TabBar(
                            labelPadding: const EdgeInsets.all(10),
                            indicatorColor: getBackGroundColor(
                                widget.pokemon.types![0].type!.name!),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            controller: _tabController,
                            tabs: const [
                              Text('Información'),
                              Text('Estadísticas'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                PokemonAboutPokemonWidget(
                                    pokemon: widget.pokemon),
                                PokemonBaseStatsWidget(pokemon: widget.pokemon),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.25,
            top: MediaQuery.of(context).size.width * 0.25,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.network(widget
                  .pokemon.sprites!.other!.officialArtwork!.frontDefault!),
            ),
          )
        ],
      ),
    );
  }
}
