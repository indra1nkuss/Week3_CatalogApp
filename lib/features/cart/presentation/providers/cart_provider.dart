import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/cart_repository.dart';

//Penghubung antara UI dan Data.
class CartProvider extends ChangeNotifier {
  final CartRepository repository;

  CartProvider({required this.repository});

  List<Product> get items => repository.getItems();

  void add(Product product) {
    repository.addItem(product);
    notifyListeners(); // Update UI
  }

  void removeAll() {
    repository.clearCart();
    notifyListeners(); // Update UI
  }

  bool isItemInCart(String productName) {
    return items.any((item) => item.name == productName);
  }
}