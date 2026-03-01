import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/product.dart';
import '../providers/cart_provider.dart';

class AddButtonWidget extends StatelessWidget {
  final Product product;

  const AddButtonWidget({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final isInCart = context.select<CartProvider, bool>(
      (cart) => cart.isItemInCart(product.name),
    );

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              context.read<CartProvider>().add(product);
            },
      child: isInCart
          ? const Icon(Icons.check, color: Colors.green)
          : const Text('TAMBAH'),
    );
  }
}