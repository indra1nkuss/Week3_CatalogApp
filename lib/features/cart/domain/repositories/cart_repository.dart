import '../entities/product.dart';

//Kontrak/aturan penyimpanan data.

abstract class CartRepository {
  List<Product> getItems();
  void addItem(Product product);
  void clearCart();
}