
import 'package:flutter/material.dart';
import 'package:widcy2/screen/book_screen.dart';
import 'package:widcy2/screen/home_screen.dart';
import 'package:widcy2/screen/more_screen.dart';
import 'package:widcy2/screen/product_screen.dart';
import 'package:widcy2/screen/search_screen.dart';

class MainScreen extends StatefulWidget {
   MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int _indexSelected = 0;
  List<Widget> screenList = [
    ProductScreen(),
    SearchScreen(),
    BookScreen(),
    MoreScreen()
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onTabClick(index){
    setState(() {
      _indexSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[_indexSelected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexSelected,
        elevation: 5,
        selectedLabelStyle: TextStyle(color: Colors.black, fontSize: 16),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.amberAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',activeIcon: Icon(Icons.home,), backgroundColor: Colors.cyan),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Book'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More')
        ],
        onTap: (index){
          onTabClick(index);
        },
      ),
    );
  }
}
