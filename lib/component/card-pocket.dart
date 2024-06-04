import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPocket extends StatefulWidget {
  const CardPocket({
    super.key,
    required this.backgroundColor,
    required this.widthCostume,
    required this.heightCostume,
    required this.titlePocket,
    required this.saldoPocket,
    required this.typePocket,
    required this.imageCostume,
  });

  final Color backgroundColor;
  final double widthCostume;
  final double heightCostume;
  final String titlePocket;
  final String saldoPocket;
  final String typePocket;
  final String imageCostume;

  @override
  State<CardPocket> createState() => _CardPocketState();
}

class _CardPocketState extends State<CardPocket> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.widthCostume,
      height: widget.heightCostume,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.imageCostume ?? "assets/images/house_icon.png",
              width: 80,
              height: 80,
            ),
            Text(
              widget.titlePocket,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Rp${widget.saldoPocket}"),
            Text(widget.typePocket),
          ],
        ),
      ),
    );
  }
}
