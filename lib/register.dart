import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_iti/HomeScreen.dart';
import 'package:project_iti/models/usermodel.dart';

class register extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var numberController = TextEditingController();

  register({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009B62),
        leading:IconButton( icon:Icon(Icons.arrow_back_rounded), onPressed: () { Navigator.pop(context); },),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Image.asset(
                      'assets/images/b4.png',
                      scale: 30,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "تسجيل حساب جديد",
                      style: TextStyle(
                        fontSize: 33.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "أدخل الأسم ";
                      }
                      if (value.length < 3) {
                        return 'أدخل اسم اكتر من حرفين ';
                      }
                      return null;
                    },
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xFF009B62)),
                      ),
                      labelStyle: TextStyle(color: Color(0xFF009B62)),
                      labelText: 'الأسم',
                      prefixIcon: Icon(
                        color: Color(0xFF009B62),
                        Icons.person,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "أدخل البريد الإلكتروني ";
                      }
                      if (!RegExp(
                              r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
                          .hasMatch(value)) {
                        return 'أدخل بريد إلكتروني صحيح';
                      }
                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xFF009B62)),
                      ),
                      labelStyle: TextStyle(color: Color(0xFF009B62)),
                      labelText: 'البريد الألكتروني',
                      prefixIcon: Icon(
                        color: Color(0xFF009B62),
                        Icons.email,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "أدخل رقم الهاتف ";
                      }
                      if (value.length != 11) {
                        return 'أدخل رقم هاتف صحيح';
                      }
                      return null;
                    },
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xFF009B62)),
                      ),
                      labelStyle: TextStyle(color: Color(0xFF009B62)),
                      labelText: 'رقم الهاتف',
                      prefixIcon: Icon(
                        color: Color(0xFF009B62),
                        Icons.call,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "أدخل الرقم السري ";
                      }
                      if (value.length < 6) {
                        return 'أدخل اكتر من 6 ارقام';
                      }
                      return null;
                    },
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xFF009B62)),
                      ),
                      labelStyle: TextStyle(color: Color(0xFF009B62)),
                      labelText: 'كلمة السر',
                      prefixIcon: Icon(
                        color: Color(0xFF009B62),
                        Icons.lock,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                        color: Color(0xFF009B62),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: Color(0xFF009B62),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);

                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          )
                              .then((value) async {
                            final docUser = FirebaseFirestore.instance
                                .collection("users")
                                .doc();
                            final user = UserModel(
                              id: value.user!.uid,
                              name: nameController.text,
                              number: numberController.text,
                              emile: value.user!.email,
                            );
                            final json = user.toJson();
                            await docUser.set(json);
                            Fluttertoast.showToast(
                              msg: "تم التسجيل بنجاح مرحبا بك",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 10,
                              backgroundColor: Colors.amberAccent,
                              textColor: Colors.black,
                              fontSize: 18.0,
                            );
                           // Navigator.push(
                            //  context,
                            //  MaterialPageRoute(builder: (context) => const HomeScreen()),
                           // );
                          }).catchError((error) {
                            print(error.toString());
                          });
                        }
                      },
                      child: Text(
                        'تسجيل',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
