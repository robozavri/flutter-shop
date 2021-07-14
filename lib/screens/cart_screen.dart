import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:shop/providers/cart.dart' show Cart;
import 'package:provider/provider.dart';
import 'package:shop/widgets/cart_item.dart' as ci;

import 'dart:convert';
import 'dart:developer' as developer;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    // print(cart.items);
    // developer.log(
    //   'log me',
    //   name: 'cart.items',
    //   error: jsonEncode(cart.items),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Spacer(),
                  Chip(
                    label: Text('\$ ${cart.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white)),
                    backgroundColor: Theme.of(context)
                        .primaryColor, // Text(cart.totalAmount),
                  ),
                  FlatButton(
                    child: Text('Order now'),
                    onPressed: () {},
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => ci.CartItem(
                cart.items.values.toList()[i].id,
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
