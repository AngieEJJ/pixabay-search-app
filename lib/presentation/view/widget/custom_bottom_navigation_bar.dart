import 'package:flutter/material.dart';
import 'package:why_two_screen/presentation/view/page/image_search_screen.dart';
import 'package:why_two_screen/presentation/view/page/liked_images_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const ImageSearchScreen(),
    const LikedImagesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: BottomNavigationBar(
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Like',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF4FB6B2),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
