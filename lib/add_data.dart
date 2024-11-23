import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_user_app/Model/product_model.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  var firebase= FirebaseFirestore.instance;
  final TextEditingController _name=TextEditingController();
  var id=DateTime.now().microsecondsSinceEpoch.toString();

  Future<void> addData(ProductModel product)async {
  await  firebase.collection('fish').doc(id).set(product.toMap());
    
  }

  Future<void> submitData() async {
    // Har bar naye id generate karo
    id = DateTime.now().microsecondsSinceEpoch.toString();

    var newModel = ProductModel(
      id: id,
      name: _name.text,
      description: 'mango is very tasty',
      stock: 2,
      price: 2,
      brand: 'Apple',
      images:
        "https://t4.ftcdn.net/jpg/05/37/04/61/360_F_537046123_s8JVn2NrClPQDOryhSm8jonYZPfIzPRX.jpg",
      discount: 2,
      createdDate: DateTime.now(),
      updatedDate: DateTime.now(),
    );
    await addData(newModel);
  }


  // Future<void> submitData()async {
  //    var newModel=  ProductModel(id: id,name: _name.text, description: 'mango is very tasty', stock: 2, price: 2, brand: 'Apple', images: ["https://cdn.vectorstock.com/i/500p/57/90/fruit-vector-47885790.jpg"], discount: 2, createdDate: DateTime.now(), updatedDate: DateTime.now());
  //  await addData(newModel);
  //  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            TextField(
              controller: _name,
              decoration: const InputDecoration(
                hintText: 'name',
                labelText: 'name',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: () async {
             await submitData().then((value) {
               Fluttertoast.showToast(msg: 'Data Added');
               //Navigator.push(context, MaterialPageRoute(builder:  (context) => FruitsShow(),));
             },);
             setState(() {});
            }, child: const Text('submit'))
          ],
        ),
      ),
    );
  }
}
