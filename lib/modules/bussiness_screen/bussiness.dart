import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit.dart';
import 'package:news_app/shared/states.dart';

import '../../shared/components/components.dart';

class BussinesSCreen extends StatelessWidget {
  const BussinesSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
          
         if (state is NewsGetBussinessSuccessState) {
          print('NewsGetBussinessSuccessState ===> from Business Screen');
        }
        if (state is NewsGetBussinessLoadingState) {
          print('NewsGetBussinessLoadingState ===> from Business Screen');
        }
         if (state is NewsGetSportsSuccessState) {
          print('NewsGetSportsSuccessState ===> from Business Screen');
        }
        if (state is NewsGetSportsLoadingState) {
          print('NewsGetSportsLoadingState ===> from Business Screen');
        }
         if (state is NewsGetScienceSuccessState) {
          print('NewsGetScienceSuccessState ===> from Business Screen');
        }
        if (state is NewsGetScienceLoadingState) {
          print('NewsGetScienceLoadingState ===> from Business Screen');
        }
      },
      builder: (context, state) {
       
        var business = NewsCubit.get(context).business;
        if (state is NewsGetBussinessErrorState) {
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
        return state is NewsGetBussinessLoadingState // business.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
              physics: BouncingScrollPhysics(),
                itemCount: business.length,
                itemBuilder: (context, index) {
                  return buildArticleItem(business[index] as Map,context);
                },
                separatorBuilder: (context, index) => buildSeperator(),
              );
      },
    );
  }
}
/*
Map map = {
          "urlToImage":
              "https://media.cnn.com/api/v1/images/stellar/prod/230317122702-first-republic-office-0316.jpg",
          "title": "How First Republic became such a hot mess - CNN",
          "publishedAt": "2023-03-17T18:28:00Z",
        };
        */

