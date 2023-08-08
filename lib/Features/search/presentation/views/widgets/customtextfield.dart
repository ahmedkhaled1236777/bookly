import 'package:bookly/Features/search/presentation/views/viewmodel/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class customtextfield extends StatelessWidget {
  TextEditingController search=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:search ,
      decoration: InputDecoration(
        
        hintText: "Search",
        suffixIcon: IconButton(
            onPressed: () async{
              BlocProvider.of<SearchCubit>(context).books.clear();
              BlocProvider.of<SearchCubit>(context).fetchsearchbooks(search: search.text);
            },
            icon: Icon(
              Icons.search,
              color: Colors.white.withOpacity(0.8),
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
