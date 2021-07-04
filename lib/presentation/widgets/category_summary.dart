import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneypie/features/net_worth/business_logic/bloc/networth_bloc/networth_bloc.dart';
import 'package:moneypie/features/net_worth/business_logic/bloc/networth_bloc/networth_state.dart';
import 'package:moneypie/features/net_worth/business_logic/models/item_total.dart';

class CategorySummary extends StatelessWidget {
  final ItemTotal category;
  CategorySummary(this.category);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () =>
                      Navigator.popUntil(context, ModalRoute.withName('/')),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.blueGrey,
                  ),
                ),
                Padding(
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
              ],
            ),
          ),
          Container(
            child: Text(
              category.amount.toString(),
              style: TextStyle(
                fontSize: w * 5,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
          BlocBuilder<NetWorthBloc, NetWorthState>(
            buildWhen: (previous, current) =>
                previous.networth.amount != current.networth.amount,
            builder: (context, state) {
              return Container(
                child: Text(
                  category.name,
                  style: TextStyle(
                    fontSize: w * 5,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
