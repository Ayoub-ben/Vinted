/*import 'package:vinted/ProfilPage.dart';
import 'package:vinted/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'DetailPage.dart';
import 'PanierPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
List<Vetement> panier = [];

class _HomePageState extends State<HomePage> {
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Page Acheter'),
    Text('Page Panier'),
    Text('Page Profil'),
  ];

  List<Vetement> _vetements = [
    Vetement(
        titre: 'T-shirt en lin',
        taille: 'L',
        prix: 19.99,
        imageUrl: 'https://images.pexels.com/photos/1656684/pexels-photo-1656684.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        categorie: 'T-shirt'
    ),
    Vetement(
      titre: 'Chemise en coton',
      taille: 'M',
      prix: 29.99,
      imageUrl: 'https://images.pexels.com/photos/769749/pexels-photo-769749.jpeg?auto=compress&cs=tinysrgb&w=600',
        categorie: 'Chemise'
    ),
    Vetement(
      titre: 'Chemise bleu',
      taille: 'S',
      prix: 39.99,
      imageUrl: 'https://images.pexels.com/photos/2313192/pexels-photo-2313192.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      categorie: 'Chemise'
    ),
  ];




  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Acheter'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tous'),
              Tab(text: 'Chemise'),
              Tab(text: 'T-shirt'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildList(_vetements),
            _buildList(_vetements.where((vetement) => vetement.categorie == 'Chemise').toList()),
            _buildList(_vetements.where((vetement) => vetement.categorie == 'T-shirt').toList()),
          ],
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
      ),
    );
  }

  Widget _buildList(List<Vetement> _vetements) {
    return ListView.builder(
      itemCount: _vetements.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(vetement: _vetements[index]),
              ),
            );
          },
          child: ListTile(
            leading: Image.network(_vetements[index].imageUrl),
            title: Text(_vetements[index].titre),
            subtitle: Text('\$${_vetements[index].prix.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () {
                setState(() {
                  panier.add(_vetements[index]);
                });
              },
              child: Text('Ajouter au panier'),
            ),
          ),
        );
      },
    );
  }

}


class Vetement {
  final String titre;
  final String taille;
  final double prix;
  final String imageUrl;
  final String categorie;



  Vetement({
    required this.titre,
    required this.taille,
    required this.prix,
    required this.imageUrl,
    required this.categorie,
  });
}

 */
