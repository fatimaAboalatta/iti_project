import 'package:flutter/material.dart';
class ProductsCard extends StatelessWidget {
  final String name;
  final String photo;
  final String price;
  final String category;

  const ProductsCard({
    Key? key,
    required this.name,
    required this.photo,
    required this.price,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              offset: const Offset(-2, -2),
              blurRadius: 4.0,
              spreadRadius: 2,
            ), //BoxShadow
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(photo),
              height: 100,
              width: 100,
            ),
            SizedBox(width: 30,),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SizedBox(
                width:150,
                child: Column(
                  mainAxisAlignment : MainAxisAlignment.center,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            color: Color(0xFF009B62),
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                    SizedBox(height: 10,),
                    Text(category,
                        style: const TextStyle(
                            color: Color(0xFF009B62),
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                    SizedBox(height: 10,),
                    Text(price,
                        style: const TextStyle(
                            color: Color(0xFF009B62),
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}