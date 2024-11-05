import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:grocery/MyCards/my_carts.dart';

import '../MyCards/my_carts.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.orange,),
        ),
         body: SingleChildScrollView(
           child: Center(
             child: Column(
             children: [
               Text('Change Password',style: TextStyle(color: Colors.orange,fontSize: screenWidth*0.08),),
                  SizedBox(height: screenHeight*0.07,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                     child: Container(
                       width: screenWidth*0.9,
                       height: screenHeight*0.07,
                         color: Colors.grey[400],
                       child: const TextField(
                            decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15),
                            prefixIcon: Icon(Icons.lock,color: Colors.orange,),
                            suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.orange,),
                            hintText: "Old Password",
                            border: InputBorder.none,
                         ),
                       ),
                     ),
           
                  ),
           
               SizedBox(height: screenHeight*0.07,),
           
                 ClipRRect(
                 borderRadius: BorderRadius.circular(5),
                 child: Container(
                   width: screenWidth*0.9,
                   height: screenHeight*0.07,
                   color: Colors.grey[400],
                   child: const TextField(
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.only(top: 15),
                       prefixIcon: Icon(Icons.lock,color: Colors.orange,),
                       suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.orange,),
                       hintText: "New Password",
                       border: InputBorder.none,
                     ),
                   ),
                 ),
           
               ),
           
                SizedBox(height: screenHeight*0.01,),
           
               ClipRRect(
                 borderRadius: BorderRadius.circular(5),
                 child: Container(
                   width: screenWidth*0.9,
                   height: screenHeight*0.07,
                   color: Colors.grey[400],
                   child: const TextField(
                     //obscureText:true ,
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.only(top: 15),
                       prefixIcon: Icon(Icons.lock,color: Colors.orange,),
                       suffixIcon: Icon(Icons.visibility,color: Colors.orange,),
                       hintText: "Confirm Password",
                       border: InputBorder.none,
                     ),
                   ),
                 ),
                 
           
               ),
           
               SizedBox(height: screenHeight*0.2,),
           
               ClipRRect(
                 borderRadius: BorderRadius.circular(25),
                 child: Container(
                   width: screenWidth*0.9,
                   height: screenHeight*0.07,
                   color: Colors.orange,
                   child:
                   ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.orange
                        ),
                       onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => MyCardsPage(),));
                   }, child: Text("Confirm",style: TextStyle( fontSize: screenWidth*0.05,color: Colors.white))),
                 ),
           
               ),
           
               SizedBox(height: screenHeight*0.01,),
           
               ClipRRect(
                 borderRadius: BorderRadius.circular(25),
                 child: Container(
                   width: screenWidth*0.9,
                   height: screenHeight*0.07,
                   child:  ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         //shape: CircleBorder(),
                          side: BorderSide(
                           color: Colors.orange, // Border color
                            width:screenWidth*0.005,
                          ),
                       ), onPressed: () {
                     
                   }, child: Text('Back To Sign In',style: TextStyle( fontSize: screenWidth*0.05,color: Colors.orange))),),
                 ),
               ],
             ),
           ),
         ),
      );

  }
}


