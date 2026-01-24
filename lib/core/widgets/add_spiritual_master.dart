import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/features/spiritual_masters/add/cubit/add_spiritual_master_cubit.dart';
import 'package:mandalahearts/features/spiritual_masters/add/cubit/add_spiritual_master_state.dart';
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
    final primaryColor = Theme.of(context).primaryColor;
    final greyFillColor = Colors.grey.shade200;

    return BlocConsumer<AddSpiritualMasterCubit, AddSpiritualMasterState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (_, _, _, saveState) {
            if (saveState is AsyncSuccess) {
              Navigator.of(context).pop();
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
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: const Text(
                            'Add Spiritual Master',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Segmented Toggle
                    _segmentedToggle(
                      allowCustomMaster: allowCustomMaster,
                      onSelectExisting: () {
                        if (allowCustomMaster) {
                          context
                              .read<AddSpiritualMasterCubit>()
                              .toggleAllowCustomMaster();
                        }
                      },
                      onSelectCustom: () {
                        if (!allowCustomMaster) {
                          context
                              .read<AddSpiritualMasterCubit>()
                              .toggleAllowCustomMaster();
                          _customController.clear();
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    // Dynamic Content
                    Expanded(
                      child: allowCustomMaster
                          ? SingleChildScrollView(
                              child: TextFormField(
                                controller: _customController,
                                maxLength: 50,
                                decoration: InputDecoration(
                                  hintText: 'Enter your master name',
                                  counterText: '',
                                  filled: true,
                                  fillColor: greyFillColor,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                validator: (value) =>
                                    (value == null || value.trim().isEmpty)
                                    ? 'Please enter a name'
                                    : null,
                              ),
                            )
                          : GridView.builder(
                              itemCount: masters.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 1,
                                  ),
                              itemBuilder: (context, index) {
                                final master = masters[index];
                                final isSelected = master == selectedMaster;

                                return GestureDetector(
                                  onTap: () => context
                                      .read<AddSpiritualMasterCubit>()
                                      .selectMaster(master),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: isSelected
                                            ? primaryColor
                                            : Colors.transparent,
                                        width: 3,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(9),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Image.network(
                                            master.photoUrl ?? '',
                                            fit: BoxFit.cover,
                                            errorBuilder: (c, e, s) =>
                                                Container(
                                                  color: Colors.grey.shade200,
                                                  child: const Icon(
                                                    Icons.person,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              width: double.infinity,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 4,
                                                    horizontal: 4,
                                                  ),
                                              color: Colors.black.withOpacity(
                                                0.5,
                                              ),
                                              child: Text(
                                                master.name,
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (isSelected)
                                            Positioned(
                                              top: 4,
                                              right: 4,
                                              child: Icon(
                                                Icons.check_circle,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),

                    // Bottom Section
                    const SizedBox(height: 16),
                    if (saveState is AsyncError)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          saveState.message,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
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
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _segmentedToggle({
    required bool allowCustomMaster,
    required VoidCallback onSelectExisting,
    required VoidCallback onSelectCustom,
  }) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          // Sliding Green Selector
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            alignment: allowCustomMaster
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width / 2 - 32, // fills half
              decoration: BoxDecoration(
                color: Color(0xFF6F8F72),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          // Full clickable halves
          Row(
            children: [
              // Existing
              Expanded(
                child: GestureDetector(
                  onTap: onSelectExisting,
                  behavior:
                      HitTestBehavior.translucent, // makes entire area tappable
                  child: Center(
                    child: Text(
                      'Existing',
                      style: TextStyle(
                        color: allowCustomMaster
                            ? Colors.grey.shade700
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // Custom
              Expanded(
                child: GestureDetector(
                  onTap: onSelectCustom,
                  behavior: HitTestBehavior.translucent,
                  child: Center(
                    child: Text(
                      'Custom',
                      style: TextStyle(
                        color: allowCustomMaster
                            ? Colors.white
                            : Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
