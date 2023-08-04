import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_iti/models/usermodel.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

final user = FirebaseAuth.instance.currentUser!;
class _profileState extends State<profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  UserModel userModel = UserModel();
  getUsers() async {
    await FirebaseFirestore.instance
        .collection("users")
        .where("id", isEqualTo: user.uid!)
        .get()
        .then(
          (querySnapshot) {
           print( "------------------========${querySnapshot.docs.length}");
           setState(() { userModel = UserModel.fromJson( querySnapshot.docs[0].data());}
           );


      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(user.email!),
         Text(userModel.name!),
        ],
      ),
    );
  }

}
