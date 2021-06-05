import 'package:app_pokedex/pokemon.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

class PokemonWidget extends StatelessWidget {
  final Pokemon item;

  const PokemonWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        contentPadding: EdgeInsets.all(5),
        title: Text(item.name),
        leading: Image.network(item.thumbnailImage),
        trailing: Text(
          '#' + item.number,
          style: TextStyle(color: Colors.grey),
        ),
        onTap: () {
          redirectToNewPage(context);
        },
      ),
    );
  }

  void redirectToNewPage(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Detail(item: item),
      ),
    );
  }
}
