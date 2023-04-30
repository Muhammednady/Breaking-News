import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit.dart';
import '../../shared/states.dart';

class SCienceScreen extends StatelessWidget {
  const SCienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var science = NewsCubit.get(context).science;

        if (state is NewsGetScienceErrorState) {
          print('${state.error}');
          return Center(
            child: Text(
              'Connection Error !',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey),
            ),
          );
        }
        return science.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
              physics: BouncingScrollPhysics(),
                itemCount: science.length,
                itemBuilder: (context, index) {
                  return buildArticleItem(science[index] as Map,context);
                },
                separatorBuilder: (context, index) => buildSeperator(),
              );
      },
    );
  }
}
