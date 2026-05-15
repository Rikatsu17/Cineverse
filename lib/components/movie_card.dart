import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;

  const MovieCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 18,
              ),

              const SizedBox(width: 4),

              Text(rating.toString()),
            ],
          ),
        ],
      ),
    );
  }
}