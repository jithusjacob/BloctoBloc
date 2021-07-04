import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    print("build widget");
    return Container(
      child: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, '/AddPage'),
                  child: Icon(
                    Icons.add,
                    size: h * 5,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              "List",
              style: TextStyle(
                fontSize: w * 5,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
