import 'package:bookly/Features/home/presentation/view/widgets/homebody.dart';
import 'package:bookly/Features/home/presentation/viewmodel/newstbooks/newstbooks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodel/featuredbooks/featuredbooks_cubit.dart';

class home extends StatefulWidget {
  static const String homeroute = "/home";

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
   BlocProvider.of<FeaturedbooksCubit>(context).Fetchfeaturedbooks();
   BlocProvider.of<NewstbooksCubit>(context).Fetchnewestbooks();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homebody(),
    );
  }
}
