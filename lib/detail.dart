import 'package:app_pokedex/pokemon.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final Pokemon item;

  const Detail({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.name),
          ],
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.brown[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(18),
                      height: 200,
                      width: 400,
                      child: Image.network(item.thumbnailImage),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text('#' + item.number),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 5,
                      bottom: 20,
                    ),
                    child: Text(
                      item.description,
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 5,
                    ),
                    child: Text(
                      "Type:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 5,
                      bottom: 20,
                    ),
                    child: Text(
                      item.type.join('  '),
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 5,
                    ),
                    child: Text('Weakness:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 5,
                      bottom: 20,
                    ),
                    child: Text(item.weakness.join(' ')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
