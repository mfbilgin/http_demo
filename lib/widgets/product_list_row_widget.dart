import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  final Product product;
  const ProductListRowWidget(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: 200.0,
        child: Card(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                height: 140.0,
                child: Image.network(
                    'https://cdn.pixabay.com/photo/2017/02/27/21/47/yogurt-2104327_640.jpg'),
              ),
              Text(product.productName,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 9.0,
                      color: Colors.black
                  )),
              Text('${product.unitPrice} TL',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13.0, color: Colors.black45)),
            ],
          ),
        ),
      ),
    );
  }
}
