import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({super.key});

  @override
  State<EditAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<EditAddress> {
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
              Text('Edit Address', style: TextStyle(color: Colors.orange, fontSize: screenWidth * 0.08),
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
                      suffixIcon: Icon(CupertinoIcons.arrowtriangle_down_fill),
                      contentPadding: const EdgeInsets.only(top: 15,left: 15),
                      hintText: "Home",
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
                      hintText: "Mati egh",
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
                      hintText: "Goteborg",
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
                      hintText: "Lungangen",
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
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => NoSavedCard(),));
                      },
                      child: Text("UpdateAddress",
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
