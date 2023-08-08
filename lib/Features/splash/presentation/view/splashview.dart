import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/assets.dart';
import '../../../home/presentation/view/home.dart';
import '../../../homewithbottom/presentation/view/homewithbottom.dart';

class splashview extends StatefulWidget {
  static const String routeName = "/";
  @override
  State<splashview> createState() => _splashviewState();
}

class _splashviewState extends State<splashview> {
  @override
  void initState() {
    gohomepage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Assetsdata.splashlogo),
      ),
    );
  }

  void gohomepage() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, home.homeroute);
    });
  }
}
