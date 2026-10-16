import 'package:flutter/material.dart';

class NutritionRow extends StatelessWidget {
  const NutritionRow({
    super.key,
    required this.nutrition_label,
    required this.nutrition_value,
    required this.icon,
  });

  final String nutrition_label;
  final num nutrition_value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 32),
            Text(
              nutrition_label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        Text(
          nutrition_value.toString(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
