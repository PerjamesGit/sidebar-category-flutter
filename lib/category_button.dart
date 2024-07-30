import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'category.dart';

final selectedCategoryProvider = StateProvider<String?>((ref) => null);

class CategoryButton extends HookConsumerWidget {
  final String title;

  const CategoryButton(this.title, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(selectedCategoryProvider);
    final isSelected = category == title;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        /// Scroll to the selected category
        if (isSelected) {
          Scrollable.ensureVisible(
            context,
            alignment: 0.5,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }
      });
    }, [category]);

    return TextButton(
      onPressed: () async {
        final context = ref.read(categoryProvider(title));
        if (context != null) {

          ///scroll to that category
          await Scrollable.ensureVisible(
            context,
            alignment: 0.5,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
          ///update to selected category;
          ref.read(selectedCategoryProvider.notifier).update((state) => title);
        }
      },
      child: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.green : Colors.red),
        textAlign: TextAlign.center,
      ),
    );
  }
}
