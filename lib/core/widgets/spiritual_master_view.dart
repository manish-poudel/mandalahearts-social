// import 'package:flutter/material.dart';
// import 'package:mandalahearts/models/app_user/app_user.dart';

// class SpiritualMastersView extends StatelessWidget {
//   final List<SpiritualMaster> spiritualMasters;

//   const SpiritualMastersView({super.key, required this.spiritualMasters});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           color: theme.colorScheme.surfaceVariant.withOpacity(0.4),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           children: List.generate(spiritualMasters.length, (index) {
//             final item = spiritualMasters[index];

//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: theme.colorScheme.primary.withOpacity(0.12),
//                       ),
//                       child: Icon(
//                         Icons.self_improvement_outlined,
//                         size: 18,
//                         color: theme.colorScheme.primary,
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Master',
//                             style: theme.textTheme.bodySmall?.copyWith(
//                               color: theme.hintColor,
//                             ),
//                           ),
//                           const SizedBox(height: 2),
//                           Text(item.name, style: theme.textTheme.bodyMedium),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: theme.colorScheme.primary.withOpacity(0.12),
//                       ),
//                       child: Icon(
//                         Icons.account_balance_outlined,
//                         size: 18,
//                         color: theme.colorScheme.primary,
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Affiliation',
//                             style: theme.textTheme.bodySmall?.copyWith(
//                               color: theme.hintColor,
//                             ),
//                           ),
//                           const SizedBox(height: 2),
//                           Text(item.id, style: theme.textTheme.bodyMedium),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 6),
//                 Text(item.photoUrl, style: theme.textTheme.bodyMedium),
//                 if (index != spiritualMasters.length - 1) ...[
//                   const SizedBox(height: 16),
//                   Divider(color: theme.colorScheme.onSurface.withAlpha(120)),
//                   const SizedBox(height: 16),
//                 ],
//               ],
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
