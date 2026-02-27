import 'package:flutter/material.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class CartModel extends ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items;
  void add (String itemName) {
    _items.add(itemName);
    //perhatikan codde ini memberitahu UI untuk update!
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}

//2. UI LAYER ---
class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyCatalog(),
        '/cart' (context) => const MyCart(),
      },
    );
  }
}

// Halaman Katalog
class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final products = ['Nasi Goreng', 'Sate Ayam', 'Es Teh', 'Ayam Bakar', 'Kopi'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Makanan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ), // IconButton
        ],
      ), // AppBar
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
            trailing: AddButton(item: products[index]),
          ); // ListTile
        },
      ), // ListView.builder
    ); // Scaffold
  }
}