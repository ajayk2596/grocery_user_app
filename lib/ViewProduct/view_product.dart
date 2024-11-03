import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {


  // String filePath= "images/${DateTime.now().microsecondsSinceEpoch}.jpg";
   //Reference firebaseStorageRef=FirebaseStorage.instance.ref().child('filePath/');

  TextEditingController editNameController =TextEditingController();
  TextEditingController editDesController =TextEditingController();
  TextEditingController editQuantityController =TextEditingController();
  //TextEditingController timingController =TextEditingController();
  //TextEditingController dateController =TextEditingController();
  TextEditingController editPriceController =TextEditingController();
  //TextEditingController imageController =TextEditingController();


  //String fileName = basename(_image!.path);

  final firebase= FirebaseFirestore.instance.collection('Product');
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     height: screenHeight*0.07,
                      decoration: BoxDecoration(
                         color: Colors.orange,
                         borderRadius: BorderRadius.circular(12)

                     ),
                     child: ListTile(
                       leading: CircleAvatar(backgroundImage: NetworkImage(userData?.docs[index]["image"]),),
                       title: Text(userData?.docs[index]["name"]),
                       subtitle:Text(userData?.docs[index]["pricr"]),
                       isThreeLine: true,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                         children: [
                           IconButton(onPressed: () {
                             showBottomSheet(context: context, builder: (context) {
                               return SingleChildScrollView(
                                 child: Column(
                                   children: [
                                     Text("Edit Data",style: TextStyle(fontSize: 30,color: Colors.blue),),
                                     TextField(
                                       controller: editNameController,
                                       decoration: InputDecoration(
                                           labelText: "productName",
                                           border: OutlineInputBorder()
                                       ),
                                     ),
                                     SizedBox(height: 10,),
                                     TextField(
                                       controller: editDesController,
                                       decoration: InputDecoration(
                                           labelText: "productDescerption",
                                           border: OutlineInputBorder()
                                       ),
                                     ),
                                     SizedBox(height: 10,),
                                     TextField(
                                       controller: editQuantityController,
                                       decoration: InputDecoration(
                                           labelText: "productquqntity",
                                           border: OutlineInputBorder()
                                       ),
                                     ),
                                     SizedBox(height: 10,),
                                     TextField(
                                       controller: editPriceController,
                                       decoration: InputDecoration(
                                           labelText: "productPrice",
                                           border: OutlineInputBorder()
                                       ),
                                     ),
                                     SizedBox(height: 10,),

                                     ElevatedButton(onPressed: (){
                                       Navigator.pop(context);
                                       setState(() {});
                                       editData(userData?.docs[index]["id"]);
                                        editNameController.clear();
                                        editDesController.clear();
                                        editQuantityController.clear();
                                        editPriceController.clear();
                                     }, child: Text('Edit Data',style: TextStyle(color: Colors.blue,fontSize: 20),)),
                                   ],
                                 ),
                               );
                             },);

                           }, icon: Icon(Icons.edit)),

                           IconButton(onPressed: () {
                              setState(() {});
                              deleteData(userData?.docs[index]["id"]);
                           }, icon: Icon(Icons.delete)),
                         ],
                      ),
                     ),
                   ),
                 ),
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



  deleteData(String id){
    firebase.doc(id).delete();

  }

   editData(String doc){
     firebase.doc(doc).update({
       "name": editNameController.text,
       "dess": editDesController.text,
       "quantity": editQuantityController.text,
       "timing":DateTime.timestamp(),
       "date": DateTime.now(),
       //"image": downloadURL,
       "pricr": editPriceController.text,
     });

   }


}
