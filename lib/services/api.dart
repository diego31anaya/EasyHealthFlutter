import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:easyhealthflutter/models/product.dart';

class Api {
  static const baseUrl = "http://localhost:8000";

  static Future<Map<String, dynamic>> getProduct(barcode) async {
    try {
      final uri = Uri.parse(
        '$baseUrl/products/${Uri.encodeComponent(barcode)}',
      );
      final response = await http.get(uri).timeout(const Duration(seconds: 10));

      if (response.statusCode == 404) {
        throw Exception("Product not found");
      }
      else if (response.statusCode != 200) {
        throw Exception("Lookup failed: ${response.statusCode}");
      }
      // Brings back the raw response from the api
      final body = jsonDecode(response.body) as Map<String, dynamic>;

      // Brings back the product in its expected format
      final product = productModel(body['data']);

      return product;
      
    } catch (error) {
      debugPrint(error.toString());
      throw error;
    }
  }
}
