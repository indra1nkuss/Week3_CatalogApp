import 'features/cart/domain/repositories/cart_repository.dart';
import 'features/cart/data/repositories/cart_repository_impl.dart';

//Mengatur pembuatan objek secara terpusat.
class Injection {
  // Singleton repository agar data cart tidak hilang saat pindah halaman
  static final CartRepository cartRepository = CartRepositoryImpl();
}