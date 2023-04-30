import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit.dart';
import 'package:news_app/shared/states.dart';

import '../modules/search_screen/search_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        if (state is NewsBottomNavChangeState) {
          print('NewsBottomNavChangeState ===> from newlayout Screen');
        }

        if (state is NewsGetBussinessSuccessState) {
          print('NewsGetBussinessSuccessState ===> from Newlayout Screen');
        }
        if (state is NewsGetBussinessLoadingState) {
          print('NewsGetBussinessLoadingState ===> from Newlayout Screen');
        }
      },
      builder: (context, state) {
        NewsCubit cubit = BlocProvider.of<NewsCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: EdgeInsetsDirectional.only(start: 10),
              child: Text('News App'),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchSCreen(),
                        ));
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {
                    cubit.changeBrightnessMode();
                  },
                  icon: Icon(
                    Icons.brightness_4_outlined,
                    size: 30,
                  )),
            ],
          ),
          body: cubit.screens[cubit.itemIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.itemIndex,
              onTap: (int value) {
                if (value == 1) {
                  cubit.getSports();
                }
                if (value == 2) {
                  cubit.getScience();
                }
                cubit.change(value);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: 'Bussiness'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: 'Sports'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), label: 'Science'),
              ]),
        );
      },
    );
  }
}
