import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/presentation/widget/news_item.dart';

class ArticleBuilder extends StatelessWidget {
   List<dynamic> list;
   bool isSearch;
    ArticleBuilder(BuildContext context,   {super.key,required this.list,this.isSearch=false});

  @override
  Widget build(BuildContext context,) {


    return ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) =>
          ListView.separated(

            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => BuildArticleItem(article: list[index]),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 10,),
      fallback: (context) => isSearch?Container():const Center(child: CircularProgressIndicator()),
    );
  }
}
