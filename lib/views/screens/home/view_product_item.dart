// import 'package:flutter/material.dart';
// import 'package:grocery_user_app/views/screens/home/product_details_screen.dart';
// import 'package:provider/provider.dart';
//
// import '../../../controllers/provider/users/product_provider.dart';
//
// class ProductScreen extends StatefulWidget {
//   @override
//   _ProductScreenState createState() => _ProductScreenState();
// }
//
// class _ProductScreenState extends State<ProductScreen> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<ProductProvider>(context, listen: false).fetchProducts();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Products'),
//       ),
//       body: productProvider.isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : productProvider.products.isEmpty
//           ? const Center(child: Text('No products available'))
//           : Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 0.7,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//           ),
//           itemCount: productProvider.products.length,
//           itemBuilder: (context, index) {
//             final product = productProvider.products[index];
//             return GestureDetector(
//               onTap: () {
//                 // Navigate to Product Detail Screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProductDetailScreen(productid: product),
//                   ),
//                 );
//               },
//               child: Card(
//                 elevation: 3,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: ClipRRect(
//                         borderRadius: const BorderRadius.vertical(
//                             top: Radius.circular(8.0)),
//                         child: Image.network(
//                           product.thumbnail ?? '',
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                           errorBuilder: (context, error, stackTrace) =>
//                           const Icon(Icons.image, size: 50),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             product.title ?? 'No Title',
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           const SizedBox(height: 5),
//                           Row(
//                             children: [
//                               Text(
//                                 '\$${product.price?.toStringAsFixed(2) ?? 'N/A'}',
//                                 style: const TextStyle(
//                                   decoration: TextDecoration.lineThrough,
//                                   color: Colors.red,
//                                 ),
//                               ),
//                               const SizedBox(width: 5),
//                               Text(
//                                 '\$${((product.price ?? 0) * ((100 - (product.discountPercentage ?? 0)) / 100)).toStringAsFixed(2)}',
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.green,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Provider.of<ProductProvider>(context, listen: false).fetchProducts();
//         },
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }
// }
