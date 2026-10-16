import 'package:flutter/material.dart';

Map<String, dynamic> productModel(Map<String, dynamic> body) {
  final product_name = body['product_name'];
  final product_brand = body['brands'];
  final product_image = body['image_front_url'];
  final product_calories =
      body['nutrition']['input_sets'][0]['nutrients']['energy-kcal']['value'];
  final product_protein =
      body['nutrition']['input_sets'][0]['nutrients']['proteins']['value'];
  final product_nutri_score = body['nutriscore_grade'].toUpperCase();

  return {
    'name': product_name,
    'brand': product_brand,
    'nutrition': {
      'nutri_score': product_nutri_score,
      'calories': product_calories,
      'protein': product_protein,
    },
    'image': product_image,
  };
}

Color nutriScoreColor(String nutri_score) {
  switch (nutri_score) {
    case 'A':
      return Colors.green;
    case 'B':
      return Colors.lightGreen;
    case 'C':
      return Colors.yellow;
    case 'D':
      return Colors.orange;
    case 'E':
      return Colors.red;
    default:
      return Colors.grey;
  }
}
