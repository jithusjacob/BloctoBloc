import 'package:bloctobloc/business_logic/models/item.dart';
import 'package:flutter/material.dart';

class CategoryItemCard extends StatelessWidget {
  final Item item;
  CategoryItemCard(this.item);
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    return Container(
      height: h * 10,
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.desc,
                style: TextStyle(
                  fontSize: w * 5,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  item.desc.toString(),
                  style: TextStyle(
                    fontSize: w * 5,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
