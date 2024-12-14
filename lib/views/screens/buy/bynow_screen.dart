import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../controllers/provider/users/user_provider.dart';
import '../../../models/products/products_models.dart';
import '../../../models/users/user_details_model.dart';
import '../NewAddress/new_address.dart';
import '../NewAddress/update_user_address.dart';

class BuyNowScreen extends StatefulWidget {
  final Product product;

  const BuyNowScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<BuyNowScreen> createState() => _BuyNowScreenState();
}

class _BuyNowScreenState extends State<BuyNowScreen> {
  late String userId;

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    userId = user?.uid ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);



    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Now'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Image.network(
                widget.product.thumbnail ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image, size: 100),
              ),
              const SizedBox(height: 20),

              // Product Title
              Text(
                widget.product.title ?? 'No Title',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),

              // Product Price
              Text(
                'Price: ₹${widget.product.price ?? 'N/A'}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(

                'Discount: ${widget.product.discountPercentage ?? 'No details available'}%',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),

              // User Details Section with StreamBuilder
              StreamBuilder<UserDetailsModel?>(
                stream: userProvider.getUserDetailsStream(userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Text('Error fetching user details.');
                  }

                  final userDetails = snapshot.data;

                  if (userDetails == null) {
                    // If no user details found, show "Add Address" button
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'No user details found. Please add your address.',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserDetailsForm(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Add Address'),
                        ),
                      ],
                    );

                  } else {
                    // If user details are available, show "Change Address" button
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your Details:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text('Name: ${userDetails.name ?? 'N/A'}'),
                        Text('Address: ${userDetails.address ?? 'N/A'}'),
                        Text('Nearby City: ${userDetails.nearbyCity ?? 'N/A'}'),
                        Text('State: ${userDetails.state ?? 'N/A'}'),
                        Text('Country: ${userDetails.country ?? 'N/A'}'),
                        Text('Pincode: ${userDetails.pincode ?? 'N/A'}'),
                        Text('Phone Number: ${userDetails.phoneNumber ?? 'N/A'}'),
                         SizedBox(height: 10),

                        Row(

                          children: [

                            ElevatedButton(
                              onPressed: () {

                                var data=UserDetailsModel(
                                  userId: userDetails.userId,
                                  name: userDetails.name,
                                  address: userDetails.address,
                                  nearbyCity: userDetails.nearbyCity,
                                  state: userDetails.state,
                                  country: userDetails.country,
                                  pincode: userDetails.pincode,
                                  phoneNumber: userDetails.phoneNumber,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateUserDetailsForm(userDetailsModel: data, ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              child: const Text('Change Address'),
                            ),
                            Spacer(),

                            ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Order placed for ${widget.product.title}!'),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                              ),
                              child: const Text('Place Order'),
                            ),

                          ],
                        )
                      ],
                    );
                  }
                },
              ),

              const SizedBox(height: 20),

              // Buttons Section

            ],
          ),
        ),
      ),
    );
  }
}