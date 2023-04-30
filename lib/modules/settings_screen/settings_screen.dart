import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit.dart';
import 'package:news_app/shared/states.dart';

class SettingsSCreen extends StatelessWidget {
  const SettingsSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return Center(child: Text('SETTINGS SCREEN'),);
    PageController PC = PageController();
    return BlocConsumer<NewsCubit,NewsStates>(
       listener: (context, state) {},
       builder: (context, state) {
         return Scaffold(
        appBar: AppBar(),
        body: PageView(

          controller: PC,
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           // PC.
          },
          child: Icon(Icons.arrow_left_outlined),
        ),
      );
       },
    );
  }
}
