import 'package:flutter/material.dart';
import 'package:learning_application/features/daily_news/domain/entities/article.dart';

class ArticleTile extends StatelessWidget {
  final ArticleEntity article;

  const ArticleTile(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            _buildImage(),
            const SizedBox(width: 12),
            Expanded(child: _buildDescription()),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        article.urlToImage ?? "",
        errorBuilder:
            (context, error, stackTrace) => const Icon(Icons.broken_image),
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          article.title ?? "No Title",
          style: const TextStyle(
            fontFamily: "Muli",
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Flexible(
          child: Text(
            article.description ?? "No Description",
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
