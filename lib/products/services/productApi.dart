import 'package:http/http.dart' as http;
import 'package:novations/constants.dart';
import 'dart:convert' as convert;

import 'package:novations/models/product.dart';

class ProductApi {
  const ProductApi();

  //Get Products
  static Future<List<Product>> getProduct() async {
    final url = Uri.https(publicUrl, 'api/get_product_all');
    //var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      //headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => Product.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
