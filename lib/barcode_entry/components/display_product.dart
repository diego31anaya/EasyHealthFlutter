import 'package:easyhealthflutter/barcode_entry/components/nutrition_row.dart';
import 'package:easyhealthflutter/models/product.dart';
import 'package:flutter/material.dart';

class DisplayProduct extends StatelessWidget {
  const DisplayProduct({super.key, required this.product});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.inversePrimary),
        borderRadius: .circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Row(
            spacing: 12,
            children: [
              product['image'].isNotEmpty
                  ? Image.network(
                      product['image'],
                      width: 175,
                      height: 175,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;

                        return const SizedBox(
                          width: 175,
                          height: 175,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                          width: 175,
                          height: 175,
                          child: Center(child: Text('Image unavailable')),
                        );
                      },
                    )
                  : Container(
                      width: 175,
                      height: 175,
                      color: Colors.grey,
                      alignment: Alignment.center,
                      child: Text(
                        "No Image Available",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      product['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      product['brand'],
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: nutriScoreColor(
                          product['nutrition']['nutri_score'],
                        ),
                      ),
                      child: Text(
                        product['nutrition']['nutri_score'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          NutritionRow(
            nutrition_label: "Calories",
            nutrition_value: product['nutrition']['calories'],
            icon: Icons.food_bank_outlined,
          ),

          NutritionRow(
            nutrition_label: "Protein",
            nutrition_value: product['nutrition']['protein'],
            icon: Icons.fitness_center_outlined,
          ),
        ],
      ),
    );
  }
}
