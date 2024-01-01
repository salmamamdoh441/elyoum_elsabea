import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/webview_screen/webview_screen.dart';

class BuildArticleItem extends StatelessWidget {
  dynamic article;
  final ImageErrorWidgetBuilder? errorBuilder;

  BuildArticleItem({super.key, this.article, this.errorBuilder});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  WebViewScreen(url: article['url'],)));
          // print(article["url"]);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(2, 2),

                    blurRadius: 1,
                    color: Theme.of(context).cardTheme.shadowColor!)
              ]),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: article['urlToImage'] != null
                      ? Image.network(
                    "${article['urlToImage']}",
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    "assets/images/Screenshot 2023-08-07 113330.png",
                    fit: BoxFit.cover,
                  ),
                ),

              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${article['publishedAt']}',
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
