 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:grocery/EditAddress/edit_Address.dart';

import '../EditAddress/edit_Address.dart';

class Address extends StatefulWidget {
   const Address({super.key});

   @override
   State<Address> createState() => _AddressState();
 }

 class _AddressState extends State<Address> {
   @override
   Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     double screenHeight = MediaQuery.of(context).size.height;
     return Scaffold(
       appBar: AppBar(
         actions: [
        IconButton(onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => EditAddress(),));
       }, icon: Icon(Icons.add,color: Colors.orange,))
         ],
         leading: IconButton(
           icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.orange),
           onPressed: () {
             Navigator.pop(context);
           },
         ),
       ),
        body: Column(
          children: [
            Text(
              'Addresses',
              style:
              TextStyle(color: Colors.orange, fontSize: screenWidth * 0.07,fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            ListTile(
              leading: Image.asset('assets/images/home.png',height: screenHeight*0.03,),
              title: Text('Home',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange),),
              subtitle: Text('Lungangen 6,41722'),
              trailing: Icon(CupertinoIcons.right_chevron,color: Colors.orange,),
             ),
            Divider(),
            ListTile(
              leading: Image.asset('assets/images/office.png',height: screenHeight*0.03,),
              title: Text('Home',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange),),
              subtitle: Text('Lungangen 6,41722'),
              trailing: Icon(CupertinoIcons.right_chevron,color: Colors.orange,),
            ),
            Divider(),

          ],
        ),

     );
   }
 }
