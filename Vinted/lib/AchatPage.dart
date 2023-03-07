import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'DetailPage.dart';
import 'PanierPage.dart';
import 'ProfilPage.dart';
List<Vetement> panier = [];

class AchatPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vêtements'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('vetement').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }


          List<Vetement> vetements = snapshot.data!.docs.map((doc) => Vetement.fromSnapshot(doc)).toList();

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: vetements.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(vetement: vetements[index]),
                    ),
                  );
                },
                child: ListTile(
                  leading: Image.network(vetements[index].imageUrl),
                  title: Text(vetements[index].titre),
                  subtitle: Text('\$${vetements[index].prix.toStringAsFixed(2)}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                        panier.add(vetements[index]);
                    },
                    child: Text('Ajouter au panier'),
                  ),
                ),

              );

            },
          );

        },

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Acheter'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Panier'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        onTap: (int index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PanierPage(panier: panier)),
            );
          }
        },
      ),
    );
  }



}


class Vetement {
  final String id;
  final String titre;
  final String imageUrl;
  final int prix;

  Vetement({
    required this.id,
    required this.titre,
    required this.imageUrl,
    required this.prix,
  });

  factory Vetement.fromSnapshot(DocumentSnapshot snapshot) {
    return Vetement(
      id: snapshot.id,
      titre: snapshot['titre'],
      imageUrl: snapshot['imageUrl'],
      prix: snapshot['prix'],
    );
  }
}
