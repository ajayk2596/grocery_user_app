import 'package:flutter/material.dart';

class HomeOrderPage extends StatefulWidget {
  @override
  _HomeOrderPageState createState() => _HomeOrderPageState();
}

class _HomeOrderPageState extends State<HomeOrderPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // For 2 tabs
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {
            // Handle back button press
          },
        ),
        centerTitle: true,
        title: Text(
          'Orders',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.brown,
          indicatorColor: Colors.orange,
          indicatorWeight: 3,
          tabs: [
            Tab(text: "Ongoing"),
            Tab(text: "History"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOngoingTab(screenWidth),
          _buildHistoryTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _buildOngoingTab(double screenWidth) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Order.png', // Replace with your image path
              height: screenWidth * 0.5,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              'There is no ongoing order right now.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'You can order from home.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryTab() {
    return Center(
      child: Text(
        'No order history.',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}
