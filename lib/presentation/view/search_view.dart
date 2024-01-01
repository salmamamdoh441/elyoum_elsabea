import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/cubit.dart';
import 'package:news_app/presentation/widget/article_builder.dart';
import 'package:news_app/presentation/widget/default_form_field.dart';

import '../../business_logic/cubit/states.dart';

class SearchScreenView extends StatelessWidget {
  var searchController=TextEditingController();
   SearchScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewStates>(
      listener: (context,state){},
      builder: (BuildContext context, state) {
        var list = NewsCubit.get(context).search;

        return  Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding:  const EdgeInsets.all(20.0),
              child: DefaultFormField(
                controller: searchController,
                type: TextInputType.text,
                onChange: (value){
                  NewsCubit.get(context).getSearch(value);
                },
                validate: ( value){
                  if(value!.isEmpty){
                    return 'search must not be empty';
                  }
                  return null;
                },
                prefix: Icons.search,
                label: 'Search',
              ),
            ),
            Expanded(child: ArticleBuilder(context, list: list,isSearch: true,)),

          ],

        ),
      ); },

    );
  }
}
