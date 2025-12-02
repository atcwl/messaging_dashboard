import 'package:flutter/material.dart';
import '../data/contact_model.dart';
import 'chat_detail_screen.dart';

class ChatListScreen extends StatelessWidget {
  ChatListScreen({super.key});

  final List<ContactModel> contacts = List.generate(
    5,
    (i) => ContactModel(
      name: "Contact $i",
      lastMessage: "Hi, how can I help?",
      time: "15:${30 + i}",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Messages")),
      body: ListView.separated(
        itemCount: contacts.length,
        separatorBuilder: (_, __) => const Divider(height: 0),
        itemBuilder: (_, i) {
          final contact = contacts[i];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text(
                contact.name.substring(0, 1),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              contact.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              contact.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              contact.time,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatDetailScreen(name: contact.name),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
