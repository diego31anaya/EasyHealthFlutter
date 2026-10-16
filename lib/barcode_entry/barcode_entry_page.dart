// This file will be the main page for the barcode entry.

import 'package:easyhealthflutter/barcode_entry/components/barcode_text_field.dart';
import 'package:easyhealthflutter/barcode_entry/components/display_product.dart';
import 'package:easyhealthflutter/barcode_entry/components/my_button.dart';
import 'package:easyhealthflutter/services/api.dart';
import 'package:flutter/material.dart';

class BarcodeEntryPage extends StatefulWidget {
  const new({super.key});

  @override
  State<BarcodeEntryPage> createState() => _BarcodeEntryPageState();
}

class _BarcodeEntryPageState extends State<BarcodeEntryPage> {
  final barcodeController = TextEditingController();
  Map<String, dynamic>? _product;
  String? _error;
  bool _isLoading = false;

  Future<void> searchProduct() async {
    final barcode = barcodeController.text.trim();

    if (barcode.isEmpty) {
      setState(() => _error = 'Error: Enter a barcode');
      return;
    }

    setState(() {
      _product = null;
      _error = null;
      _isLoading = true;
    });

    try {
      final product = await Api.getProduct(barcode);

      if (!mounted) return;

      setState(() {
        _product = product;
        _isLoading = false;
      });
    } catch (err) {
      if(!mounted) return;

      setState(() {
        _error = err.toString();
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    barcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Barcode Entry")),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                spacing: 20.0,
                mainAxisAlignment: MainAxisAlignment.center,
              
                children: [
                  Text("Enter barcode number to get nutrition facts"),
                  BarcodeTextField(
                    controller: barcodeController,
                    hintText: "Enter barcode: 80018122...",
                  ),
                  MyButton(
                    onPressed: _isLoading ? null : searchProduct,
                    text: "Search",
                  ),

                  if (_isLoading) const CircularProgressIndicator(),
                  if (_error != null) Text(_error!),
                  if (_product != null) DisplayProduct(product: _product!,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
