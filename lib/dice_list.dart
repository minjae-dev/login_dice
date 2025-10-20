import 'package:flutter/material.dart';
import 'package:logindice/detail_dice.dart';
import 'package:logindice/model.dart';

class DiceList extends StatefulWidget {
  @override
  State<DiceList> createState() => _DiceListState();
}

class _DiceListState extends State<DiceList> {
  static List<String> animalName = [
    'Bear',
    'Camel',
    'Deer',
    'Fox',
    'Kangaroo',
    'Tiger'
  ];

  static List<String> animalImagePath = [
    'image/dice1.png',
    'image/dice2.png',
    'image/dice3.png',
    'image/dice4.png',
    'image/dice5.png',
    'image/dice6.png',
  ];
  static List<String> animalLocation = [
    'forest and mountain',
    'dessert',
    'forest',
    'snow mountain',
    'Australia',
    'Africa',
  ];
  final List<DiceDetail> items = List.generate(
    animalName.length,
    (index) => DiceDetail(
      animalName[index],
      animalLocation[index],
      animalImagePath[index],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Animal List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image(
              image: AssetImage(items[index].imgPath),
              width: 50,
              height: 50,
            ),
            title: Text(items[index].name),
            subtitle: Text(items[index].location),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailDice(
                      diceDetail: DiceDetail(
                    items[index].name,
                    items[index].location,
                    items[index].imgPath,
                  )),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
