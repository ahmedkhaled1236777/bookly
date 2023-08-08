import 'package:bookly/Features/home/presentation/view/home.dart';
import 'package:flutter/material.dart';

import 'badge.dart';
import 'profile.dart';

class homewithbottom extends StatefulWidget {
  @override
  State<homewithbottom> createState() => _homewithbottomState();
}

class _homewithbottomState extends State<homewithbottom> {
  int x = 0;
  List screens = [home(), profile(), badge()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          screens[x],
          Padding(
            padding: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: BottomNavigationBar(
                  currentIndex: x,
                  selectedItemColor: Colors.amber,
                  onTap: (value) {
                    x = value;

                    setState(() {});
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                      ),
                      label: "home",
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: "profile"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.car_crash), label: "badge"),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
