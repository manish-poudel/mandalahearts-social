import 'package:flutter/material.dart';

class ChipSelectorFormField<T> extends FormField<ChipOption<T>> {
  ChipSelectorFormField({
    super.key,
    required List<ChipOption<T>> options,
    super.initialValue,
    super.validator,
    super.autovalidateMode = AutovalidateMode.disabled,
    String? label,
    ValueChanged<ChipOption<T>?>? onChanged,
  }) : super(
         builder: (FormFieldState<ChipOption<T>> field) {
           final theme = Theme.of(field.context);

           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               if (label != null) ...[
                 Text(
                   label,
                   style: theme.textTheme.bodyMedium?.copyWith(
                     fontWeight: FontWeight.w500,
                   ),
                 ),
                 const SizedBox(height: 12),
               ],

               Wrap(
                 spacing: 12,
                 runSpacing: 8,
                 children: options.map((option) {
                   final selected = field.value?.value == option.value;

                   return ChoiceChip(
                     label: Text(option.label),
                     selected: selected,
                     onSelected: (_) {
                       field.didChange(option);
                       onChanged?.call(option);
                     },
                   );
                 }).toList(),
               ),

               if (field.hasError) ...[
                 const SizedBox(height: 8),
                 Text(
                   field.errorText!,
                   style: TextStyle(
                     color: theme.colorScheme.error,
                     fontSize: 12,
                   ),
                 ),
               ],
             ],
           );
         },
       );
}

class ChipOption<T> {
  final T value;
  final String label;

  const ChipOption({required this.value, required this.label});
}
