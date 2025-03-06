import 'package:flutter/material.dart';
import 'package:news/Widgets/url_view.dart';
import 'package:news/models/article_model.dart';

class NewsPost extends StatelessWidget {
  const NewsPost({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return UrlView(url: articleModel.url);
            },
          ),
        );
      },
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: articleModel.image != null
                  ? Image.network(
                      articleModel.image!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : const Icon(
                      Icons.error,
                    )
              /*Image.network(
              'https://alahly-images.s3.us-east-2.amazonaws.com/Article/original/-%D9%83%D9%88%D9%84%D8%B11-66a7c89c87325.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,)*/
              ),
          const SizedBox(
            height: 8,
          ),
          Text(
            articleModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            articleModel.subTitle ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              //fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
