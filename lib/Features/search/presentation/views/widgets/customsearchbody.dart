import 'package:bookly/Features/search/presentation/views/viewmodel/cubit/search_cubit.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customlistviewsearch.dart';
import 'customtextfield.dart';

class customsearchbody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customtextfield(),
          SizedBox(
            height: 10,
          ),
          Text(
            "Search result",
            style: featurestyles.textstyle16,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
             if(state is Searchloading)return Center(child: CircularProgressIndicator(),);
             else if (state is Searchfailure) return Center(child: Text(state.errormessage),);
             else return customlistviewsearch();
            },
          ))
        ],
      ),
    );
  }
}
