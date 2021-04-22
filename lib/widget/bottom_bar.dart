import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 4,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      selectedItemColor: Color(0xFFf78f20),
      onTap: (index) {},
      items: [
        BottomNavigationBarItem(
          label: "Anasayfa",
          icon: Icon(FlutterIcons.home_ant),
        ),
        BottomNavigationBarItem(
          label: "Kategoriler",
          icon: Icon(FlutterIcons.search_fea),
        ),
        BottomNavigationBarItem(
          label: "Favorilerim",
          icon: Icon(FlutterIcons.heart_outlined_ent),
        ),
        BottomNavigationBarItem(
            label: "Sepetim", icon: Icon(FlutterIcons.shopping_bag_fea)),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(
            FlutterIcons.user_fea,
          ),
        ),
      ],
    );
  }
}
