import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_iti/models/products.dart';
import 'package:project_iti/navbar/productsCard.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: StreamBuilder<List<Prodcuts>>(
          stream: readProdcuts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('somting wrong \n ${snapshot.error}');
            } else if (snapshot.hasData) {
              final products = snapshot.data!.toList();
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: ProductsCard(
                        name: products[index].name!,
                        photo: products[index].photo!,
                        price: products[index].price!,
                        category: products[index].category!,
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Stream<List<Prodcuts>> readProdcuts() => FirebaseFirestore.instance
      .collection('Prodcuts')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Prodcuts.fromJson(doc.data())).toList());
}
