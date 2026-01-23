import 'package:flutter/material.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';

class SpiritualMasterScreen extends StatefulWidget {
  final bool isEdit;
  final SpiritualMaster? master;

  // Named constructor for "Add"
  const SpiritualMasterScreen.add({super.key}) : isEdit = false, master = null;

  // Named constructor for "Edit"
  const SpiritualMasterScreen.edit({super.key, required this.master})
    : isEdit = true;

  @override
  State<SpiritualMasterScreen> createState() => _SpiritualMasterScreenState();
}

class _SpiritualMasterScreenState extends State<SpiritualMasterScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _affiliationController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();

    // Initialize controllers depending on add/edit
    _nameController = TextEditingController(
      text: widget.isEdit ? widget.master!.guruName : '',
    );
    _affiliationController = TextEditingController(
      text: widget.isEdit ? widget.master!.spiritualOrganisation : '',
    );
    _descriptionController = TextEditingController(
      text: widget.isEdit ? widget.master!.description : '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _affiliationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _save() {
    if (widget.isEdit) {
      // Handle update logic
      print("Updating ${_nameController.text}");
    } else {
      // Handle add logic
      print("Adding ${_nameController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEdit ? "Edit Spiritual Master" : "Add Spiritual Master",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Master Name"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _affiliationController,
              decoration: const InputDecoration(labelText: "Affiliation"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _save,
                child: Text(widget.isEdit ? "Update" : "Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
