import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../controllers/provider/carts/cart_provider.dart';
import '../../../models/products/products_models.dart';
import '../buy/bynow_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product productId;

  const ProductDetailScreen({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(productId.title ?? 'Product Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.orange),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              productId.thumbnail ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.image, size: 100),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productId.title ?? 'No Title',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Price: \$${productId.price?.toStringAsFixed(2) ?? 'N/A'}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Discount: ${(productId.discountPercentage ?? 0).toStringAsFixed(1)}%',
                    style: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    productId.description ?? 'No Description',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {



            Provider.of<CartProvider>(context, listen: false).addToCartFirebase(productId);



                Fluttertoast.showToast(msg: "${productId.title} added to cart successfully");
              },
              child: const Text('Add to Cart'),
            ),

            ElevatedButton(

              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BuyNowScreen(product: productId,),));


              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}
