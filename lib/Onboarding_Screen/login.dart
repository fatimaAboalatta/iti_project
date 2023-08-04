import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_iti/HomeScreen.dart';
import 'package:project_iti/register.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009B62),
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
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 40.0,
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
                      labelText: 'البريد الألكتروني',
                      labelStyle: TextStyle(color: Color(0xFF009B62)),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFF009B62),
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
                    obscureText: visible,
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
                      labelText: 'كلمة السر',
                      labelStyle: TextStyle(color: Color(0xFF009B62)),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xFF009B62),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Color(0xFF009B62),
                        ),
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
                              .signInWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim())
                              .then((value) {
                            print(value.user!.email);
                            print(value.user!.uid);
                            print("Login success");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ), // MaterialPageRoute
                            );
                          }).catchError((error) {
                            print(error.toString());
                          });
                        }
                      },
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'لا تملك حساب ?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => register(),
                            ), // MaterialPageRoute
                          );
                        },
                        child: Text(
                          'سجل الأن',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ],
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
