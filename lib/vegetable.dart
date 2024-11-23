import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Vegetable extends StatefulWidget {
  const Vegetable({super.key});

  @override
  State<Vegetable> createState() => _VegetableState();
}

class _VegetableState extends State<Vegetable> {

  var fetchData= FirebaseFirestore.instance.collection('vegetable');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('vegetable'),
      ),
      body: FutureBuilder(
        future: fetchData.get(), builder: (context, snapshot) {
        if(snapshot.hasData){
          return   GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Ek row me kitne items dikhane hain
              crossAxisSpacing: 10.0, // Grid items ke beech ka horizontal gap
              mainAxisSpacing: 10.0, // Grid items ke beech ka vertical gap
              childAspectRatio: 2 / 3, // Item ka width-height ratio
            ),
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              var data = snapshot.data?.docs[index];
              return Card(
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 50,
                      backgroundImage: NetworkImage(data?["images"] ?? "No image"),
                    ),
                    Text(
                      data?["name"] ?? "No Name",
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
              );
            },
          );
        }
        else{
          return CircularProgressIndicator();
        }
      },),
    );
  }
}
