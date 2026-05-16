import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() =>
      _ChatScreenState();
}

class _ChatScreenState
    extends State<ChatScreen> {
  final controller =
  TextEditingController();

  final currentUser =
      FirebaseAuth.instance.currentUser;

  final messagesRef =
  FirebaseFirestore.instance
      .collection('messages');

  Future<void> sendMessage() async {
    if (controller.text.trim().isEmpty) {
      return;
    }

    final message = Message(
      date: DateTime.now(),

      email:
      currentUser?.email ??
          'Unknown',

      text: controller.text.trim(),
    );

    await messagesRef.add(
      message.toJson(),
    );

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Chat',
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<
                QuerySnapshot
            >(
              stream:
              messagesRef
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

                final docs =
                    snapshot.data!.docs;

                final messages =
                docs
                    .map(
                  Message
                      .fromSnapshot,
                )
                    .toList();

                return ListView.builder(
                  reverse: true,

                  padding:
                  const EdgeInsets.all(
                    16,
                  ),

                  itemCount:
                  messages.length,

                  itemBuilder: (
                      context,
                      index,
                      ) {
                    final message =
                    messages[index];

                    final isMe =
                        message.email ==
                            currentUser
                                ?.email;

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
                              message.email,

                              style:
                              TextStyle(
                                fontSize:
                                12,

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
                              message.text,

                              style:
                              TextStyle(
                                fontSize:
                                16,

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
                              '${message.date.hour}:${message.date.minute.toString().padLeft(2, '0')}',

                              style:
                              TextStyle(
                                fontSize:
                                11,

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

          SafeArea(
            child: Padding(
              padding:
              const EdgeInsets.all(16),

              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller:
                      controller,

                      decoration:
                      InputDecoration(
                        hintText:
                        'Message...',

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

                  const SizedBox(
                    width: 12,
                  ),

                  IconButton(
                    onPressed:
                    sendMessage,

                    icon: const Icon(
                      Icons.send,
                    ),
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