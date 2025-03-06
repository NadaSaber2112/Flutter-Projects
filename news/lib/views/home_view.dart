import 'package:flutter/material.dart';
import 'package:news/Widgets/catgory_list_view.dart';
import 'package:news/Widgets/news_list_view_builder.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 29,
              ),
            ),
          ],
        ),
      ),
      body:const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 11),
        child: CustomScrollView(
          physics:  BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoriesListView()),
           SliverToBoxAdapter(child: SizedBox(height:32,)),
            NewListViewBuilder(
              category: 'general',
            ),
          ],
        )
         /*Column(
          children: [
        CategoriesListView(),
        SizedBox(
          height:32,
        ),
         Expanded(child: NewsListView()),
          ],
        ),*/
      ),  
    );
  }
}

