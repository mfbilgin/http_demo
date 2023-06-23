import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductApi {
  static const String apiUrl = 'http://192.168.1.9:4213/products';

  static Future getProducts() async {
    var url = Uri.parse(apiUrl);
    var response = await http.get(url);
    return response;
  }

  static Future getProductById(String id) async {
    var url = Uri.parse('$apiUrl/$id');
    var response = await http.get(url);
    return response;
  }

  static Future getProductsByCategoryId(String categoryId) async {
    var url = Uri.parse('$apiUrl?categoryId=$categoryId');
    var response = await http.get(url);
    return response;
  }

}
