import 'package:flutter/material.dart';

class TodoTool extends StatefulWidget {
  const TodoTool({super.key});

  @override
  State<TodoTool> createState() => _TodoToolState();
}

class _TodoToolState extends State<TodoTool> {
  final items = <String>[];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final result = await showDialog<String>(
          context: context,
          builder: (context) => _TodoDialog(),
        );

        if (result != null && result.isNotEmpty) {
          setState(() => items.add(result));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          items.isEmpty ? "To-Do List" : items.join("\n"),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _TodoDialog extends StatefulWidget {
  @override
  State<_TodoDialog> createState() => _TodoDialogState();
}

class _TodoDialogState extends State<_TodoDialog> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Task"),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: "Task name"),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, controller.text),
          child: const Text("Add"),
        ),
      ],
    );
  }
}
