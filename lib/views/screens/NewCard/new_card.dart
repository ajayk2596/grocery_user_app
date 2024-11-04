import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:grocery/NoSavedCard/no_saved_card.dart';

import '../NoSavedCard/no_saved_card.dart';

class NewCard extends StatefulWidget {
  const NewCard({super.key});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
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
                'New Cards',
                style:
                    TextStyle(color: Colors.orange, fontSize: screenWidth * 0.08),
              ),
              SizedBox(
                height: screenHeight * 0.09,
              ),
              Padding(
                padding: const EdgeInsets.only(right:210),
                child: Text('Card Number',style: TextStyle(fontSize: screenWidth * 0.05,fontWeight: FontWeight.bold),),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.07,
                  color: Colors.grey[400],
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 15),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey[400],
                      ),
                       hintText: "XXXX XXXX XXXX XXXX",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(right:210),
                child: Text('Expery Date',style: TextStyle(fontSize: screenWidth * 0.05,fontWeight: FontWeight.bold),),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.07,
                  color: Colors.grey[400],
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 15),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey[400],
                      ),
                      hintText: "MM/YY",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(right:280),
                child: Text('CCV',style: TextStyle(fontSize: screenWidth * 0.05,fontWeight: FontWeight.bold),),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.07,
                  color: Colors.grey[400],
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 15),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey[400],
                      ),
                      hintText: "****",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.2,
              ),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NoSavedCard(),));
                      },
                      child: Text("Add Card",
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
