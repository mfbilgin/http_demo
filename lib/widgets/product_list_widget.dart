import 'package:flutter/material.dart';
import 'package:http_demo/widgets/product_list_row_widget.dart';

import '../models/product.dart';

class ProductListWidget extends StatefulWidget {
  final List<Product> products;
  const ProductListWidget(this.products, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return Expanded(
      child: GridView.count(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        children: List.generate(widget.products.length, (index) {
          return ProductListRowWidget(widget.products[index]);
        }),
      ),
    );
  }
}
