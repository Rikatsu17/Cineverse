import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';
import '../../database/app_database.dart';
import '../../models/comment.dart';
import '../../models/movie.dart';
import '../../providers/database_provider.dart';

class MovieDetailsScreen extends ConsumerStatefulWidget {
  final Movie movie;

  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  ConsumerState<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends ConsumerState<MovieDetailsScreen> {
  @override
  final commentController =
  TextEditingController();

  final currentUser =
      FirebaseAuth.instance.currentUser;
  Widget build(BuildContext context) {
    final commentsRef =
    FirebaseFirestore.instance
        .collection('movies')
        .doc(widget.movie.id.toString())
        .collection('comments');
    final movie = widget.movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.movie.title,
                style: const TextStyle(
                  shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                ),
              ),
              background: CachedNetworkImage(
                imageUrl: '$imageBaseUrl${movie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        movie.voteAverage.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    movie.overview,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () async {
                        final database = ref.read(databaseProvider);

                        await database.addToWatchlist(
                          WatchlistTableCompanion.insert(
                            id: Value(movie.id),
                            title: widget.movie.title,
                            posterPath: widget.movie.posterPath,
                            voteAverage: widget.movie.voteAverage,
                            overview: widget.movie.overview,
                          ),
                        );

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Added to Watchlist'),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.bookmark),
                      label: const Text('Add to Watchlist'),
                    ),
                  ),
                  const SizedBox(height: 40),

                  const Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    height: 400,

                    child: StreamBuilder<QuerySnapshot>(
                      stream:
                      commentsRef
                          .orderBy(
                        'date',
                        descending: true,
                      )
                          .snapshots(),

                      builder: (
                          context,
                          snapshot,
                          ) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child:
                            CircularProgressIndicator(),
                          );
                        }

                        final comments =
                        snapshot.data!.docs
                            .map(
                          MovieComment
                              .fromSnapshot,
                        )
                            .toList();

                        if (comments.isEmpty) {
                          return const Center(
                            child: Text(
                              'No comments yet',
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: comments.length,

                          itemBuilder: (
                              context,
                              index,
                              ) {
                            final comment =
                            comments[index];

                            final isMe =
                                comment.email ==
                                    currentUser?.email;

                            return Align(
                              alignment:
                              isMe
                                  ? Alignment
                                  .centerRight
                                  : Alignment
                                  .centerLeft,

                              child: Container(
                                margin:
                                const EdgeInsets.only(
                                  bottom: 12,
                                ),

                                padding:
                                const EdgeInsets.all(
                                  14,
                                ),

                                constraints:
                                const BoxConstraints(
                                  maxWidth: 300,
                                ),

                                decoration:
                                BoxDecoration(
                                  color:
                                  isMe
                                      ? Colors.red
                                      : Colors.grey
                                      .shade300,

                                  borderRadius:
                                  BorderRadius.circular(
                                    20,
                                  ),
                                ),

                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                                  children: [
                                    Text(
                                      comment.email,

                                      style: TextStyle(
                                        fontSize: 12,

                                        color:
                                        isMe
                                            ? Colors
                                            .white70
                                            : Colors
                                            .black54,
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 6,
                                    ),

                                    Text(
                                      comment.text,

                                      style: TextStyle(
                                        color:
                                        isMe
                                            ? Colors
                                            .white
                                            : Colors
                                            .black,
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 6,
                                    ),

                                    Text(
                                      '${comment.date.hour}:${comment.date.minute.toString().padLeft(2, '0')}',

                                      style: TextStyle(
                                        fontSize: 11,

                                        color:
                                        isMe
                                            ? Colors
                                            .white70
                                            : Colors
                                            .black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller:
                          commentController,

                          decoration:
                          InputDecoration(
                            hintText:
                            'Write comment...',

                            border:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(
                                20,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      IconButton(
                        onPressed: () async {
                          if (commentController.text
                              .trim()
                              .isEmpty) {
                            return;
                          }

                          final comment =
                          MovieComment(
                            email:
                            currentUser?.email ??
                                'Unknown',

                            text:
                            commentController.text
                                .trim(),

                            date: DateTime.now(),
                          );

                          await commentsRef.add(
                            comment.toJson(),
                          );

                          commentController.clear();
                        },

                        icon: const Icon(
                          Icons.send,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}