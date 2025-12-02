import 'package:flutter/material.dart';

class NotesTool extends StatefulWidget {
  const NotesTool({super.key});

  @override
  State<NotesTool> createState() => _NotesToolState();
}

class _NotesToolState extends State<NotesTool> {
  String note = "";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final result = await showDialog<String>(
          context: context,
          builder: (context) => _NotesDialog(initial: note),
        );

        if (result != null) {
          setState(() => note = result);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.amber.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          note.isEmpty ? "Notes" : note,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _NotesDialog extends StatefulWidget {
  final String initial;

  const _NotesDialog({required this.initial});

  @override
  State<_NotesDialog> createState() => _NotesDialogState();
}

class _NotesDialogState extends State<_NotesDialog> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initial);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Notes"),
      content: TextField(
        controller: controller,
        maxLines: 6,
        decoration: const InputDecoration(border: OutlineInputBorder()),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, controller.text),
          child: const Text("Save"),
        ),
      ],
    );
  }
}
