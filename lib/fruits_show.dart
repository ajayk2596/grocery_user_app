import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_user_app/views/screens/home/home_orginal_mango.dart';

class FruitsShow extends StatefulWidget {
  const FruitsShow({super.key});

  @override
  State<FruitsShow> createState() => _FruitsShowState();
}

class _FruitsShowState extends State<FruitsShow> {
  var fetchData= FirebaseFirestore.instance.collection('fruits');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text('Fruits Show'),
      ),
       body: FutureBuilder(
         future: fetchData.get(), builder: (context, snapshot) {
         if(snapshot.hasData){
           return GridView.builder(
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2, // Ek row me kitne items dikhane hain
                 crossAxisSpacing: 10.0, // Grid items ke beech ka horizontal gap
                 mainAxisSpacing: 10.0, // Grid items ke beech ka vertical gap
                 childAspectRatio: 2 / 3, // Item ka width-height ratio
               ),
               itemCount: snapshot.data?.docs.length,
               itemBuilder: (context, index) {
                 var data = snapshot.data?.docs[index];
                 return GestureDetector(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeProductPage(
                       imageUrl:data?["images"],
                       name:data?["name"],
                       price: data?["price"],
                       description: data?["description"],
                     ),));
                   },
                   child: Card(
                     elevation: 4,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         CircleAvatar(
                           maxRadius: 50,
                           backgroundImage: NetworkImage(data?["images"] ?? "No image"),
                         ),
                         Text(data?["name"] ?? "No Name",
                           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                           textAlign: TextAlign.center,
                         ),
                         Text('₹${data?["price"].toString()}',
                           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                           textAlign: TextAlign.center,
                         ),

                         const SizedBox(height: 10),
                         Text(
                           data?["description"] ?? "No Description",
                           textAlign: TextAlign.center,
                         ),
                       ],
                     ),
                   ),
                 );
               },
             );

         }
         else{
           return const CircularProgressIndicator();
         }
},
       ),
    );
  }
}
