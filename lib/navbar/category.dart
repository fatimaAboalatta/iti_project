import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_iti/models/category.dart';
import 'package:project_iti/navbar/caterory%20card.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          child: StreamBuilder<List<Category>>(
            stream: readCaterories(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('somting wrong \n ${snapshot.error}');
              } else if (snapshot.hasData) {
                final categories = snapshot.data!.toList();
                return GridView.builder(
                  itemCount: categories.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 24,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: CategoryCard(
                          name: categories[index].name!,
                          photo: categories[index].photo!),
                    );
                  },
                );
              }
              else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  Stream<List<Category>> readCaterories() => FirebaseFirestore.instance
      .collection('Category')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Category.fromJson(doc.data())).toList());
}
