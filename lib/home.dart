import 'dart:convert';
import 'package:app_pokedex/detail.dart';
import 'package:app_pokedex/pokemon.dart';
import 'package:app_pokedex/pokemon_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pokemon.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pokemon> listaPokemon = [];

  @override
  void initState() {
    carregarPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Pokedex'),
            SizedBox(
              child: Image.asset(
                'assets/pokebola_img.png',
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: listaPokemon.length,
          itemBuilder: (context, index) {
            return PokemonWidget(
              item: listaPokemon[index],
            );
          }),
    );
  }

  void carregarPokemon() {
    var url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        Map json = JsonDecoder().convert(response.body);
        setState(() {
          listaPokemon = json['data'].map<Pokemon>((item) {
            return Pokemon.fromJson(item);
          }).toList();
        });
      }
    });
  }
}
