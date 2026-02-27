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

// Widget Tombol Tambah (Menggunakan Provider)
class AddButton extends StatelessWidget {
  final String item;

  const AddButton({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    // context.select memantau apakah item ini sudah ada di keranjang
    final isInCart =
        context.select<CartModel, bool>((cart) => cart.items.contains(item));

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              // context.read digunakan untuk memanggil fungsi tanpa
              // "mendengarkan" perubahan
              context.read<CartModel>().add(item);
            },
      child: isInCart
          ? const Icon(Icons.check, color: Colors.green)
          : const Text('TAMBAH'),
    );
  }
}

// Halaman Keranjang
class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    // context.watch membuat widget
    // ini re-build tiap kali CartModel berubah
    var cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Belanja')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.fastfood),
                title: Text(cart.items[index]),
              ),
            ),
          ), // Expanded
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () => cart.removeAll(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Hapus Keranjang',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ), // Padding
        ],
      ), // Column
    ); // Scaffold
  }
}