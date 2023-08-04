import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Center(
              child: Text(
                  "تم انشاء هذا التطبيق في عام 2023 في تدريب ITI لطلبة المستوى الأخير وما قبل الأخير بالجامعة وذلك لزيادة"
                      " التعلم وزيادة رفعة المجتمع , و هذا التطبيق عبارة عن متجر صغير لبيع البطيخ عن بعد وربنا يفتح لنا ويرزقنا ويا فتاح يا عليم يا رزاق يا كريم "
                ,maxLines: 10,style: TextStyle(fontSize: 20 ,),),
            ),
          ),

        ],
      ),
    );
  }
}
