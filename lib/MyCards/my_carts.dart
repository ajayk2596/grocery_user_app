import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:grocery/NewCard/new_card.dart';

import '../NewCard/new_card.dart';

class MyCardsPage extends StatefulWidget {
  @override
  _MyCardsPageState createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage> {
  List<String> cardItems = [
    '5342**** ****6745',
    '1234**** ****5678',
    '9876**** ****4321',
  ];

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
                 Navigator.push(context, MaterialPageRoute(builder: (context) => NewCard(),));
              }, icon: Icon(Icons.add,color: Colors.orange,size: screenHeight*0.05,),),
            ),
         ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'My Cards',
              style: TextStyle(
                color: Colors.orange,
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox( height: screenHeight*0.1,),
            Expanded(
              child: ListView.separated(itemBuilder: (context, index) {
                return Divider(color: Colors.grey[400],);
              }, separatorBuilder: (context, index) {
                return  Dismissible(
                  key: Key(cardItems[index]), // Unique key for each item
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      cardItems.removeAt(index); // Remove the item from the list
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Card dismissed')),
                    );
                  },
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/MyCard.png',
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.06,
                    ),
                    title: Text(
                      'My Cards',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(cardItems[index]),
                    trailing: Icon(CupertinoIcons.right_chevron),
                  ),
                );
              }, itemCount: cardItems.length+1),
            ),
          ],
        ),
      ),
    );
  }
}
