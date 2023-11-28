import 'package:flutter/material.dart';
import 'package:my_news/view/bottom_screen/screens/home_screen/home_screen.dart';
import 'package:my_news/view/bottom_screen/screens/profile_screen/profile_screen.dart';

class BottomController with ChangeNotifier {
  int selectedIndex = 0;
  List<Widget> screens = [HomeScreen(), ProfileScreen()];
  onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
