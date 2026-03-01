import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/product.dart';
import '../widgets/add_button_widget.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ubah string dari constants menjadi list of Product Entity
    final products = AppConstants.catalogItems
        .map((name) => Product(name: name))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Makanan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            trailing: AddButtonWidget(product: products[index]),
          );
        },
      ),
    );
  }
}