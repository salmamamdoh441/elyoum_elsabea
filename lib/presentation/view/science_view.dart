import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/cubit.dart';
import '../../business_logic/cubit/states.dart';
import '../widget/news_item.dart';

class ScienceView extends StatelessWidget {
  const ScienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).science;
        return ConditionalBuilder(
            condition: list.length > 0,
            builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  BuildArticleItem(article: list[index]),
              itemCount: 12,
              separatorBuilder: (context, index) => const Divider(),
            ),
            fallback: (context) =>
            const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
