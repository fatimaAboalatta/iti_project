import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_iti/navbar/about.dart';
import 'package:project_iti/navbar/category.dart';
import 'package:project_iti/navbar/home.dart';
import 'package:project_iti/navbar/profile.dart';
import 'package:project_iti/teampage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  static final title = 'salomon_bottom_bar';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  List<Widget> screens = [
    const home(),
    const category(),
    const profile(),
    const about(),
  ];
  List<String> titels = [
    "الصفحة الرئيسية",
    "الأقسام",
    "الملف الشخصي",
    "حول التطبيق",
  ];

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009B62),
        title: Text(titels[_currentIndex]),
        actions: <Widget>[
          IconButton(
            icon: const Icon( Icons.favorite_border),
            tooltip: 'اسماء المطورين',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Team(),
                ), // MaterialPageRoute
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'تسجيل خروج',
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),


        ],
        leading: Image.asset('assets/images/b4.png'),
      ),




      body: screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          print(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: const Text("الرئيسية"),
            selectedColor: Color(0xFF009B62),
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.border_all_rounded),
            title: Text("الافسام"),
            selectedColor: Color(0xFF009B62),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("الملف الشخصي"),
            selectedColor: Color(0xFF009B62),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.info_outline),
            title: Text("حول التطبيق"),
            selectedColor: Color(0xFF009B62),
          ),
        ],
      ),
    );
  }
}
