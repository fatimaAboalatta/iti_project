import 'package:flutter/material.dart';
class CategoryCard extends StatelessWidget {
  final String name;
  final String photo;
  const CategoryCard({
    Key? key,
    required this.name,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ), //BoxShadow
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                photo,
                height: 170,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(name,
                style: TextStyle(
                    color: Color(0xFF009B62),
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ],
        ),
      ),
    );
  }
}