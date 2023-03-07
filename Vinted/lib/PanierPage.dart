import 'package:flutter/material.dart';

import 'AchatPage.dart';
import 'home_page.dart';

class PanierPage extends StatefulWidget {
  final List<Vetement> panier;

  const PanierPage({required this.panier});

  @override
  _PanierPageState createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var i = 0; i < widget.panier.length; i++) {
      total += widget.panier[i].prix;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: ListView.builder(
        itemCount: widget.panier.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(widget.panier[index].imageUrl),
            title: Text(widget.panier[index].titre),
            subtitle: Text('\$${widget.panier[index].prix.toStringAsFixed(2)}'),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  widget.panier.removeAt(index);
                });
              },
              icon: Icon(Icons.delete),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Total: \$${total.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Payer'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}