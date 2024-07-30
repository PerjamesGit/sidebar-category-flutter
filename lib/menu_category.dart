import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'menu_item.dart';

final menuCategoriesProvider = FutureProvider((ref){
  return [
    MenuCategory('Refreshment', [
      MenuItem('Cappuccino', 3.50),
      MenuItem('Latte', 3.50),
      MenuItem('Espresso', 2.50),
      MenuItem('Tea', 2.00),
      MenuItem('Hot Chocolate', 3.00),
    ]),
    MenuCategory('Pastries', [
      MenuItem('Croissant', 2.50),
      MenuItem('Cinnamon Roll', 2.00),
      MenuItem('Chocolate Chip Cookie', 1.50),
      MenuItem('Blueberry Muffin', 2.00),
      MenuItem('Donut', 2.00),
    ]),
    MenuCategory('Lunch', [
      MenuItem('Turkey Sandwich', 5.00),
      MenuItem('Chicken Wrap', 6.50),
    ]),
    MenuCategory('Drinks', [
      MenuItem('Water', 1.00),
      MenuItem('Soda', 1.50),
    ]),
    MenuCategory('Desserts', [
      MenuItem('Ice Cream', 2.50),
      MenuItem('Cake', 3.00),
      MenuItem('Pie', 3.00),
      MenuItem('Cupcake', 2.00),
      MenuItem('Brownie', 2.00),
    ]),
    MenuCategory('Snacks', [
      MenuItem('Chips', 1.50),
      MenuItem('Pretzels', 1.50),
      MenuItem('Fruit Cup', 2.00),
      MenuItem('Yogurt', 2.00),
      MenuItem('Granola Bar', 1.50),
    ]),
  ];
});

class MenuCategory {
  String name;
  List<MenuItem> menuItems;

  MenuCategory(this.name, this.menuItems);
}
