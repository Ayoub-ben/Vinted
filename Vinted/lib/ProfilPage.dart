import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


class ProfilePage extends StatelessWidget {

  final String documentId;
  ProfilePage({required this.documentId});






  @override
  Widget build(BuildContext context) {
   CollectionReference users = FirebaseFirestore.instance.collection('users');

   return FutureBuilder<DocumentSnapshot>(
     future: users.doc(documentId).get(),
     builder: ((context, snapshot) {
       if (snapshot.connectionState == ConnectionState.done){
         Map<String,dynamic> data =
             snapshot.data!.data() as Map<String, dynamic>;
         children : [
           Text(
             'Premier texte',
             style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
           ),
           Text(
             'Deuxième texte',
             style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
           ),
         ];
         return Text('${data['ville']}'"\n" '${data['adresse']}'"\n" '${data['Code Postal']}'"\n" '${data['anniversaire']}',style: TextStyle(
           fontSize: 18));

       }
       return Text('load...');
     }),
   );

  }



}








