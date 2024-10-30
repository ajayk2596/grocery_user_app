import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  final firebase= FirebaseFirestore.instance.collection('Product');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Product'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder(future: firebase.get(), builder: (context, snapshot) {
        if(snapshot.hasData){
          var userData= snapshot.data;
          return ListView.builder(
            itemCount: userData?.docs.length,
            itemBuilder: (context, index) {
             return Column(
               children: [
                 Text(userData?.docs[index]['image']),
                 Text(userData?.docs[index]['name'])
               ],
             );
          },);
        }
        else if(snapshot.hasError){
          return Center(child: Text("Error: ${snapshot.error}"));

        }
        else{
          return Text(' no data');
        }
      },),
    );
  }
}
