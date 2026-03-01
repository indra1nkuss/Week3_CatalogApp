import '../../domain/entities/product.dart';


//Model untuk mengubah tipe data (misal dari String/JSON ke Object).
class ProductModel extends Product {
  ProductModel({required super.name});

  // Jika nanti ambil dari API (JSON), gunakan fungsi ini:
  // factory ProductModel.fromJson(Map<String, dynamic> json) { ... }
}