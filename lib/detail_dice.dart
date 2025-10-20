import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:logindice/model.dart';

class DetailDice extends StatefulWidget {
  const DetailDice({Key? key, required this.diceDetail}) : super(key: key);
  final DiceDetail diceDetail;

  @override
  State<DetailDice> createState() => _DetailDiceState();
}

class _DetailDiceState extends State<DetailDice> {
  bool isLiked = false;
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.diceDetail.name),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(widget.diceDetail.imgPath),
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Animal Name: ${widget.diceDetail.name}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              LikeButton(
                size: 30,
                isLiked: isLiked,
                likeCount: likeCount,
              ),
            ],
          ),
        ));
  }
}
