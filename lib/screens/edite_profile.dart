import 'package:flutter/material.dart';

class EditBioScreen extends StatelessWidget {
   // ignore: prefer_const_constructors_in_immutables
   EditBioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text("Editpage", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
       
        ),
      
      // body: Consumer<>(builder: (context, value, child) {
        
      // },), 
    );
  }
}
