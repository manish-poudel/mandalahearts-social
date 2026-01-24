import 'package:flutter/material.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';

class SpiritualMastersView extends StatefulWidget {
  final List<SpiritualMaster> spiritualMasters;
  final Function(SpiritualMaster)? onDelete;

  const SpiritualMastersView({
    super.key,
    required this.spiritualMasters,
    this.onDelete,
  });

  @override
  State<SpiritualMastersView> createState() => _SpiritualMastersViewState();
}

class _SpiritualMastersViewState extends State<SpiritualMastersView> {
  int? _activeEditIndex;

  void _clearEditMode() {
    if (_activeEditIndex != null) {
      setState(() => _activeEditIndex = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.spiritualMasters.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        SizedBox(
          height: 110,
          // Wrap with GestureDetector to catch taps on the list background
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _clearEditMode,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: widget.spiritualMasters.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final master = widget.spiritualMasters[index];
                final bool isEditing = _activeEditIndex == index;
                final bool hasImage =
                    master.photoUrl != null && master.photoUrl!.isNotEmpty;

                return GestureDetector(
                  onLongPress: widget.onDelete == null
                      ? null
                      : () {
                          Feedback.forLongPress(context);
                          setState(() => _activeEditIndex = index);
                        },
                  // If we are in edit mode, tapping the card itself closes it
                  onTap: isEditing ? _clearEditMode : null,
                  child: Stack(
                    clipBehavior: Clip
                        .none, // Allows button to pop out slightly if needed
                    children: [
                      // Square Card
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              // 1. Base Image
                              hasImage
                                  ? Image.network(
                                      master.photoUrl!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (c, e, s) =>
                                          _buildPlaceholder(),
                                    )
                                  : _buildPlaceholder(),

                              // 2. Name Overlay (Bottom or Top)
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 4,
                                  ),
                                  color: Colors.black.withOpacity(0.5),
                                  child: Text(
                                    master.name,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors
                                          .white, // Fixed: white text for dark bg
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),

                              // 3. Darkening Overlay when editing
                              if (isEditing)
                                Container(color: Colors.black.withOpacity(0.3)),
                            ],
                          ),
                        ),
                      ),

                      // 4. Delete Button (Top-Right)
                      if (isEditing)
                        Positioned(
                          top: -6, // Slightly offset to pop out of the card
                          right: -6,
                          child: GestureDetector(
                            onTap: () {
                              widget.onDelete?.call(master);
                              _clearEditMode();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.close, // Or delete_forever
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey.shade300,
      child: const Icon(Icons.person, color: Colors.grey, size: 32),
    );
  }
}
