import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:grocery/Address/address.dart';

import '../Address/address.dart';

class NewAddress extends StatefulWidget {
  const NewAddress({super.key});

  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.orange,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                'New Address',
                style:
                TextStyle(color: Colors.orange, fontSize: screenWidth * 0.08),
              ),
              SizedBox(
                height: screenHeight * 0.09,
              ),

               ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.07,
                  color: Colors.grey[400],
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 15,left: 15),
                       hintText: "Address Tile",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
               ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.07,
                  color: Colors.grey[400],
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 15,left: 15),
                      hintText: "Name Surname",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
               ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.07,
                  color: Colors.grey[400],
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.upgrade_rounded),
                      contentPadding: const EdgeInsets.only(top: 15,left: 15),
                       hintText: "City",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03,),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.07,
                  color: Colors.grey[400],
                  child: TextField(
                    decoration: InputDecoration(
                       contentPadding: const EdgeInsets.only(top: 15,left: 15),
                      hintText: "Address",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.2,),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.07,
                  color: Colors.orange,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Address(),));
                      },
                      child: Text("Add",
                          style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              color: Colors.white))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
