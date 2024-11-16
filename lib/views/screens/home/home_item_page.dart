import 'package:flutter/material.dart';

class ItemsScreen extends StatefulWidget {
  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  // Sample data for the items
  final List<Item> items = [
    Item(name: 'Red Apple', price: 4.99, unit: 'kg', quantity: 2, imagePath: 'assets/images/Apple.png'),
    Item(name: 'Original Banana', price: 5.99, unit: 'kg', quantity: 2, imagePath: 'assets/images/Banana.png'),
    Item(name: 'Avocado Bowl', price: 24.00, unit: 'st', quantity: 1, imagePath: 'assets/images/Bowl.png'),
    Item(name: 'Salmon', price: 50.00, unit: 'kg', quantity: 2, imagePath: 'assets/images/meet.png'),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.orange),
        title: Text(
          "Items",
          style: TextStyle(color: Colors.orange, fontSize: screenWidth * 0.05),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildItemCard(items[index]);
        },
      ),

    );
  }

  Widget _buildItemCard(Item item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(item.imagePath, width: 50, height: 50), // Use Image.asset here
          SizedBox(width: 10),
          Expanded(
            child: Text(
              item.name,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
            ),
          ),
          _buildQuantityControl(item),
          Text("\$${item.price.toStringAsFixed(2)} ${item.unit}", style: TextStyle(color: Colors.brown)),
        ],
      ),
    );
  }

  Widget _buildQuantityControl(Item item) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove_circle_outline),
          color: Colors.brown,
          onPressed: () {
            setState(() {
              if (item.quantity > 1) item.quantity--;
            });
          },
        ),
        Text(
          item.quantity.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        IconButton(
          icon: Icon(Icons.add_circle_outline),
          color: Colors.brown,
          onPressed: () {
            setState(() {
              item.quantity++;
            });
          },
        ),
      ],
    );
  }
}

// Model class for an Item
class Item {
  String name;
  double price;
  String unit;
  int quantity;
  String imagePath;

  Item({required this.name, required this.price, required this.unit, required this.quantity, required this.imagePath});
}
