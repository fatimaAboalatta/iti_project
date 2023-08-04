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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding:EdgeInsets.symmetric(vertical: 30, horizontal: 30) ,
          height:330.0,
          margin: EdgeInsets.only(top: 80,right: 10,left:10,),
          decoration:
          BoxDecoration(
            color:Colors.white,
            border: Border.all(color:Colors.white, width: 2),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              new BoxShadow(color: Colors.black12, offset: new Offset(5.0, 7.0),),
            ],
          ),
          child: Column(
            children: [

              Text("معلومات حسابي ",style:TextStyle(
                fontSize:40.0,
                fontWeight: FontWeight.bold,
                color:Color(0xFF009B62),
              ),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color:Color(0xFF009B62),
                    size: 30.0,
                  ),
                  SizedBox(width: 20,),
                  Text(userModel.name??"",style:TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),),
],
              ),
              Row(
                children: [
                  Icon(
                    Icons.email,
                    color:Color(0xFF009B62),
                    size: 30.0,
                  ),
                  SizedBox(width: 20,),
                  Text( user.email!,style:TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),),
],
              ),
              Row(
                children: [
                  Icon(
                    Icons.call,
                    color:Color(0xFF009B62),
                    size: 30.0,
                  ),
                  SizedBox(width: 20,),
                  Text(userModel.number??"",style:TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),),
],
              ),

            ],
          ),
        ),
      ),
    );
  }

}
