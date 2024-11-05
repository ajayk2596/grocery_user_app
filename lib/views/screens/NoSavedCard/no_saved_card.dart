 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:grocery/orders/ordred.dart';

import '../orders/ordred.dart';

class NoSavedCard extends StatefulWidget {
   const NoSavedCard({super.key});

   @override
   State<NoSavedCard> createState() => _NoSavedCardState();
 }

 class _NoSavedCardState extends State<NoSavedCard> {
   @override
   Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     double screenHeight = MediaQuery.of(context).size.height;
     return Scaffold(
       appBar: AppBar(
         leading: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.orange,),
         actions: [
           Padding(
             padding: const EdgeInsets.only(right: 18.0),
             child: IconButton(onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) =>  Ordered() ,));
             }, icon: Icon(Icons.add,color: Colors.orange,size: screenHeight*0.05,),),
           ),
         ],
       ),
       body: Center(
         child: Column(
           children: [
             Text('My Cards', style: TextStyle(
               color: Colors.orange,
               fontSize: screenWidth * 0.07,
               fontWeight: FontWeight.bold,
               ),
             ),
             SizedBox( height: screenHeight*0.01,),
             Image.asset('assets/images/nosavedcard.png'),
            Text('No Saved Card', style: TextStyle(
            fontSize: screenWidth * 0.06,
           fontWeight: FontWeight.bold,
         )),
             SizedBox(height: screenHeight*0.01,),
             Text('You can Saved your Card info to \n make purchase eaiser faster', style: TextStyle(
               fontSize: screenWidth * 0.04,
              )),

           ],
         ),
       ),
     );
   }
 }
