import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProductPage extends StatefulWidget {
  @override
  _HomeProductPageState createState() => _HomeProductPageState();
}

class _HomeProductPageState extends State<HomeProductPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Mango Shop'),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/Mango.png",
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Original Mango",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "\$3.00 /st",
              style: TextStyle(fontSize: 20, color: Colors.orange),
            ),
            SizedBox(height: 8),
            Text(
              "Golden Ripe Alphonso mangoes delivered to your house in the most hygienic way ever... Best for eating plain but can also be made into shakes and cakes.",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                    ),
                    Text(
                      '$quantity',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.orange,
                ),
                onPressed: () {},
                child: Text("Add To Cart", style: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 10),
            Text(
              "You may also need",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    elevation: 2,
                    child:  buildRecommendedItem("Strawberry", "1 kg", "\$24.00", 'assets/images/Chilli.png'),),
                  Card(elevation: 2,
                    child:  buildRecommendedItem("Avocado Bowl", "1 kg", "\$24.00", 'assets/images/Bowl.png'),)
                  // Add more items as needed
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }

  Widget buildRecommendedItem(String name, String weight, String price, String imagePath) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 100,
      child: Column(
        children: [
          Image.asset(
            imagePath, // Add your asset path here
            height: 60,
          ),
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(weight, style: TextStyle(color: Colors.grey)),
          Text(price, style: TextStyle(color: Colors.orange)),
          IconButton(
            icon: Icon(Icons.add_circle, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}