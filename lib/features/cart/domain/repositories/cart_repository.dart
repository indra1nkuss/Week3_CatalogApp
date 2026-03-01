import '../entities/product.dart';

abstract class CartRepository {
  List<Product> getItems();
  void addItem(Product product);
  void clearCart();
}