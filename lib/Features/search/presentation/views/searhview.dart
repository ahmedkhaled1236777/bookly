import 'package:bookly/Features/search/presentation/views/widgets/customlistviewsearch.dart';
import 'package:bookly/Features/search/presentation/views/widgets/customsearchbody.dart';
import 'package:bookly/Features/search/presentation/views/widgets/customtextfield.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../home/presentation/view/widgets/custombestselleritem.dart';
import '../../../home/presentation/view/widgets/customlistviewbestseller.dart';

class searchview extends StatelessWidget {
  static const String searchviewroute = "/searchview";
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: customsearchbody()));
  }
}
