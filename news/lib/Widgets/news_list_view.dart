import 'package:flutter/material.dart';
import 'package:news/Widgets/news_post.dart';
import 'package:news/models/article_model.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});
 final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: articles.length,
            (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: NewsPost(
          articleModel: articles[index],
        ),
      );
    }));
    /*ListView.builder(
      shrinkWrap: true,
      physics:const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
      return const Padding(
        padding:  EdgeInsets.only(bottom: 24),
        child:  NewsPost(),
      );
    });*/
  }
}
