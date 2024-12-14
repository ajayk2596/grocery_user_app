import 'package:flutter/material.dart';
import 'package:grocery_user_app/controllers/provider/users/user_controller.dart';
import 'package:grocery_user_app/views/screens/home/home_drawer.dart';
import 'package:grocery_user_app/views/screens/home/product_details_screen.dart';
import 'package:provider/provider.dart';
import '../../../controllers/provider/users/product_provider.dart';
import 'home_fruit_page.dart';


class HomeLungungenPage extends StatefulWidget {
  @override
  _HomeLungungenPageState createState() => _HomeLungungenPageState();
}

class _HomeLungungenPageState extends State<HomeLungungenPage> {
  TextEditingController _searchController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }
  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }
  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<ProductProvider>(context);

    final data = Provider.of<UserController>(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.location_on, color: Colors.orange),
        title: Text(
          'Lungangen',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu_sharp, color: Colors.orange),
            onPressed: _openDrawer, // Open drawer on logout icon click
          ),
        ],
      ),
      drawer: UserDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                children: [
                  // Search Bar
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.02),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Categories Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(color: Colors.orange, fontSize: screenWidth * 0.04),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Categories Row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(

                          child: CategoryItem(
                            title: 'Fruits',
                            imagePath: 'assets/images/Grapes.png',
                            color: Colors.purple,
                            screenWidth: screenWidth,
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePageApple (),));
                          },
                        ),
                        CategoryItem(
                          title: 'Vegetables',
                          imagePath: 'assets/images/Vagetables.png',
                          color: Colors.orange,
                          screenWidth: screenWidth,
                        ),
                        CategoryItem(
                          title: 'Meat',
                          imagePath: 'assets/images/only-meat.png',
                          color: Colors.redAccent,
                          screenWidth: screenWidth,
                        ),
                        CategoryItem(
                          title: 'Fish',
                          imagePath: 'assets/images/Fish.png',
                          color: Colors.redAccent,
                          screenWidth: screenWidth,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Popular Deals Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Deals',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(color: Colors.orange, fontSize: screenWidth * 0.04),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.02),
                  productProvider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : productProvider.products.isEmpty
                      ? const Center(child: Text('No products available'))
                      : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: productProvider.products.length,
                    itemBuilder: (context, index) {
                      final product = productProvider.products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(productid: product),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(8.0),
                                  ),
                                  child: Image.network(
                                    product.thumbnail ?? '',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.image, size: 50),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title ?? 'No Title',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          '\$${product.price?.toStringAsFixed(2) ?? 'N/A'}',
                                          style: const TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            color: Colors.red,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '\$${((product.price ?? 0) * ((100 - (product.discountPercentage ?? 0)) / 100)).toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),




                ],
              ),
            ),
          );
        },
      ),

    );
  }
}
Widget _createDrawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
  return ListTile(
    leading: Icon(icon, color: Colors.orange),
    title: Text(text, style: TextStyle(fontSize: 16)),
    onTap: onTap,
  );
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color color;
  final double screenWidth;

  CategoryItem({
    required this.title,
    required this.imagePath,
    required this.color,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.3,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            radius: screenWidth * 0.1,
            child: Image.asset(imagePath, height: screenWidth * 0.15, fit: BoxFit.cover),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class DealItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imagePath;
  final double screenWidth;

  DealItem({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.35,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10, offset: Offset(0, 5))],
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: screenWidth * 0.2, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
          Text(subtitle, style: TextStyle(color: Colors.grey)),
          Text(price, style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

}