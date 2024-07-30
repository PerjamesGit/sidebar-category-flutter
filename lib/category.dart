import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrolling_demo/menu_category.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'category_button.dart';

final categoryProvider = StateProviderFamily<BuildContext?, String>((ref, arg) {
  return null;
});

class Category extends HookConsumerWidget {
  final MenuCategory menuCategory;

  const Category({
    super.key,
    required this.menuCategory,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref
            .read(categoryProvider(menuCategory.name).notifier)
            .update((state) => context);
      });
      return null;
    }, []);

    return VisibilityDetector(
      key: Key(menuCategory.name),
      onVisibilityChanged: (VisibilityInfo info) {
        print(menuCategory.name);
        // print(info.visibleFraction);
        // print(info.size);
        // print(info.visibleBounds);
        if (info.visibleFraction > 0.9) {
          // update selectedCategoryProvider
          // ref
          //     .read(selectedCategoryProvider.notifier)
          //     .update((state) => menuCategory.name);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              menuCategory.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            ...menuCategory.menuItems.map(
              (e) => ListTile(
                title: Text(e.name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
