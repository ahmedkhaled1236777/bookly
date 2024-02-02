import 'package:bookly/Features/clippath.dart';
import 'package:bookly/Features/home/data/repos/home_repo_implement.dart';
import 'package:bookly/Features/home/presentation/view/home.dart';
import 'package:bookly/Features/home/presentation/viewmodel/featuredbooks/featuredbooks_cubit.dart';
import 'package:bookly/Features/home/presentation/viewmodel/newstbooks/newstbooks_cubit.dart';
import 'package:bookly/Features/search/presentation/views/viewmodel/cubit/search_cubit.dart';
import 'package:bookly/Features/splash/presentation/view/splashview.dart';
import 'package:bookly/Features/stripepayment/apikey.dart';
import 'package:bookly/Features/stripepayment/tabbar.dart';
import 'package:bookly/core/utils/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloc/bloc.dart';
import 'Features/bookdetailes/bookdetailes.dart';
import 'Features/home/presentation/viewmodel/similarbooks/similarbooks_cubit.dart';
import 'Features/search/data/repos/search_repo_implementation.dart';
import 'Features/search/presentation/views/searhview.dart';
import 'constants.dart';
import 'core/utils/servicelocator.dart';

void main() {
  Apiservice.initdio();
  Stripe.publishableKey=apikey.publishablekey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedbooksCubit(homerepo: homerepoimplement()),
        ),
        BlocProvider(
          create: (context) => NewstbooksCubit(homerepo: homerepoimplement()),
        ),
        BlocProvider(
          create: (context) => SimilarbooksCubit(homerepoimplement()),
        ),
        BlocProvider(
          create: (context) => SearchCubit(searchrepo: searchrepoimplementation()),
        ),
     
      ],
   // "jkjkjkkj"
  
      child: MaterialApp(
        routes: {
          splashview.routeName: (context) => splashview(),
          "tabbar": (context) => tabbar(),
          home.homeroute: (context) => home(),
          searchview.searchviewroute: (context) => searchview(),
          "mypath": (context) => mypath()
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        initialRoute: 
        "mypath",
      ),
    );
  }
}
