import 'package:flutter/material.dart';

class Team extends StatelessWidget {
  const Team({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009B62),
        title: Text(" اسماء المطورين"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
              Text(
                "أسم مطورة التطبيق :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          Text(  "فاطمة خيري ابوالعطا",style: TextStyle(color: Color(0xFF009B62),fontSize: 30),),
            SizedBox(height: 30,),
            Image.asset('assets/images/b4.png',scale: 10,),

          ],
        ),
      ),
    );
  }
}
