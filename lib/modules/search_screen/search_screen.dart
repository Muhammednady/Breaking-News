import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit.dart';
import 'package:news_app/shared/states.dart';

class SearchSCreen extends StatelessWidget {
  SearchSCreen({super.key});
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<NewsCubit>(context).emit(NewsInitialState());
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        List<dynamic> list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: Text('Search for an article'),
            //centerTitle: true,
            titleSpacing: 10.0,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DefaultTextFormField(
                    hintText: 'search',
                    label: 'search',
                    type: TextInputType.text,
                    controll: _textEditingController,
                    prefix: Icons.search,
                    onFinishEntering: (value) {
                      cubit.getSearch(param: value);
      // cubit.emit(state);like setstate((){});makes Rebuilding to Widget
                    },
                    validate: (String? value) {
                      if (value!.length == 0) {
                        return "value can't be empty";
                      }
                      return null;
                    }),
              ),
              state is NewsGetSearchErrorState
                  ? const Center(
                      child: Text(
                        'Connection Error !',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey),
                      ),
                    )
                  : Expanded(child: buildArticlesList(list,context,isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
