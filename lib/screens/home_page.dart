import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';
import 'package:http_demo/widgets/product_list_widget.dart';

import '../data/api/category_api.dart';
import '../data/api/product_api.dart';
import '../models/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = <Category>[];
  List<Product> products = <Product>[];
  List<Widget> categoryWidgets = <Widget>[];
  @override
  void initState() {
    super.initState();
    _getCategoriesFromAPI();
    _getProductsFromAPI();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        floatingActionButton: Visibility(
          child: FloatingActionButton(
              onPressed: () {
                _getProductsFromAPI();
              },
              tooltip: 'Tüm ürünleri göster',
              child: const Icon(Icons.arrow_upward)),
        ),
        body: RefreshIndicator(
          onRefresh: _getProductsFromAPI,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categoryWidgets,
                  ),
                ),
                ProductListWidget(products),
              ],
            ),
          ),
        ));
  }

  void _getCategoriesFromAPI() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  void getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
  }

  Widget getCategoryWidget(Category category) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15.0),
          ),
        )),
        onPressed: () {
          getByProductByCategoryId(category.id.toString());
        },
        child: Text(
          category.categoryName,
          style: const TextStyle(color: Colors.blueGrey),
        ),
      ),
    );
  }

  void getByProductByCategoryId(String string) {
    ProductApi.getProductsByCategoryId(string).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        products = list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }

  Future<void> _getProductsFromAPI() async {
    await ProductApi.getProducts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        products = list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }
}
