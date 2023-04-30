import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit.dart';
import '../../shared/states.dart';

class SportsSCreen extends StatelessWidget {
  const SportsSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var sports = NewsCubit.get(context).sports;

        if (state is NewsGetSportsErrorState) {
          print('${state.error}');
          return Center(
            child: Text(
              'Connection Error !',
              style: TextStyle(fontSize: 30,
               fontWeight: FontWeight.w900,
               color: Colors.grey
               ),
            ),
          );
        }
        return sports.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
              physics: BouncingScrollPhysics(),
                itemCount: sports.length,
                itemBuilder: (context, index) {
                  return buildArticleItem(sports[index] as Map,context);
                },
                separatorBuilder: (context, index) => buildSeperator(),
              );
      },
    );
  }
}