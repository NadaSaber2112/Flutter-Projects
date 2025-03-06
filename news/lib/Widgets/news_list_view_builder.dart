import 'package:flutter/material.dart';
import 'package:news/Widgets/news_list_view.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/news_services.dart';

// ignore: must_be_immutable
class NewListViewBuilder extends StatefulWidget {
  const NewListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewListViewBuilder> createState() => _NewListViewBuilderState();
}

class _NewListViewBuilderState extends State<NewListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsServices().getNews(category:widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(
              articles: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverFillRemaining(
              child: Center(
                child: Text('oops There was an error,Try later'),
              ),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            ); //SliverFillRemaining here not allowed the list to be display(return empty list)?
          }
        });
  }
}
