import 'package:flutter/material.dart';

class tabbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return DefaultTabController(
    length: 3,
    child: Scaffold(
      body: TabBarView(children: [
        Text("data"),
        Text("asaaas"),
        Text("kjhsk")
      ]),
      appBar: AppBar(
        bottom: TabBar(tabs: [
          Text("data"),
          Text("hai"),
          Text("khjk"),
        ]),
      ),
    ),
  );
  }

}