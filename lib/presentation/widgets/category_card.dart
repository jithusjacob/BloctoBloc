import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneypie/features/net_worth/business_logic/bloc/category_bloc/category_bloc.dart';
import 'package:moneypie/features/net_worth/business_logic/bloc/category_bloc/category_event.dart';
import 'package:moneypie/features/net_worth/business_logic/models/item.dart';
import 'package:moneypie/features/net_worth/business_logic/models/item_total.dart';

class CategoryCard extends StatelessWidget {
  final ItemTotal category;
  final List<Item> items;
  CategoryCard({required this.category, required this.items});
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    return Container(
      height: h * 10,
      child: InkWell(
        onTap: () {
          final categorybloc = BlocProvider.of<CategoryBloc>(context);
          categorybloc.add(CategorySelected(items:items, category:category));
          Navigator.pushNamed(
            context,
            '/CategoryPage',
          );
        },
        child: Card(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  category.name,
                  style: TextStyle(
                    fontSize: w * 5,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    category.amount.toString(),
                    style: TextStyle(
                      fontSize: w * 5,
                      fontWeight: FontWeight.bold,
                      color:
                          category.name == 'Debt' ? Colors.red : Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
