import 'package:flutter/material.dart';
import '../data/message_model.dart';
import 'chat_bubble.dart';

class ChatDetailScreen extends StatefulWidget {
  final String name;

  const ChatDetailScreen({super.key, required this.name});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final List<MessageModel> messages = [];
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }

  void sendMessage() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      messages.add(
        MessageModel(
          text: controller.text.trim(),
          isMe: true,
          timestamp: DateTime.now(),
        ),
      );
    });

    controller.clear();
    scrollToBottom();

    // Simulated AI/Support auto-reply
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        messages.add(
          MessageModel(
            text: "Support: Thank you for your message!",
            isMe: false,
            timestamp: DateTime.now(),
          ),
        );
      });

      scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              children: messages
                  .map((msg) => ChatBubble(message: msg))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
