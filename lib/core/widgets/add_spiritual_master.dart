import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/features/spiritual_masters/add/cubit/add_spiritual_master_cubit.dart';
import 'package:mandalahearts/features/spiritual_masters/add/cubit/add_spiritual_master_state.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';
import 'package:mandalahearts/models/async/async_state.dart';

class AddSpiritualMaster extends StatefulWidget {
  const AddSpiritualMaster({super.key});

  @override
  State<AddSpiritualMaster> createState() => _AddSpiritualMasterState();
}

class _AddSpiritualMasterState extends State<AddSpiritualMaster> {
  final _customController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _customController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddSpiritualMasterCubit, AddSpiritualMasterState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (_, _, _, saveState) {
            if (saveState is AsyncSuccess) {
              Navigator.of(context).pop(); // Close bottom sheet on success
            }
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(
            child: Text(message, style: const TextStyle(color: Colors.red)),
          ),
          loaded: (masters, selectedMaster, allowCustomMaster, saveState) {
            return SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      const Text(
                        'Add Spiritual Master',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Either Custom TextField or Dropdown
                      allowCustomMaster
                          ? TextFormField(
                              controller: _customController,
                              maxLength: 50,
                              decoration: const InputDecoration(
                                labelText: 'Enter your master name',
                                counterText: '',
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                              validator: (value) {
                                if (allowCustomMaster) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter a master name';
                                  }
                                  if (value.trim().length > 50) {
                                    return 'Name cannot exceed 50 characters';
                                  }
                                }
                                return null;
                              },
                            )
                          : DropdownButtonFormField<SpiritualMaster>(
                              value: selectedMaster,
                              items: masters
                                  .map(
                                    (m) => DropdownMenuItem(
                                      value: m,
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              m.photoUrl ?? '',
                                            ),
                                            radius: 16,
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            m.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) => context
                                  .read<AddSpiritualMasterCubit>()
                                  .selectMaster(val),
                              decoration: const InputDecoration(
                                labelText: 'Select from list',
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                              validator: (value) {
                                if (!allowCustomMaster && value == null) {
                                  return 'Please select a spiritual master';
                                }
                                return null;
                              },
                            ),

                      const SizedBox(height: 16),

                      // Checkbox: always below
                      Row(
                        children: [
                          Checkbox(
                            value: allowCustomMaster,
                            onChanged: (val) {
                              context
                                  .read<AddSpiritualMasterCubit>()
                                  .toggleAllowCustomMaster();
                              if (val == true) _customController.clear();
                            },
                          ),
                          const Expanded(
                            child: Text(
                              'Add your own spiritual master',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Save button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: saveState is AsyncLoading
                              ? null
                              : () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    context
                                        .read<AddSpiritualMasterCubit>()
                                        .saveMaster(
                                          customMaster: _customController.text
                                              .trim(),
                                        );
                                  }
                                },
                          child: saveState is AsyncLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'Save',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),

                      // Inline error message below Save button
                      if (saveState is AsyncError)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            saveState.message,
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
