 
import 'package:flutter/material.dart';
class SearchingScreen extends StatefulWidget {
   const SearchingScreen({super.key});
 
   @override
   State<SearchingScreen> createState() => _SearchingScreenState();
 }

 class _SearchingScreenState extends State<SearchingScreen> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title:const Text('Searching') ,),
       body: Column(
         children: [
           Text('data'),
         ],
       ),
     );
   }
 }
 