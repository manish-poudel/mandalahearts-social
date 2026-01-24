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

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _clearEditMode,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.spiritualMasters.length,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 100, right: 16),
          child: Divider(
            height: 1,
            color: Theme.of(context).dividerColor.withAlpha(30),
          ),
        ),
        itemBuilder: (context, index) {
          final master = widget.spiritualMasters[index];
          final bool isEditing = _activeEditIndex == index;
          final bool hasImage =
              master.photoUrl != null && master.photoUrl!.isNotEmpty;

          return InkWell(
            onLongPress: widget.onDelete == null
                ? null
                : () {
                    Feedback.forLongPress(context);
                    setState(() => _activeEditIndex = index);
                  },
            onTap: isEditing ? _clearEditMode : null,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: index > 0 ? 10 : 4,
              ),
              child: Row(
                children: [
                  // 1. Rectangular Card Image
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade100,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: hasImage
                          ? Image.network(
                              master.photoUrl!,
                              fit: BoxFit.cover,
                              errorBuilder: (c, e, s) => _buildPlaceholder(),
                            )
                          : _buildPlaceholder(),
                    ),
                  ),

                  const SizedBox(width: 16),

                  // 2. Name Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            color: Theme.of(context).hintColor.withOpacity(0.5),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          master.name,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                        ),
                      ],
                    ),
                  ),

                  // 3. Conditional Delete Button
                  if (isEditing)
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        widget.onDelete?.call(master);
                        _clearEditMode();
                      },
                    )
                  else
                    SizedBox.shrink(),
                  // Icon(
                  //   Icons.chevron_right,
                  //   size: 20,
                  //   color: Colors.grey.shade300,
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey.shade200,
      child: Icon(Icons.person, color: Colors.grey.shade400, size: 30),
    );
  }
}
