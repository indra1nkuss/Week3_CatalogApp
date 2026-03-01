import '../../domain/entities/product.dart';
import '../../domain/repositories/cart_repository.dart';

//Eksekusi nyata dari kontak Domain Layer. Di sinilah list keranjang sebenarnya disimpan.


class CartRepositoryImpl implements CartRepository {
  // Simpan data di memori
  final List<Product> _items = [];

  @override
  List<Product> getItems() => _items;

  @override
  void addItem(Product product) {
    _items.add(product);
  }

  @override
  void clearCart() {
    _items.clear();
  }
}